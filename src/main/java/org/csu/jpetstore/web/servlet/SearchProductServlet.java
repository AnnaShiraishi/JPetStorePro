package org.csu.jpetstore.web.servlet;

import org.apache.log4j.Logger;
import org.csu.jpetstore.domain.Account;
import org.csu.jpetstore.domain.Product;
import org.csu.jpetstore.service.CatalogService;
import org.csu.jpetstore.service.impl.CatalogServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class SearchProductServlet extends HttpServlet {
    private static final String MAIN = "/WEB-INF/catalog/Main.jsp";
    private static final String SEARCH_PRODUCTS = "/WEB-INF/catalog/SearchProducts.jsp";
    CatalogService catalogService;
    private static Logger logger = Logger.getLogger(Class.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        catalogService = new CatalogServiceImpl();
        String keyword = req.getParameter("keyword");
        if (keyword == null || keyword.length() < 1) {
            req.setAttribute("searchMsg", "Please enter the keyword.");
            req.getRequestDispatcher(MAIN).forward(req, resp);
        } else {
            List<Product> productList = catalogService.searchProductList(keyword.toLowerCase());
            req.setAttribute("productList", productList);
            HttpSession session = req.getSession();
            if (session.getAttribute("account") != null) {
                Account account = (Account) session.getAttribute("account");
                logger.info(String.format("User (%s) Search the Keyword '%s.", account.getUsername(), keyword));
            }
            req.getRequestDispatcher(SEARCH_PRODUCTS).forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
