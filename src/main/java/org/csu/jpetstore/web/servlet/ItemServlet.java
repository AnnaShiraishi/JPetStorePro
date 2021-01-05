package org.csu.jpetstore.web.servlet;

import org.apache.log4j.Logger;
import org.csu.jpetstore.domain.Account;
import org.csu.jpetstore.domain.Item;
import org.csu.jpetstore.domain.Product;
import org.csu.jpetstore.service.CatalogService;
import org.csu.jpetstore.service.impl.CatalogServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ItemServlet extends HttpServlet {
    private static final String ITEM = "/WEB-INF/catalog/Item.jsp";
    private CatalogService catalogService;
    private static Logger logger = Logger.getLogger(Class.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        catalogService = new CatalogServiceImpl();
        String id = req.getParameter("id");
        Item item =  catalogService.getItem(id);
        Product product = item.getProduct();
        req.setAttribute("item", item);
        req.setAttribute("product", product);
        req.getRequestDispatcher(ITEM).forward(req, resp);
        HttpSession session = req.getSession();
        if (session.getAttribute("account") != null) {
            Account account = (Account) session.getAttribute("account");
            logger.info(String.format("User (%s) View the Item (%s).", account.getUsername(), item));
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
