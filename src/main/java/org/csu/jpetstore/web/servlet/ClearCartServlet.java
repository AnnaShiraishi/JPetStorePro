package org.csu.jpetstore.web.servlet;

import org.apache.log4j.Logger;
import org.csu.jpetstore.domain.Account;
import org.csu.jpetstore.service.CartService;
import org.csu.jpetstore.service.impl.CartServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ClearCartServlet extends HttpServlet {

    private static final String CART = "/WEB-INF/cart/Cart.jsp";
    private CartService cartService;
    private static Logger logger = Logger.getLogger(Class.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        cartService = new CartServiceImpl();
        HttpSession session = req.getSession();
        if (session.getAttribute("cart") != null) {
            session.setAttribute("cart", null);
            if (session.getAttribute("account") != null) {
                Account account = (Account) session.getAttribute("account");
                cartService.deleteCartByAccount(account);
                logger.info(String.format("User (%s) Clear His Cart.", account.getUsername()));
                session.setAttribute("cart", null);
            }
        }
        resp.sendRedirect(req.getContextPath() + "/cart");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
