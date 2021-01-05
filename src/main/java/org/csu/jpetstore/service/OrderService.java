package org.csu.jpetstore.service;

import org.csu.jpetstore.domain.Order;

import java.util.List;

public interface OrderService {

    void insertOrder(Order order);

    Order getOrder(int orderId);

    List<Order> getOrdersByUsername(String username);

    int getNextId(String name);
}
