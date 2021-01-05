package org.csu.jpetstore.persistence;

import org.csu.jpetstore.domain.Account;
import org.csu.jpetstore.domain.Cart;
import org.csu.jpetstore.domain.Item;

public interface CartDAO {
    Cart getCartByAccount(Account account);

    void addItem(Account account, Item item);

    void removeItemById(Account account, Item item);

    void incrementQuantityByItemId(Account account, Item item);

    void decrementQuantityByItemId(Account account, Item item);

    void deleteCartBuAccount(Account account);

    void updateCartByAccount(Account account, Cart cart);

    boolean containsItem(Account account, Item item);
}
