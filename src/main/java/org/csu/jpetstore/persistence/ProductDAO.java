package org.csu.jpetstore.persistence;

import org.csu.jpetstore.domain.Product;

import java.util.List;

public interface ProductDAO {

    List<Product> getProductListByCategory(String categoryId);

    Product getProduct(String productId);

    List<Product> searchProductList(String keywords);
}
