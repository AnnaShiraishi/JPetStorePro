package org.csu.jpetstore.web.servlet;

import org.apache.log4j.Logger;
import org.csu.jpetstore.domain.Account;
import org.csu.jpetstore.domain.Cart;
import org.csu.jpetstore.domain.Item;
import org.csu.jpetstore.service.CartService;
import org.csu.jpetstore.service.CatalogService;
import org.csu.jpetstore.service.impl.CartServiceImpl;
import org.csu.jpetstore.service.impl.CatalogServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class CartServlet extends HttpServlet {
    private static final String CART = "/WEB-INF/cart/Cart.jsp";
    private CatalogService catalogService;
    private CartService cartService;
    private static Logger logger = Logger.getLogger(Class.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(CART).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        catalogService = new CatalogServiceImpl();
        cartService = new CartServiceImpl();
        String itemId = req.getParameter("itemId");
        Cart cart;
        HttpSession session = req.getSession();
        if(session.getAttribute("cart") != null){
            cart = (Cart) session.getAttribute("cart");
        }else {
            cart = new Cart();
        }
        if (cart.containsItemId(itemId)) {
            cart.incrementQuantityByItemId(itemId);
            if (session.getAttribute("account") != null) {
                Account account = (Account) session.getAttribute("account");
                cartService.incrementQuantityByItemId(account, itemId);
            }
        } else {
            boolean isInStock = catalogService.isItemInStock(itemId);
            Item item = catalogService.getItem(itemId);
            cart.addItem(item, isInStock);
            if (session.getAttribute("account") != null) {
                Account account = (Account) session.getAttribute("account");
                cartService.addItem(account, itemId);
                logger.info(String.format("User (%s) Add a New Item (%s).", account.getUsername(), itemId));
            }
        }
        session.setAttribute("cart", cart);
        resp.sendRedirect(req.getContextPath() + "/cart");
    }
}
