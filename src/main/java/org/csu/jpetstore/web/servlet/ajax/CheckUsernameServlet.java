package org.csu.jpetstore.web.servlet.ajax;

import org.csu.jpetstore.service.AccountService;
import org.csu.jpetstore.service.impl.AccountServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CheckUsernameServlet extends HttpServlet {
    private AccountService accountService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        accountService = new AccountServiceImpl();
        if (accountService.getAccount(username) != null) {
            resp.getWriter().println(1);
        } else {
            resp.getWriter().println(0);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
