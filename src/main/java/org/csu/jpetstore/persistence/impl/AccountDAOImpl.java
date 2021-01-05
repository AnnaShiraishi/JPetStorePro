package org.csu.jpetstore.persistence.impl;

import org.csu.jpetstore.domain.Account;
import org.csu.jpetstore.persistence.AccountDAO;
import org.csu.jpetstore.persistence.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AccountDAOImpl implements AccountDAO {
    private static String GET_ACCOUNT_BY_USERNAME = "SELECT\n" +
            "\tSIGNON.USERNAME,\n" +
            "\tACCOUNT.EMAIL,\n" +
            "\tACCOUNT.FIRSTNAME,\n" +
            "\tACCOUNT.LASTNAME,\n" +
            "\tACCOUNT. STATUS,\n" +
            "\tACCOUNT.ADDR1 AS address1,\n" +
            "\tACCOUNT.ADDR2 AS address2,\n" +
            "\tACCOUNT.CITY,\n" +
            "\tACCOUNT.STATE,\n" +
            "\tACCOUNT.ZIP,\n" +
            "\tACCOUNT.COUNTRY,\n" +
            "\tACCOUNT.PHONE,\n" +
            "\tPROFILE .LANGPREF AS languagePreference,\n" +
            "\tPROFILE .FAVCATEGORY AS favouriteCategoryId,\n" +
            "\tPROFILE .MYLISTOPT AS listOption,\n" +
            "\tPROFILE .BANNEROPT AS bannerOption,\n" +
            "\tBANNERDATA.BANNERNAME\n" +
            "FROM\n" +
            "\tACCOUNT,\n" +
            "\tPROFILE,\n" +
            "\tSIGNON,\n" +
            "\tBANNERDATA\n" +
            "WHERE\n" +
            "\tACCOUNT.USERID = ?\n" +
            "AND SIGNON.USERNAME = ACCOUNT.USERID\n" +
            "AND PROFILE .USERID = ACCOUNT.USERID\n" +
            "AND PROFILE .FAVCATEGORY = BANNERDATA.FAVCATEGORY";
    private static String GET_ACCOUNT_BY_USERNAME_AND_PASSWORD = "SELECT\n" +
            "\tSIGNON.USERNAME,\n" +
            "\tACCOUNT.EMAIL,\n" +
            "\tACCOUNT.FIRSTNAME,\n" +
            "\tACCOUNT.LASTNAME,\n" +
            "\tACCOUNT. STATUS,\n" +
            "\tACCOUNT.ADDR1 AS address1,\n" +
            "\tACCOUNT.ADDR2 AS address2,\n" +
            "\tACCOUNT.CITY,\n" +
            "\tACCOUNT.STATE,\n" +
            "\tACCOUNT.ZIP,\n" +
            "\tACCOUNT.COUNTRY,\n" +
            "\tACCOUNT.PHONE,\n" +
            "\tPROFILE .LANGPREF AS languagePreference,\n" +
            "\tPROFILE .FAVCATEGORY AS favouriteCategoryId,\n" +
            "\tPROFILE .MYLISTOPT AS listOption,\n" +
            "\tPROFILE .BANNEROPT AS bannerOption,\n" +
            "\tBANNERDATA.BANNERNAME\n" +
            "FROM\n" +
            "\tACCOUNT,\n" +
            "\tPROFILE,\n" +
            "\tSIGNON,\n" +
            "\tBANNERDATA\n" +
            "WHERE\n" +
            "\tACCOUNT.USERID = ?\n" +
            "AND SIGNON. PASSWORD = ?\n" +
            "AND SIGNON.USERNAME = ACCOUNT.USERID\n" +
            "AND PROFILE .USERID = ACCOUNT.USERID\n" +
            "AND PROFILE .FAVCATEGORY = BANNERDATA.FAVCATEGORY";
    private static String UPDATE_ACOUNT = "UPDATE ACCOUNT\n" +
            "SET EMAIL = ?, FIRSTNAME = ?, LASTNAME = ?, STATUS = ?, ADDR1 = ?, ADDR2 = ?, CITY = ?, STATE = ?, ZIP = ?, COUNTRY = ?, PHONE = ?\n" +
            "WHERE\n" +
            "\tUSERID = ?";
    private static String INSERT_ACCOUNT = "INSERT INTO ACCOUNT (\n" +
            "\tEMAIL,\n" +
            "\tFIRSTNAME,\n" +
            "\tLASTNAME,\n" +
            "\tSTATUS,\n" +
            "\tADDR1,\n" +
            "\tADDR2,\n" +
            "\tCITY,\n" +
            "\tSTATE,\n" +
            "\tZIP,\n" +
            "\tCOUNTRY,\n" +
            "\tPHONE,\n" +
            "\tUSERID\n" +
            ")\n" +
            "VALUES\n" +
            "\t(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static String UPDATE_PROFILE = "UPDATE PROFILE\n" +
            "SET LANGPREF = ?, FAVCATEGORY = ?, MYLISTOPT = ?, BANNEROPT = ?\n" +
            "WHERE\n" +
            "\tUSERID = ?";
    private static String INSERT_PROFILE = "INSERT INTO PROFILE (\n" +
            "\tLANGPREF,\n" +
            "\tFAVCATEGORY,\n" +
            "\tMYLISTOPT,\n" +
            "\tBANNEROPT,\n" +
            "\tUSERID\n" +
            ")\n" +
            "VALUES\n" +
            "\t(?, ?, ?, ?, ?)";
    private static String UPDATE_SIGN_ON = "UPDATE SIGNON\n" +
            "SET PASSWORD = ?\n" +
            "WHERE\n" +
            "\tUSERNAME = ?";
    private static String INSERT_SIGN_ON = "INSERT INTO SIGNON (PASSWORD, USERNAME)\n" +
            "VALUES\n" +
            "\t(?, ?)";

    @Override
    public Account getAccountByUsername(String username) {
        Account account = null;
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(GET_ACCOUNT_BY_USERNAME);
            pStatement.setString(1, username);
            ResultSet resultSet = pStatement.executeQuery();
            account = new Account();
            if (resultSet.next()) {
                account.setUsername(resultSet.getString("username"));
                account.setEmail(resultSet.getString("email"));
                account.setFirstName(resultSet.getString("firstname"));
                account.setLastName(resultSet.getString("lastname"));
                account.setStatus(resultSet.getString("status"));
                account.setAddress1(resultSet.getString("address1"));
                account.setAddress2(resultSet.getString("address2"));
                account.setCity(resultSet.getString("city"));
                account.setState(resultSet.getString("state"));
                account.setZip(resultSet.getString("zip"));
                account.setCountry(resultSet.getString("country"));
                account.setPhone(resultSet.getString("phone"));
                account.setLanguagePreference(resultSet.getString("languagePreference"));
                account.setFavouriteCategoryId(resultSet.getString("favouritecategoryid"));
                account.setListOption(resultSet.getBoolean("listOption"));
                account.setBannerOption(resultSet.getBoolean("bannerOption"));
                account.setBannerName(resultSet.getString("bannername"));
            } else {
                return null;
            }
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return account;
    }

    @Override
    public Account getAccountByUsernameAndPassword(Account account) {
        Account newAccount = new Account();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(GET_ACCOUNT_BY_USERNAME_AND_PASSWORD);
            pStatement.setString(1, account.getUsername());
            pStatement.setString(2, account.getPassword());
            ResultSet resultSet = pStatement.executeQuery();
            if (resultSet.next()) {
                newAccount.setUsername(resultSet.getString("username"));
                newAccount.setEmail(resultSet.getString("email"));
                newAccount.setFirstName(resultSet.getString("firstname"));
                newAccount.setLastName(resultSet.getString("lastname"));
                newAccount.setStatus(resultSet.getString("status"));
                newAccount.setAddress1(resultSet.getString("address1"));
                newAccount.setAddress2(resultSet.getString("address2"));
                newAccount.setCity(resultSet.getString("city"));
                newAccount.setState(resultSet.getString("state"));
                newAccount.setZip(resultSet.getString("zip"));
                newAccount.setCountry(resultSet.getString("country"));
                newAccount.setPhone(resultSet.getString("phone"));
                newAccount.setLanguagePreference(resultSet.getString("languagePreference"));
                newAccount.setFavouriteCategoryId(resultSet.getString("favouritecategoryid"));
                newAccount.setListOption(resultSet.getBoolean("listOption"));
                newAccount.setBannerOption(resultSet.getBoolean("bannerOption"));
                newAccount.setBannerName(resultSet.getString("bannername"));
            }else{
                newAccount = null;
            }
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return newAccount;
    }

    @Override
    public void insertAccount(Account account) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(INSERT_ACCOUNT);
            pStatement.setString(1, account.getEmail());
            pStatement.setString(2, account.getFirstName());
            pStatement.setString(3, account.getLastName());
            pStatement.setString(4, account.getStatus());
            pStatement.setString(5, account.getAddress1());
            pStatement.setString(6, account.getAddress2());
            pStatement.setString(7, account.getCity());
            pStatement.setString(8, account.getState());
            pStatement.setString(9, account.getZip());
            pStatement.setString(10, account.getCountry());
            pStatement.setString(11, account.getPhone());
            pStatement.setString(12, account.getUsername());
            pStatement.executeUpdate();
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insertProfile(Account account) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(INSERT_PROFILE);
            pStatement.setString(1, account.getLanguagePreference());
            pStatement.setString(2, account.getFavouriteCategoryId());
            pStatement.setInt(3, account.isListOption()?1:0);
            pStatement.setInt(4, account.isBannerOption()?1:0);
            pStatement.setString(5, account.getUsername());
            pStatement.executeUpdate();
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insertSignon(Account account) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(INSERT_SIGN_ON);
            pStatement.setString(1, account.getPassword());
            pStatement.setString(2, account.getUsername());
            pStatement.executeUpdate();
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateAccount(Account account) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(UPDATE_ACOUNT);
            pStatement.setString(1, account.getEmail());
            pStatement.setString(2, account.getFirstName());
            pStatement.setString(3, account.getLastName());
            pStatement.setString(4, account.getStatus());
            pStatement.setString(5, account.getAddress1());
            pStatement.setString(6, account.getAddress2());
            pStatement.setString(7, account.getCity());
            pStatement.setString(8, account.getState());
            pStatement.setString(9, account.getZip());
            pStatement.setString(10, account.getCountry());
            pStatement.setString(11, account.getPhone());
            pStatement.setString(12, account.getUsername());
            pStatement.executeUpdate();
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateProfile(Account account) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(UPDATE_PROFILE);
            pStatement.setString(1, account.getLanguagePreference());
            pStatement.setString(2, account.getFavouriteCategoryId());
            pStatement.setInt(3, account.isListOption()?1:0);
            pStatement.setInt(4, account.isBannerOption()?1:0);
            pStatement.setString(5, account.getUsername());
            pStatement.executeUpdate();
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateSignon(Account account) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(UPDATE_SIGN_ON);
            pStatement.setString(1, account.getPassword());
            pStatement.setString(2, account.getUsername());

            pStatement.executeUpdate();
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
