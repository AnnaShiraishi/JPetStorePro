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
        if (authenticationButton != null) {
            HttpSession session = req.getSession();
            Integer authcode = (Integer) session.getAttribute("authcode");
            int authcodeInput = Integer.parseInt(req.getParameter("authcodeInput"));
            if (authcodeInput != authcode) {
                req.setAttribute("message", "Unmatched authcode!");
                req.getRequestDispatcher(AUTHENTICATION).forward(req, resp);
            } else {
                Account account = (Account) session.getAttribute("newAccount");
                accountService.insertAccount(account);
                logger.info(String.format("New Account (%s) Created.", account.getUsername()));
                resp.sendRedirect(req.getContextPath() + "/main");
            }
            return;
        } else if (editAccount != null) {
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
                Account account1 = accountService.getAccount(account.getUsername());
                if (account1 == null) {
                    if (email.isEmpty()) {
                        req.setAttribute("messqge", "Empty email.");
                        req.getRequestDispatcher(SIGN_UP).forward(req,resp);
                    } else {
                        Random random = new Random();
                        int authcode = random.nextInt(999999);
                        try {
                            email(email, authcode);
                            session.setAttribute("authcode", Integer.valueOf(authcode));
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        session.setAttribute("newAccount", account);
                        req.getRequestDispatcher(AUTHENTICATION).forward(req, resp);
                    }
                } else {
                    req.setAttribute("message", "User name already have.");
                    req.getRequestDispatcher(SIGN_UP).forward(req, resp);
                }
            }
        }
    }

    public static void email(String email, int authcode) throws Exception {
        Properties properties = new Properties();
        properties.setProperty("mail.transport.protocol", "smtp");//发送邮件协议
        properties.setProperty("mail.smtp.auth", "true");//需要验证
        properties.setProperty("mail.debug", "true");//设置debug模式 后台输出邮件发送的过程
        Session session = Session.getInstance(properties);
        session.setDebug(true);//debug模式
        //邮件信息
        Message messgae = new MimeMessage(session);
        messgae.setFrom(new InternetAddress("1850948212@qq.com"));//设置发送人
        messgae.setText("Authcode:" + authcode + ". JPetStore All Right Reserved.");//设置邮件内容
        messgae.setSubject("Mail Authentication");//设置邮件主题
        //发送邮件
        Transport tran = session.getTransport();
//        tran.connect("smtp.office365.com", 587, "Anarhyroch@outlook.com", "szhnwuisudwknfsu");//连接到新浪邮箱服务器
         tran.connect("smtp.qq.com",587, "1850948212@qq.com", "ihfuibjqkufwejac");//连接到QQ邮箱服务器
        tran.sendMessage(messgae, new Address[]{ new InternetAddress(email)});//设置邮件接收人
        tran.close();
    }
}
