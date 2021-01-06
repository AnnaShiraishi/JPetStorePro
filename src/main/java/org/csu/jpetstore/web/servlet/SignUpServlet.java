package org.csu.jpetstore.web.servlet;

import org.apache.log4j.Logger;
import org.csu.jpetstore.domain.Account;
import org.csu.jpetstore.service.AccountService;
import org.csu.jpetstore.service.impl.AccountServiceImpl;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;

public class SignUpServlet extends HttpServlet {
    private static final String SIGN_UP = "/WEB-INF/account/NewAccountForm.jsp";
    private static final String AUTHENTICATION = "/WEB-INF/account/AccountAuthentication.jsp";
    private static final String SIGN_ON = "/WEB-INF/account/SignonForm.jsp";
    private AccountService accountService;
    private static Logger logger = Logger.getLogger(Class.class);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(SIGN_UP).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String editAccount = req.getParameter("editAccount");
        String authenticationButton = req.getParameter("authenticationButton");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String repeatedPassword = req.getParameter("repeatedPassword");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        HttpSession session = req.getSession();
        String phone = req.getParameter("phone");
        String addr1 = req.getParameter("addr1");
        String addr2 = req.getParameter("addr2");
        String city = req.getParameter("city");
        String state = req.getParameter("state");
        String zip = req.getParameter("zip");
        String country = req.getParameter("country");
        String languagePreference = req.getParameter("languagePreference");
        String favoriteCategory = req.getParameter("favoriteCategory");
        boolean listOpt = !(req.getParameter("listOpt")==null);
        boolean bannerOpt = !(req.getParameter("bannerOpt")==null);
        if (password.isEmpty()) {
            req.setAttribute("message", "No password!");
            req.getRequestDispatcher(SIGN_UP).forward(req, resp);
        } else if (!password.equals(repeatedPassword)) {
            req.setAttribute("message", "Unmatched password!");
            req.getRequestDispatcher(SIGN_UP).forward(req, resp);
        } else {
            accountService = new AccountServiceImpl();
            Account account = new Account();
            account.setUsername(username);
            account.setPassword(password);
            account.setFirstName(firstName);
            account.setLastName(lastName);
            account.setEmail(email);
            account.setPhone(phone);
            account.setAddress1(addr1);
            account.setAddress2(addr2);
            account.setCity(city);
            account.setState(state);
            account.setZip(zip);
            account.setCountry(country);
            account.setLanguagePreference(languagePreference);
            account.setFavouriteCategoryId(favoriteCategory);
            account.setListOption(listOpt);
            account.setBannerOption(bannerOpt);
            accountService.insertAccount(account);
        }
        req.getRequestDispatcher(SIGN_ON).forward(req, resp);
    }
}
