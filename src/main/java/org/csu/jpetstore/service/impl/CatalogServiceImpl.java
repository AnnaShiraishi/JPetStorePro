package org.csu.jpetstore.service.impl;

import org.csu.jpetstore.domain.Category;
import org.csu.jpetstore.domain.Item;
import org.csu.jpetstore.domain.Product;
import org.csu.jpetstore.persistence.CategoryDAO;
import org.csu.jpetstore.persistence.ItemDAO;
import org.csu.jpetstore.persistence.ProductDAO;
import org.csu.jpetstore.persistence.impl.ItemDAOImpl;
import org.csu.jpetstore.persistence.impl.ProductDAOImpl;
import org.csu.jpetstore.service.CatalogService;

import java.util.List;

public class CatalogServiceImpl implements CatalogService {

    private CategoryDAO categoryDAO;
    private ItemDAO itemDAO;
    private ProductDAO productDAO;

    @Override
    public List<Category> getCategoryList() {
        return categoryDAO.getCategoryList();
    }

    @Override
    public Category getCategory(String categoryId) {
        return categoryDAO.getCategory(categoryId);
    }

    @Override
    public Product getProduct(String productId) {
        productDAO = new ProductDAOImpl();
        return productDAO.getProduct(productId);
    }

    @Override
    public List<Product> getProductListByCategory(String categoryId) {
        productDAO = new ProductDAOImpl();
        return productDAO.getProductListByCategory(categoryId);
    }

    @Override
    public List<Product> searchProductList(String keyword) {
        productDAO = new ProductDAOImpl();
        return productDAO.searchProductList("%" + keyword.toLowerCase() + "%");
    }

    @Override
    public List<Item> getItemListByProduct(String productId) {
        itemDAO = new ItemDAOImpl();
        return itemDAO.getItemListByProduct(productId);
    }

    @Override
    public Item getItem(String itemId) {
        itemDAO = new ItemDAOImpl();
        return itemDAO.getItem(itemId);
    }

    @Override
    public boolean isItemInStock(String itemId) {
        itemDAO = new ItemDAOImpl();
        return itemDAO.getInventoryQuantity(itemId) > 0;
    }
}
