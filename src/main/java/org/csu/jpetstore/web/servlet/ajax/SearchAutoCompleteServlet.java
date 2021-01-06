package org.csu.jpetstore.web.servlet.ajax;

import org.csu.jpetstore.domain.Product;
import org.csu.jpetstore.service.CatalogService;
import org.csu.jpetstore.service.impl.CatalogServiceImpl;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class SearchAutoCompleteServlet extends HttpServlet {
    CatalogService catalogService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        catalogService = new CatalogServiceImpl();
        String keyword = req.getParameter("keyword");
        JSONObject json = new JSONObject();
        System.out.println(keyword);
        if (keyword == null || keyword.length() < 1) {
            json.put("isEmpty", true);
        } else {
            List<Product> productList = catalogService.searchProductList(keyword.toLowerCase());
            if (productList.isEmpty()) {
                json.put("isEmpty", true);
            } else {
                json.put("isEmpty", false);
                JSONArray list = new JSONArray();
                for (Product product:
                     productList) {
                    list.put(product.getName());
                }
                json.put("productList", list);
            }
        }
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=utf-8");
        resp.getWriter().write(json.toString());
    }
}
