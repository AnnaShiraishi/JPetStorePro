package org.csu.jpetstore.persistence.impl;

import org.csu.jpetstore.domain.Account;
import org.csu.jpetstore.domain.Cart;
import org.csu.jpetstore.domain.CartItem;
import org.csu.jpetstore.domain.Item;
import org.csu.jpetstore.persistence.CartDAO;
import org.csu.jpetstore.persistence.DBUtil;
import org.csu.jpetstore.persistence.ItemDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Iterator;

public class CartDAOImpl implements CartDAO {
    private static final String GET_CART_BY_ACCOUNT = "SELECT\n" +
            "\t*\n" +
            "FROM\n" +
            "\tCART\n" +
            "WHERE\n" +
            "\tUSERID = ?";

    private static final String ADD_ITEM = "INSERT INTO CART (USERID, ITEMID, QUANTITY)\n" +
            "VALUES\n" +
            "\t(?, ?, ?);";

    private static final String REMOVE_ITEM_BY_ID = "DELETE\n" +
            "FROM\n" +
            "\tCART\n" +
            "WHERE\n" +
            "\t(USERID = ?)\n" +
            "AND (ITEMID = ?);";

    private static final String INCREMENT_QUANTITY_BY_ITEM_ID = "UPDATE CART\n" +
            "SET QUANTITY = QUANTITY + 1\n" +
            "WHERE\n" +
            "\t(USERID = ?)\n" +
            "AND (ITEMID = ?);";

    private static final String DECREMENT_QUANTITY_BY_ITEM_ID = "UPDATE CART\n" +
            "SET QUANTITY = QUANTITY - 1\n" +
            "WHERE\n" +
            "\t(USERID = ?)\n" +
            "AND (ITEMID = ?);";

    private static final String DELETE_CART_BY_ACCOUNT = "DELETE\n" +
            "FROM\n" +
            "\tCART\n" +
            "WHERE\n" +
            "\t(USERID = ?);";

    private static final String CONTAINS_ITEM = "SELECT\n" +
            "\tUSERID,\n" +
            "\tQUANTITY\n" +
            "FROM\n" +
            "\tCART\n" +
            "WHERE\n" +
            "\tUSERID = ?\n" +
            "AND ITEMID = ?;";

    private static final String GET_ITEM = "SELECT\n" +
            "\tQUANTITY\n" +
            "FROM\n" +
            "\tCART\n" +
            "WHERE\n" +
            "\tUSERID = ?\n" +
            "AND ITEMID = ?;";

    @Override
    public Cart getCartByAccount(Account account) {
        Cart cart = new Cart();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(GET_CART_BY_ACCOUNT);
            pStatement.setString(1, account.getUsername());
            ResultSet resultSet = pStatement.executeQuery();
            ItemDAO itemDAO = new ItemDAOImpl();
            while (resultSet.next()) {
                Item item = itemDAO.getItem(resultSet.getString("itemid"));
                int quantity = resultSet.getInt("quantity");
                for (int i = 0; i < quantity; ++i) {
                    cart.addItem(item, true);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cart;
    }

    @Override
    public void addItem(Account account, Item item) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(ADD_ITEM);
            pStatement.setString(1, account.getUsername());
            pStatement.setString(2, item.getItemId());
            pStatement.setInt(3, 1);
            pStatement.executeUpdate();
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void removeItemById(Account account, Item item) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(REMOVE_ITEM_BY_ID);
            pStatement.setString(1, account.getUsername());
            pStatement.setString(2, item.getItemId());
            pStatement.executeUpdate();
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void incrementQuantityByItemId(Account account, Item item) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(INCREMENT_QUANTITY_BY_ITEM_ID);
            pStatement.setString(1, account.getUsername());
            pStatement.setString(2, item.getItemId());
            pStatement.executeUpdate();
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void decrementQuantityByItemId(Account account, Item item) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(GET_ITEM);
            pStatement.setString(1, account.getUsername());
            pStatement.setString(2, item.getItemId());
            ResultSet resultSet = pStatement.executeQuery();
            resultSet.next();
            int quantity = resultSet.getInt("quantity");
            if (quantity <= 1) {
                return;
            }

            pStatement = connection.prepareStatement(DECREMENT_QUANTITY_BY_ITEM_ID);
            pStatement.setString(1, account.getUsername());
            pStatement.setString(2, item.getItemId());
            pStatement.executeUpdate();
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteCartBuAccount(Account account) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(DELETE_CART_BY_ACCOUNT);
            pStatement.setString(1, account.getUsername());
            pStatement.executeUpdate();
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateCartByAccount(Account account, Cart cart) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(DELETE_CART_BY_ACCOUNT);
            pStatement.setString(1, account.getUsername());
            pStatement.executeUpdate();
            DBUtil.closeConnection(connection);

            Iterator<CartItem> cartItemIterator = cart.getAllCartItems();

            while (cartItemIterator.hasNext()) {
                CartItem cartItem = cartItemIterator.next();
                Item item = cartItem.getItem();
                int quantity = cartItem.getQuantity();
                addItem(account, item);
                for (int i = 1; i < quantity; ++i) {
                    incrementQuantityByItemId(account, item);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean containsItem(Account account, Item item) {
        boolean isContains = false;
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(CONTAINS_ITEM);
            pStatement.setString(1, account.getUsername());
            pStatement.setString(2, item.getItemId());
            ResultSet resultSet = pStatement.executeQuery();
            if (resultSet.next()) {
                DBUtil.closeConnection(connection);
                isContains = true;
            } else {
                DBUtil.closeConnection(connection);
                isContains = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isContains;
    }
}
