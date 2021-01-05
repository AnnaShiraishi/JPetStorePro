package org.csu.jpetstore.web.servlet;

import org.csu.jpetstore.domain.Account;
import org.csu.jpetstore.domain.Cart;
import org.csu.jpetstore.domain.Order;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class CheckoutServlet extends HttpServlet {
    private static final String CHECK_OUT = "/WEB-INF/cart/Checkout.jsp";
    private static final String CART = "/WEB-INF/cart/Cart.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        Account account = (Account) session.getAttribute("account");
        Boolean authenticated = (Boolean) session.getAttribute("authenticated");
        if(account == null || !authenticated) {
            req.setAttribute("message", "Please Login in!");
            req.getRequestDispatcher(CART).forward(req, resp);
        }else if(cart != null) {
            Order order = new Order();
            order.initOrder(account, cart);
            session.setAttribute("order", order);
            req.getRequestDispatcher(CHECK_OUT).forward(req, resp);
        }else{
            req.setAttribute("message", "Server Error");
            req.getRequestDispatcher(CART).forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
