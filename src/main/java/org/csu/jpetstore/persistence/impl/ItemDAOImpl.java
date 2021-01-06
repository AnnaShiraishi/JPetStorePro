package org.csu.jpetstore.persistence.impl;

import org.csu.jpetstore.domain.Item;
import org.csu.jpetstore.domain.Product;
import org.csu.jpetstore.persistence.DBUtil;
import org.csu.jpetstore.persistence.ItemDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ItemDAOImpl implements ItemDAO {
    private static final String GET_ITEM_LIST_BY_PRODUCT = "SELECT\n" +
            "\tI.ITEMID,\n" +
            "\tLISTPRICE,\n" +
            "\tUNITCOST,\n" +
            "\tSUPPLIER AS supplierId,\n" +
            "\tI.PRODUCTID AS \"product.productId\",\n" +
            "\tNAME AS \"product.name\",\n" +
            "\tDESCN AS \"product.description\",\n" +
            "\tPICTURE AS \"product.picture\",\n" +
            "\tCATEGORY AS \"product.categoryId\",\n" +
            "\tSTATUS,\n" +
            "\tATTR1 AS attribute1,\n" +
            "\tATTR2 AS attribute2,\n" +
            "\tATTR3 AS attribute3,\n" +
            "\tATTR4 AS attribute4,\n" +
            "\tATTR5 AS attribute5\n" +
            "FROM\n" +
            "\tITEM I,\n" +
            "\tPRODUCT P\n" +
            "WHERE\n" +
            "\tP.PRODUCTID = I.PRODUCTID\n" +
            "AND I.PRODUCTID = ?";
    private static final String GET_ITEM = "SELECT\n" +
            "\tI.ITEMID,\n" +
            "\tLISTPRICE,\n" +
            "\tUNITCOST,\n" +
            "\tSUPPLIER AS supplierId,\n" +
            "\tI.PRODUCTID AS \"product.productId\",\n" +
            "\tNAME AS \"product.name\",\n" +
            "\tDESCN AS \"product.description\",\n" +
            "\tPICTURE AS \"product.picture\",\n" +
            "\tCATEGORY AS \"product.categoryId\",\n" +
            "\tSTATUS,\n" +
            "\tATTR1 AS attribute1,\n" +
            "\tATTR2 AS attribute2,\n" +
            "\tATTR3 AS attribute3,\n" +
            "\tATTR4 AS attribute4,\n" +
            "\tATTR5 AS attribute5,\n" +
            "\tQTY AS quantity\n" +
            "FROM\n" +
            "\tITEM I,\n" +
            "\tINVENTORY V,\n" +
            "\tPRODUCT P\n" +
            "WHERE\n" +
            "\tP.PRODUCTID = I.PRODUCTID\n" +
            "AND I.ITEMID = V.ITEMID\n" +
            "AND I.ITEMID = ?";
    private static final String GET_INVENTORY_QUANTITY = "SELECT\n" +
            "\tQTY AS\n" +
            "VALUE\n" +
            "\n" +
            "FROM\n" +
            "\tINVENTORY\n" +
            "WHERE\n" +
            "\tITEMID = ?";
    private static final String UPDATE_INVENTORY_QUANTITY = "UPDATE INVENTORY\n" +
            "SET QTY = QTY - ?\n" +
            "WHERE\n" +
            "\tITEMID = ?";

    @Override
    public void updateInventoryQuantity(Map<String, Integer> param) {
        try {
            Connection connection = DBUtil.getConnection();
            for (Map.Entry<String, Integer> entry : param.entrySet()) {
                PreparedStatement pStatement = connection.prepareStatement(UPDATE_INVENTORY_QUANTITY);
                pStatement.setInt(1, entry.getValue());
                pStatement.setString(2, entry.getKey());
                pStatement.executeUpdate();
            }
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public int getInventoryQuantity(String itemId) {
        int value = 0;
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(GET_INVENTORY_QUANTITY);
            pStatement.setString(1, itemId);
            ResultSet resultSet = pStatement.executeQuery();
            if (resultSet.next()) {
                value = resultSet.getInt("value");
            }
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return value;
    }

    @Override
    public List<Item> getItemListByProduct(String productId) {
        List<Item> itemList = new ArrayList<>();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(GET_ITEM_LIST_BY_PRODUCT);
            pStatement.setString(1, productId);
            ResultSet resultSet = pStatement.executeQuery();
            while (resultSet.next()) {
                Item item = new Item();
                Product product = new Product();
                item.setItemId(resultSet.getString("itemid"));
                item.setListPrice(resultSet.getBigDecimal("listprice"));
                item.setUnitCost(resultSet.getBigDecimal("unitcost"));
                item.setSupplierId(resultSet.getInt("supplierid"));
                product.setProductId(resultSet.getString("product.productid"));
                product.setName(resultSet.getString("product.name"));
                product.setDescription(resultSet.getString("product.description"));
                product.setCategoryId(resultSet.getString("product.categoryid"));
                product.setPicture(resultSet.getString("product.picture"));
                item.setStatus(resultSet.getString("status"));
                item.setAttribute1(resultSet.getString("attribute1"));
                item.setAttribute1(resultSet.getString("attribute2"));
                item.setAttribute1(resultSet.getString("attribute3"));
                item.setAttribute1(resultSet.getString("attribute4"));
                item.setAttribute1(resultSet.getString("attribute5"));
                item.setProduct(product);
                itemList.add(item);
            }
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
            itemList = null;
        }
        return itemList;
    }

    @Override
    public Item getItem(String itemId) {
        Item item = new Item();
        Product product = new Product();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(GET_ITEM);
            pStatement.setString(1, itemId);
            ResultSet resultSet = pStatement.executeQuery();
            if (resultSet.next()) {
                item.setItemId(resultSet.getString("itemid"));
                item.setListPrice(resultSet.getBigDecimal("listprice"));
                item.setUnitCost(resultSet.getBigDecimal("unitcost"));
                item.setSupplierId(resultSet.getInt("supplierid"));
                product.setProductId(resultSet.getString("product.productid"));
                product.setName(resultSet.getString("product.name"));
                product.setDescription(resultSet.getString("product.description"));
                product.setCategoryId(resultSet.getString("product.categoryid"));
                product.setPicture(resultSet.getString("product.picture"));
                item.setStatus(resultSet.getString("status"));
                item.setAttribute1(resultSet.getString("attribute1"));
                item.setAttribute2(resultSet.getString("attribute2"));
                item.setAttribute3(resultSet.getString("attribute3"));
                item.setAttribute4(resultSet.getString("attribute4"));
                item.setAttribute5(resultSet.getString("attribute5"));
                item.setQuantity(resultSet.getInt("quantity"));
                item.setProduct(product);
            }
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return item;
    }
}
