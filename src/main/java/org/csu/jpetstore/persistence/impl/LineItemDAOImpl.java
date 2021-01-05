package org.csu.jpetstore.persistence.impl;

import org.csu.jpetstore.domain.LineItem;
import org.csu.jpetstore.persistence.DBUtil;
import org.csu.jpetstore.persistence.LineItemDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class LineItemDAOImpl implements LineItemDAO {
    private static final String GET_LINE_ITEMS_BY_ORDER_ID = "SELECT\n" +
            "\tORDERID,\n" +
            "\tLINENUM AS lineNumber,\n" +
            "\tITEMID,\n" +
            "\tQUANTITY,\n" +
            "\tUNITPRICE\n" +
            "FROM\n" +
            "\tLINEITEM\n" +
            "WHERE\n" +
            "\tORDERID = ?";
    private static final String INSERT_LINE_ITEM = "INSERT INTO LINEITEM (\n" +
            "\tORDERID,\n" +
            "\tLINENUM,\n" +
            "\tITEMID,\n" +
            "\tQUANTITY,\n" +
            "\tUNITPRICE\n" +
            ")\n" +
            "VALUES\n" +
            "\t(?, ?, ?, ?, ?)";
    @Override
    public List<LineItem> getLineItemsByOrderId(int orderId) {
        List<LineItem> lineItemList = new ArrayList<>();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(GET_LINE_ITEMS_BY_ORDER_ID);
            pStatement.setInt(1, orderId);
            ResultSet resultSet = pStatement.executeQuery();
            while (resultSet.next()){
                LineItem lineItem = new LineItem();
                lineItem.setOrderId(resultSet.getInt("orderid"));
                lineItem.setLineNumber(resultSet.getInt("linenumber"));
                lineItem.setItemId(resultSet.getString("itemid"));
                lineItem.setQuantity(resultSet.getInt("quantity"));
                lineItem.setUnitPrice(resultSet.getBigDecimal("unitprice"));
                lineItemList.add(lineItem);
            }
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
            lineItemList = null;
        }
        return lineItemList;
    }

    @Override
    public void insertLineItem(LineItem lineItem) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(INSERT_LINE_ITEM);
            pStatement.setInt(1, lineItem.getOrderId());
            pStatement.setInt(2, lineItem.getLineNumber());
            pStatement.setString(3, lineItem.getItemId());
            pStatement.setInt(4, lineItem.getQuantity());
            pStatement.setBigDecimal(5, lineItem.getUnitPrice());

            pStatement.executeUpdate();
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
