package org.csu.jpetstore.web.servlet;

import org.apache.log4j.Logger;
import org.csu.jpetstore.domain.Account;
import org.csu.jpetstore.domain.Cart;
import org.csu.jpetstore.service.CartService;
import org.csu.jpetstore.service.impl.CartServiceImpl;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class IncrementItemServlet extends HttpServlet {
    private CartService cartService;
    private static Logger logger = Logger.getLogger(Class.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        cartService = new CartServiceImpl();
        String id = req.getParameter("id");
        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        cart.incrementQuantityByItemId(id);
        if (session.getAttribute("account") != null) {
            Account account = (Account) session.getAttribute("account");
            cartService.incrementQuantityByItemId(account, id);
            logger.info(String.format("User (%s) Add One More Item (%s).", account.getUsername(), id));
        }
        JSONObject json = new JSONObject();
        json.put("subTotal", cart.getSubTotal());
        json.put("itemTotal", cart.getCartItem(id).getTotal());
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=utf-8");
        resp.getWriter().write(json.toString());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}