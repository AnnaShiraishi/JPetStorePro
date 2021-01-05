package org.csu.jpetstore.service.impl;
import org.csu.jpetstore.domain.Account;
import org.csu.jpetstore.persistence.AccountDAO;
import org.csu.jpetstore.persistence.impl.AccountDAOImpl;
import org.csu.jpetstore.service.AccountService;

public class AccountServiceImpl implements AccountService {

    private AccountDAO accountDAO;

    @Override
    public Account getAccount(String username) {
        accountDAO = new AccountDAOImpl();
        return accountDAO.getAccountByUsername(username);
    }

    @Override
    public Account getAccount(String username, String password) {
        accountDAO = new AccountDAOImpl();
        Account account = new Account();
        account.setUsername(username);
        account.setPassword(password);
        return accountDAO.getAccountByUsernameAndPassword(account);
    }

    @Override
    public void insertAccount(Account account) {
        accountDAO = new AccountDAOImpl();
        accountDAO.insertAccount(account);
        accountDAO.insertProfile(account);
        accountDAO.insertSignon(account);
    }

    @Override
    public void updateAccount(Account account) {
        accountDAO = new AccountDAOImpl();
        accountDAO.updateAccount(account);
        accountDAO.updateProfile(account);
        accountDAO.updateSignon(account);
    }
}

