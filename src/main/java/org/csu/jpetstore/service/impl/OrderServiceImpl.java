package org.csu.jpetstore.service.impl;

import org.csu.jpetstore.domain.Item;
import org.csu.jpetstore.domain.Order;
import org.csu.jpetstore.domain.Sequence;
import org.csu.jpetstore.persistence.ItemDAO;
import org.csu.jpetstore.persistence.LineItemDAO;
import org.csu.jpetstore.persistence.OrderDAO;
import org.csu.jpetstore.persistence.SequenceDAO;
import org.csu.jpetstore.persistence.impl.ItemDAOImpl;
import org.csu.jpetstore.persistence.impl.LineItemDAOImpl;
import org.csu.jpetstore.persistence.impl.OrderDAOImpl;
import org.csu.jpetstore.persistence.impl.SequenceDAOImpl;
import org.csu.jpetstore.service.OrderService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OrderServiceImpl implements OrderService {
    private ItemDAO itemDAO;
    private OrderDAO orderDAO;
    private SequenceDAO sequenceDAO;
    private LineItemDAO lineItemDAO;
    public OrderServiceImpl() {
        itemDAO = new ItemDAOImpl();
        orderDAO = new OrderDAOImpl();
        sequenceDAO = new SequenceDAOImpl();
        lineItemDAO = new LineItemDAOImpl();
    }

    @Override
    public void insertOrder(Order order) {
        order.setOrderId(getNextId("ordernum"));
        order.getLineItems().forEach(lineItem -> {
            String itemId = lineItem.getItemId();
            Integer increment = lineItem.getQuantity();
            Map<String, Integer> param = new HashMap<>(2);
            param.put(itemId, increment);
            itemDAO.updateInventoryQuantity(param);
        });
        orderDAO.insertOrder(order);
        orderDAO.insertOrderStatus(order);
        order.getLineItems().forEach(lineItem -> {
            lineItem.setOrderId(order.getOrderId());
            lineItemDAO.insertLineItem(lineItem);
        });
    }

    @Override
    public Order getOrder(int orderId) {
        Order order;
        order = orderDAO.getOrder(orderId);
        order.setLineItems(lineItemDAO.getLineItemsByOrderId(orderId));

        order.getLineItems().forEach(lineItem -> {
            Item item = itemDAO.getItem(lineItem.getItemId());
            item.setQuantity(itemDAO.getInventoryQuantity(lineItem.getItemId()));
            lineItem.setItem(item);
        });
        return order;
    }

    @Override
    public List<Order> getOrdersByUsername(String username) {
        return orderDAO.getOrdersByUsername(username);
    }

    @Override
    public int getNextId(String name) {
        Sequence sequence = sequenceDAO.getSequence(new Sequence(name, -1));
        if (sequence == null) {
            throw new RuntimeException(
                    "Error: A null sequence was returned from the database (could not get next " + name + " sequence).");
        }
        Sequence parameterObject = new Sequence(name, sequence.getNextId() + 1);
        sequenceDAO.updateSequence(parameterObject);
        return sequence.getNextId();
    }
}
