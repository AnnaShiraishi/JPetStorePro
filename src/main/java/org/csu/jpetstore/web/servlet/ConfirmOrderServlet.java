package org.csu.jpetstore.web.servlet;

import org.apache.log4j.Logger;
import org.csu.jpetstore.domain.Account;
import org.csu.jpetstore.domain.Order;
import org.csu.jpetstore.service.CartService;
import org.csu.jpetstore.service.OrderService;
import org.csu.jpetstore.service.impl.CartServiceImpl;
import org.csu.jpetstore.service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ConfirmOrderServlet extends HttpServlet {

    private OrderService orderService;
    private CartService cartService;
    private static final String VIEW_ORDER = "/WEB-INF/order/ViewOrder.jsp";
    private static final String CONFIRM_ORDER = "/WEB-INF/order/ConfirmOrder.jsp";
    private static Logger logger = Logger.getLogger(Class.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        orderService = new OrderServiceImpl();
        cartService = new CartServiceImpl();
        HttpSession session = req.getSession();
        Order order = (Order) session.getAttribute("order");
        orderService.insertOrder(order);
        Account account = (Account) session.getAttribute("account");
        cartService.deleteCartByAccount(account);
        logger.info(String.format("User (%s) Confirm a New Form.", account.getUsername()));
        logger.info(String.format("User (%s) Clear His Cart.", account.getUsername()));
        session.setAttribute("cart", null);
        req.getRequestDispatcher(VIEW_ORDER).forward(req, resp);
    }
}
