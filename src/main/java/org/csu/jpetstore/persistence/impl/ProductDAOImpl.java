package org.csu.jpetstore.persistence.impl;

import org.csu.jpetstore.domain.Product;
import org.csu.jpetstore.persistence.DBUtil;
import org.csu.jpetstore.persistence.ProductDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAOImpl implements ProductDAO {
    private static final String GET_PRODUCT = "SELECT\n" +
            "\tPRODUCTID,\n" +
            "\tNAME,\n" +
            "\tDESCN AS description,\n" +
            "\tCATEGORY AS categoryId,\n" +
            "\tPICTURE\n" +
            "FROM\n" +
            "\tPRODUCT\n" +
            "WHERE\n" +
            "\tPRODUCTID = ?";
    private static final String GET_PRODUCT_LIST_BY_CATEGORY = "SELECT\n" +
            "\tPRODUCTID,\n" +
            "\tNAME,\n" +
            "\tDESCN AS description,\n" +
            "\tCATEGORY AS categoryId,\n" +
            "\tPICTURE\n" +
            "FROM\n" +
            "\tPRODUCT\n" +
            "WHERE\n" +
            "\tCATEGORY = ?";
    private static final String SEARCH_PRODUCT_LIST = "SELECT\n" +
            "\tPRODUCTID,\n" +
            "\tNAME,\n" +
            "\tDESCN AS description,\n" +
            "\tCATEGORY AS categoryId,\n" +
            "\tPICTURE\n" +
            "FROM\n" +
            "\tPRODUCT\n" +
            "WHERE\n" +
            "\tlower(NAME) LIKE ?";

    @Override
    public List<Product> getProductListByCategory(String categoryId) {
        List<Product> productList = new ArrayList<>();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(GET_PRODUCT_LIST_BY_CATEGORY);
            pStatement.setString(1, categoryId);
            ResultSet resultSet = pStatement.executeQuery();

            while (resultSet.next()) {
                Product product = new Product();
                product.setProductId(resultSet.getString("productid"));
                product.setName(resultSet.getString("name"));
                product.setDescription(resultSet.getString("description"));
                product.setCategoryId(resultSet.getString("categoryid"));
                product.setPicture(resultSet.getString("picture"));
                productList.add(product);
            }
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
            productList = null;
        }
        return productList;
    }

    @Override
    public Product getProduct(String productId) {
        Product product = new Product();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(GET_PRODUCT);
            pStatement.setString(1, productId);
            ResultSet resultSet = pStatement.executeQuery();
            if (resultSet.next()) {
                product.setProductId(resultSet.getString("productid"));
                product.setName(resultSet.getString("name"));
                product.setDescription(resultSet.getString("description"));
                product.setCategoryId(resultSet.getString("categoryid"));
                product.setPicture(resultSet.getString("picture"));
            } else {
                product = null;
            }
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
            product = null;
        }
        return product;
    }

    @Override
    public List<Product> searchProductList(String keywords)  {
        List<Product> productList = new ArrayList<>();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(SEARCH_PRODUCT_LIST);
            pStatement.setString(1, keywords);
            ResultSet resultSet = pStatement.executeQuery();
            while (resultSet.next()){
                Product product = new Product();
                product.setProductId(resultSet.getString("productid"));
                product.setName(resultSet.getString("name"));
                product.setDescription(resultSet.getString("description"));
                product.setCategoryId(resultSet.getString("categoryid"));
                productList.add(product);
            }
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return productList;
    }
}
