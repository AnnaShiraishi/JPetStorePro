package org.csu.jpetstore.service.impl;

import org.csu.jpetstore.domain.Account;
import org.csu.jpetstore.domain.Cart;
import org.csu.jpetstore.domain.Item;
import org.csu.jpetstore.persistence.CartDAO;
import org.csu.jpetstore.persistence.ItemDAO;
import org.csu.jpetstore.persistence.impl.CartDAOImpl;
import org.csu.jpetstore.persistence.impl.ItemDAOImpl;
import org.csu.jpetstore.service.CartService;

public class CartServiceImpl implements CartService {
    private CartDAO cartDAO;
    private ItemDAO itemDAO;

    @Override
    public Cart getCartByAccount(Account account) {
        cartDAO = new CartDAOImpl();
        return cartDAO.getCartByAccount(account);
    }

    @Override
    public void addItem(Account account, Item item) {
        cartDAO = new CartDAOImpl();
        cartDAO.addItem(account, item);
    }

    @Override
    public void removeItemById(Account account, Item item) {
        cartDAO = new CartDAOImpl();
        cartDAO.removeItemById(account, item);
    }

    @Override
    public void incrementQuantityByItemId(Account account, Item item) {
        cartDAO = new CartDAOImpl();
        cartDAO.incrementQuantityByItemId(account, item);
    }

    @Override
    public void decrementQuantityByItemId(Account account, Item item) {
        cartDAO = new CartDAOImpl();
        cartDAO.decrementQuantityByItemId(account, item);
    }

    @Override
    public void addItem(Account account, String itemId) {
        cartDAO = new CartDAOImpl();
        itemDAO = new ItemDAOImpl();
        Item item = itemDAO.getItem(itemId);
        cartDAO.addItem(account, item);
    }

    @Override
    public void removeItemById(Account account, String itemId) {
        cartDAO = new CartDAOImpl();
        itemDAO = new ItemDAOImpl();
        Item item = itemDAO.getItem(itemId);
        cartDAO.removeItemById(account, item);
    }

    @Override
    public void incrementQuantityByItemId(Account account, String itemId) {
        cartDAO = new CartDAOImpl();
        itemDAO = new ItemDAOImpl();
        Item item = itemDAO.getItem(itemId);
        cartDAO.incrementQuantityByItemId(account, item);
    }

    @Override
    public void decrementQuantityByItemId(Account account, String itemId) {
        cartDAO = new CartDAOImpl();
        itemDAO = new ItemDAOImpl();
        Item item = itemDAO.getItem(itemId);
        cartDAO.decrementQuantityByItemId(account, item);
    }

    @Override
    public void deleteCartByAccount(Account account) {
        cartDAO = new CartDAOImpl();
        cartDAO.deleteCartBuAccount(account);
    }

    @Override
    public void updateCartByAccount(Account account, Cart cart) {
        cartDAO = new CartDAOImpl();
        if (cart != null) cartDAO.updateCartByAccount(account, cart);
    }
}
