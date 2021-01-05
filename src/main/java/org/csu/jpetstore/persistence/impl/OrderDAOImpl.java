package org.csu.jpetstore.persistence.impl;

import org.csu.jpetstore.domain.Order;
import org.csu.jpetstore.persistence.DBUtil;
import org.csu.jpetstore.persistence.OrderDAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderDAOImpl implements OrderDAO {
    private static final String GET_ORDER = "SELECT\n" +
            "\tBILLADDR1 AS billAddress1,\n" +
            "\tBILLADDR2 AS billAddress2,\n" +
            "\tBILLCITY,\n" +
            "\tBILLCOUNTRY,\n" +
            "\tBILLSTATE,\n" +
            "\tBILLTOFIRSTNAME,\n" +
            "\tBILLTOLASTNAME,\n" +
            "\tBILLZIP,\n" +
            "\tSHIPADDR1 AS shipAddress1,\n" +
            "\tSHIPADDR2 AS shipAddress2,\n" +
            "\tSHIPCITY,\n" +
            "\tSHIPCOUNTRY,\n" +
            "\tSHIPSTATE,\n" +
            "\tSHIPTOFIRSTNAME,\n" +
            "\tSHIPTOLASTNAME,\n" +
            "\tSHIPZIP,\n" +
            "\tCARDTYPE,\n" +
            "\tCOURIER,\n" +
            "\tCREDITCARD,\n" +
            "\tEXPRDATE AS expiryDate,\n" +
            "\tLOCALE,\n" +
            "\tORDERDATE,\n" +
            "\tORDERS.ORDERID,\n" +
            "\tTOTALPRICE,\n" +
            "\tUSERID AS username,\n" +
            "\tSTATUS\n" +
            "FROM\n" +
            "\tORDERS,\n" +
            "\tORDERSTATUS\n" +
            "WHERE\n" +
            "\tORDERS.ORDERID = ?\n" +
            "AND ORDERS.ORDERID = ORDERSTATUS.ORDERID";
    private static final String GET_ORDER_BY_USERNAME = "SELECT\n" +
            "\tBILLADDR1 AS billAddress1,\n" +
            "\tBILLADDR2 AS billAddress2,\n" +
            "\tBILLCITY,\n" +
            "\tBILLCOUNTRY,\n" +
            "\tBILLSTATE,\n" +
            "\tBILLTOFIRSTNAME,\n" +
            "\tBILLTOLASTNAME,\n" +
            "\tBILLZIP,\n" +
            "\tSHIPADDR1 AS shipAddress1,\n" +
            "\tSHIPADDR2 AS shipAddress2,\n" +
            "\tSHIPCITY,\n" +
            "\tSHIPCOUNTRY,\n" +
            "\tSHIPSTATE,\n" +
            "\tSHIPTOFIRSTNAME,\n" +
            "\tSHIPTOLASTNAME,\n" +
            "\tSHIPZIP,\n" +
            "\tCARDTYPE,\n" +
            "\tCOURIER,\n" +
            "\tCREDITCARD,\n" +
            "\tEXPRDATE AS expiryDate,\n" +
            "\tLOCALE,\n" +
            "\tORDERDATE,\n" +
            "\tORDERS.ORDERID,\n" +
            "\tTOTALPRICE,\n" +
            "\tUSERID AS username,\n" +
            "\tSTATUS\n" +
            "FROM\n" +
            "\tORDERS,\n" +
            "\tORDERSTATUS\n" +
            "WHERE\n" +
            "\tORDERS.USERID = ?\n" +
            "AND ORDERS.ORDERID = ORDERSTATUS.ORDERID\n" +
            "ORDER BY\n" +
            "\tORDERDATE";
    private static final String INSERT_ORDER = "INSERT INTO ORDERS (\n" +
            "\tORDERID,\n" +
            "\tUSERID,\n" +
            "\tORDERDATE,\n" +
            "\tSHIPADDR1,\n" +
            "\tSHIPADDR2,\n" +
            "\tSHIPCITY,\n" +
            "\tSHIPSTATE,\n" +
            "\tSHIPZIP,\n" +
            "\tSHIPCOUNTRY,\n" +
            "\tBILLADDR1,\n" +
            "\tBILLADDR2,\n" +
            "\tBILLCITY,\n" +
            "\tBILLSTATE,\n" +
            "\tBILLZIP,\n" +
            "\tBILLCOUNTRY,\n" +
            "\tCOURIER,\n" +
            "\tTOTALPRICE,\n" +
            "\tBILLTOFIRSTNAME,\n" +
            "\tBILLTOLASTNAME,\n" +
            "\tSHIPTOFIRSTNAME,\n" +
            "\tSHIPTOLASTNAME,\n" +
            "\tCREDITCARD,\n" +
            "\tEXPRDATE,\n" +
            "\tCARDTYPE,\n" +
            "\tLOCALE\n" +
            ")\n" +
            "VALUES\n" +
            "\t(\n" +
            "\t\t?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?\n" +
            "\t)";
    private static final String INSERT_ORDER_STATUS = "INSERT INTO ORDERSTATUS (\n" +
            "\tORDERID,\n" +
            "\tLINENUM,\n" +
            "\tTIMESTAMP,\n" +
            "\tSTATUS\n" +
            ")\n" +
            "VALUES\n" +
            "\t(?, ?, ?, ?)";

    @Override
    public List<Order> getOrdersByUsername(String username) {
        List<Order> orderList = new ArrayList<>();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(GET_ORDER_BY_USERNAME);
            pStatement.setString(1, username);
            ResultSet resultSet = pStatement.executeQuery();
            while (resultSet.next()) {
                Order order = new Order();
                order.setBillAddress1(resultSet.getString("billAddress1"));
                order.setBillAddress2(resultSet.getString("billAddress2"));
                order.setBillCity(resultSet.getString("billcity"));
                order.setBillCountry(resultSet.getString("billcountry"));
                order.setBillState(resultSet.getString("billstate"));
                order.setBillToFirstName(resultSet.getString("billtofirstname"));
                order.setBillToLastName(resultSet.getString("billtolastname"));
                order.setBillZip(resultSet.getString("billzip"));
                order.setShipAddress1(resultSet.getString("shipaddress1"));
                order.setShipAddress2(resultSet.getString("shipaddress2"));
                order.setShipCity(resultSet.getString("shipcity"));
                order.setShipCountry(resultSet.getString("shipcountry"));
                order.setShipState(resultSet.getString("shipstate"));
                order.setShipToFirstName(resultSet.getString("shiptofirstname"));
                order.setShipToLastName(resultSet.getString("shiptolastname"));
                order.setShipZip(resultSet.getString("shipzip"));
                order.setCourier(resultSet.getString("courier"));
                order.setCreditCard(resultSet.getString("creditcard"));
                order.setExpiryDate(resultSet.getString("expirydate"));
                order.setLocale(resultSet.getString("locale"));
                order.setOrderDate(resultSet.getDate("orderdate"));
                order.setOrderId(resultSet.getInt("orderid"));
                order.setTotalPrice(resultSet.getBigDecimal("totalprice"));
                order.setUsername(resultSet.getString("username"));
                order.setStatus(resultSet.getString("status"));
                orderList.add(order);
            }
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
            orderList = null;
        }
        return orderList;
    }

    @Override
    public Order getOrder(int orderId) {
        Order order = new Order();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(GET_ORDER);
            pStatement.setInt(1, orderId);
            ResultSet resultSet = pStatement.executeQuery();
            if (resultSet.next()) {
                order.setBillAddress1(resultSet.getString("billAddress1"));
                order.setBillAddress2(resultSet.getString("billAddress2"));
                order.setBillCity(resultSet.getString("billcity"));
                order.setBillCountry(resultSet.getString("billcountry"));
                order.setBillState(resultSet.getString("billstate"));
                order.setBillToFirstName(resultSet.getString("billtofirstname"));
                order.setBillToLastName(resultSet.getString("billtolastname"));
                order.setBillZip(resultSet.getString("billzip"));
                order.setShipAddress1(resultSet.getString("shipaddress1"));
                order.setShipAddress2(resultSet.getString("shipaddress2"));
                order.setShipCity(resultSet.getString("shipcity"));
                order.setShipCountry(resultSet.getString("shipcountry"));
                order.setShipState(resultSet.getString("shipstate"));
                order.setShipToFirstName(resultSet.getString("shiptofirstname"));
                order.setShipToLastName(resultSet.getString("shiptolastname"));
                order.setShipZip(resultSet.getString("shipzip"));
                order.setCourier(resultSet.getString("courier"));
                order.setCreditCard(resultSet.getString("creditcard"));
                order.setExpiryDate(resultSet.getString("expirydate"));
                order.setLocale(resultSet.getString("locale"));
                order.setOrderDate(resultSet.getDate("orderdate"));
                order.setOrderId(resultSet.getInt("orderid"));
                order.setTotalPrice(resultSet.getBigDecimal("totalprice"));
                order.setUsername(resultSet.getString("username"));
                order.setStatus(resultSet.getString("status"));
            } else {
                order = null;
            }
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
            order = null;
        }
        return order;
    }

    @Override
    public void insertOrder(Order order) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(INSERT_ORDER);
            pStatement.setInt(1, order.getOrderId());
            pStatement.setString(2, order.getUsername());
            pStatement.setTimestamp(3, new java.sql.Timestamp(order.getOrderDate().getTime()));
            pStatement.setString(4, order.getShipAddress1());
            pStatement.setString(5, order.getShipAddress2());
            pStatement.setString(6, order.getShipCity());
            pStatement.setString(7, order.getShipState());
            pStatement.setString(8, order.getShipZip());
            pStatement.setString(9, order.getShipCity());
            pStatement.setString(10, order.getBillAddress1());
            pStatement.setString(11, order.getBillAddress2());
            pStatement.setString(12, order.getBillCity());
            pStatement.setString(13, order.getBillState());
            pStatement.setString(14, order.getBillZip());
            pStatement.setString(15, order.getBillCountry());
            pStatement.setString(16, order.getCourier());
            pStatement.setBigDecimal(17, order.getTotalPrice());
            pStatement.setString(18, order.getBillToFirstName());
            pStatement.setString(19, order.getBillToLastName());
            pStatement.setString(20, order.getShipToFirstName());
            pStatement.setString(21, order.getShipToLastName());
            pStatement.setString(22, order.getCreditCard());
            pStatement.setString(23, order.getExpiryDate());
            pStatement.setString(24, order.getCardType());
            pStatement.setString(25, order.getLocale());
            pStatement.executeUpdate();
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insertOrderStatus(Order order) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(INSERT_ORDER_STATUS);
            pStatement.setInt(1, order.getOrderId());
            pStatement.setInt(2, order.getOrderId());
            pStatement.setDate(3, new Date(order.getOrderDate().getTime()));
            pStatement.setString(4, order.getStatus());

            pStatement.executeUpdate();
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
