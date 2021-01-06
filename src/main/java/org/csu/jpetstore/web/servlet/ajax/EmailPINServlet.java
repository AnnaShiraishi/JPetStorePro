package org.csu.jpetstore.web.servlet.ajax;

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

public class EmailPINServlet extends HttpServlet {
    private AccountService accountService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        Random random = new Random();
        int authcode = random.nextInt(999999);
        HttpSession session = req.getSession();
        try {
            email(email, authcode);
            session.setAttribute("authcode", Integer.valueOf(authcode));
            resp.getWriter().println(authcode);
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println(0);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
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
