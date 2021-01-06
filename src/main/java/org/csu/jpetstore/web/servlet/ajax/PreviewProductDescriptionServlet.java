package org.csu.jpetstore.web.servlet.ajax;

import org.csu.jpetstore.domain.Product;
import org.csu.jpetstore.service.CatalogService;
import org.csu.jpetstore.service.impl.CatalogServiceImpl;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PreviewProductDescriptionServlet extends HttpServlet {
    CatalogService catalogService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JSONObject jsonObject = new JSONObject();
        String id = req.getParameter("id");
        catalogService = new CatalogServiceImpl();
        Product product = catalogService.getProduct(id);
        if (product != null) {
            jsonObject.put("name", product.getName());
            jsonObject.put("productId", product.getProductId());
            jsonObject.put("categoryId", product.getCategoryId());
            jsonObject.put("description", product.getDescription());
            jsonObject.put("picture", product.getPicture());
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("application/json; charset=utf-8");
            resp.getWriter().write(jsonObject.toString());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
