package org.csu.jpetstore.persistence.impl;

import org.csu.jpetstore.domain.Sequence;
import org.csu.jpetstore.persistence.DBUtil;
import org.csu.jpetstore.persistence.SequenceDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SequenceDAOImpl implements SequenceDAO {
    final static String GET_SEQUENCE = "SELECT\n" +
            "\tNAME,\n" +
            "\tnextid\n" +
            "FROM\n" +
            "\tSEQUENCE\n" +
            "WHERE\n" +
            "\tNAME = ?";
    final static String UPDATE_SEQUENCE = "UPDATE SEQUENCE\n" +
            "SET NEXTID = ?\n" +
            "WHERE\n" +
            "\tNAME = ?";

    @Override
    public Sequence getSequence(Sequence sequence) {
        Sequence sequence1 = new Sequence();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(GET_SEQUENCE);
            pStatement.setString(1, sequence.getName());
            ResultSet resultSet = pStatement.executeQuery();
            if (resultSet.next()) {
                sequence1.setName(resultSet.getString("name"));
                sequence1.setNextId(resultSet.getInt("nextid"));
            }
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
            sequence1 = null;
        }
        return sequence1;
    }

    @Override
    public void updateSequence(Sequence sequence) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(UPDATE_SEQUENCE);
            pStatement.setInt(1, sequence.getNextId());
            pStatement.setString(2, sequence.getName());
            pStatement.executeUpdate();
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
