package org.csu.jpetstore.web.servlet;

import org.apache.log4j.Logger;
import org.csu.jpetstore.domain.Order;
import org.csu.jpetstore.service.OrderService;
import org.csu.jpetstore.service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ViewOrderServlet extends HttpServlet {

    private OrderService orderService;
    private static final String CONFIRM_ORDER = "/WEB-INF/order/ConfirmOrder.jsp";
    private static final String SHIPPING_FORM = "/WEB-INF/order/ShippingForm.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        orderService = new OrderServiceImpl();
        HttpSession session = req.getSession();
        String shippingAddressRequired = req.getParameter("shippingAddressRequired");
        Order order = (Order) session.getAttribute("order");
        String cardType = req.getParameter("cardType");
        String creditCard = req.getParameter("creditCard");
        String expiryDate = req.getParameter("expiryDate");
        String billToFirstName = req.getParameter("billToFirstName");
        String billToLastName = req.getParameter("billToLastName");
        String billAddress1 = req.getParameter("billAddress1");
        String billAddress2 = req.getParameter("billAddress2");
        String billCity = req.getParameter("billCity");
        String billState = req.getParameter("billState");
        String billZip = req.getParameter("billZip");
        String billCountry = req.getParameter("billCountry");
        order.setCardType(cardType);
        order.setCreditCard(creditCard);
        order.setExpiryDate(expiryDate);
        order.setBillToFirstName(billToFirstName);
        order.setBillToLastName(billToLastName);
        order.setBillAddress1(billAddress1);
        order.setBillAddress2(billAddress2);
        order.setBillCity(billCity);
        order.setBillState(billState);
        order.setBillZip(billZip);
        order.setBillCountry(billCountry);
        if (shippingAddressRequired != null) {
            order.setShippingAddressRequired(true);
            req.setAttribute("order", order);
            req.getRequestDispatcher(SHIPPING_FORM).forward(req, resp);
        } else {
            order.setShippingAddressRequired(false);
            req.setAttribute("order", order);
            req.getRequestDispatcher(CONFIRM_ORDER).forward(req, resp);
        }
    }
}
