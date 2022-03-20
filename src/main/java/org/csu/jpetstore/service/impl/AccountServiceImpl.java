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
    public void updateAccount(Account account) {
        accountDAO = new AccountDAOImpl();
        accountDAO.updateAccount(account);
        accountDAO.updateProfile(account);
        accountDAO.updateSignon(account);
    }
}

