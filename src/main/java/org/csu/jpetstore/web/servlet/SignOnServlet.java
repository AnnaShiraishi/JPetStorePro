package org.csu.jpetstore.web.servlet;

import com.github.kevinsawicki.http.HttpRequest;
import org.apache.log4j.Logger;
import org.csu.jpetstore.domain.Account;
import org.csu.jpetstore.domain.Cart;
import org.csu.jpetstore.service.AccountService;
import org.csu.jpetstore.service.CartService;
import org.csu.jpetstore.service.impl.AccountServiceImpl;
import org.csu.jpetstore.service.impl.CartServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class SignOnServlet extends HttpServlet {
    private static final String SIGN_ON = "/WEB-INF/account/SignonForm.jsp";
    private AccountService accountService;
    private CartService cartService;
    private static Logger logger = Logger.getLogger(Class.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(SIGN_ON).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        accountService = new AccountServiceImpl();
        cartService = new CartServiceImpl();
        Account account = accountService.getAccount(username, password);
        if (!check(req)) {
            req.setAttribute("message", "Please show me that you are not robot.");
            req.getRequestDispatcher(SIGN_ON).forward(req, resp);
        } else {
            if (account == null) {
                req.setAttribute("message", "Wrong username or wrong password, please try again.");
                req.getRequestDispatcher(SIGN_ON).forward(req, resp);
            } else {
                HttpSession session = req.getSession();
                session.setAttribute("authenticated", true);
                session.setAttribute("account", account);
                Cart currentCart = (Cart) session.getAttribute("cart");
                if (currentCart == null) {
                    Cart cart = cartService.getCartByAccount(account);
                    session.setAttribute("cart", cart);
                } else {
                    cartService.updateCartByAccount(account, currentCart);
                }
                logger.info(String.format("User (%s) Sign In.", account.getUsername()));
                resp.sendRedirect(req.getContextPath() + "/main");

            }
        }

    }

    public boolean check(HttpServletRequest request) {
        String checkCode = request.getParameter("g-recaptcha-response");
        Map<String, Object> map = new HashMap<>();
        map.put("secret", "6Ldoh-EZAAAAAJvL4N3wicYj1efkmZ5OW1tByMUY");
        map.put("response", checkCode);
        String resp =HttpRequest.get("https://www.recaptcha.net/recaptcha/api/siteverify").form(map).body();
        return resp.contains("\"success\": true");
    }
}
