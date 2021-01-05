package org.csu.jpetstore.persistence.impl;

import org.csu.jpetstore.domain.Category;
import org.csu.jpetstore.persistence.CategoryDAO;
import org.csu.jpetstore.persistence.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAOImpl implements CategoryDAO {
    final static String GET_CATEGORY = "SELECT\n" +
            "\tCATID AS categoryId,\n" +
            "\tNAME,\n" +
            "\tDESCN AS description\n" +
            "FROM\n" +
            "\tCATEGORY\n" +
            "WHERE\n" +
            "\tCATID = ?";
    final static String GET_CATEGORY_LIST = "SELECT\n" +
            "\tCATID AS categoryId,\n" +
            "\tNAME,\n" +
            "\tDESCN AS description\n" +
            "FROM\n" +
            "\tCATEGORY";

    @Override
    public List<Category> getCategoryList()  {
        List<Category> categoryList = new ArrayList<>();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(GET_CATEGORY_LIST);
            ResultSet resultSet = pStatement.executeQuery();
            while (resultSet.next()) {
                Category category = new Category();
                category.setCategoryId(resultSet.getString("categoryId"));
                category.setName(resultSet.getString("NAME"));
                category.setDescription(resultSet.getString("description"));
                categoryList.add(category);
            }
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return categoryList;
    }

    @Override
    public Category getCategory(String categoryId) {
        Category category = new Category();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(GET_CATEGORY);
            pStatement.setString(1, categoryId);
            ResultSet resultSet = pStatement.executeQuery();
            if (resultSet.next()) {
                category.setCategoryId(resultSet.getString("categoryId"));
                category.setName(resultSet.getString("NAME"));
                category.setDescription("description");
            }
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
            category = null;
        }
        return category;
    }
}
