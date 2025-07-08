package springmvc.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import springmvc.model.Transaction;

public class TransactionRowMapper implements RowMapper<Transaction> {
    @Override
    public Transaction mapRow(ResultSet rs, int rowNum) throws SQLException {
        Transaction transaction = new Transaction();
        transaction.setSender(rs.getString("sender"));
        transaction.setReceiver(rs.getString("receiver"));
        
        transaction.setAmount(rs.getDouble("amount"));
        transaction.setDate(rs.getTimestamp("transaction_date"));
        return transaction;
    }

	public Transaction mapRow1(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
}
