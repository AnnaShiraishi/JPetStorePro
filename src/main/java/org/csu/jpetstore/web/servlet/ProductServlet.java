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
import java.util.List;

public class ProductServlet extends HttpServlet {
    private static final String PRODUCT = "/WEB-INF/catalog/Product.jsp";
    private CatalogService catalogService;
    private static Logger logger = Logger.getLogger(Class.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        catalogService = new CatalogServiceImpl();
        String id = req.getParameter("id");
        List<Item> itemList = catalogService.getItemListByProduct(id);
        Product product = catalogService.getProduct(id);
        req.setAttribute("itemList", itemList);
        req.setAttribute("product", product);
        req.getRequestDispatcher(PRODUCT).forward(req, resp);
        HttpSession session = req.getSession();
        if (session.getAttribute("account") != null) {
            Account account = (Account) session.getAttribute("account");
            logger.info(String.format("User (%s) View the Product (%s).", account.getUsername(), product));
        }
        System.out.print(product.getPicture());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
