package org.csu.jpetstore.service;

import org.csu.jpetstore.domain.Account;
import org.csu.jpetstore.domain.Cart;
import org.csu.jpetstore.domain.Item;

public interface CartService {

    Cart getCartByAccount(Account account);

    void addItem(Account account, Item item);

    void removeItemById(Account account, Item item);

    void incrementQuantityByItemId(Account account, Item item);

    void decrementQuantityByItemId(Account account, Item item);

    void addItem(Account account, String itemId);

    void removeItemById(Account account, String itemId);

    void incrementQuantityByItemId(Account account, String itemId);

    void decrementQuantityByItemId(Account account, String itemId);

    void deleteCartByAccount(Account account);

    void updateCartByAccount(Account account, Cart cart);
}
