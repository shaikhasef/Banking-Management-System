package springmvc.Dao;
import springmvc.model.Transaction;
import springmvc.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

public class userDao {
    private static JdbcTemplate jdbcTemplate;

    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    public int insert(User student) {
        String query = "INSERT INTO users (name, balance, username, password) VALUES (?, ?, ?, ?)";
        return this.jdbcTemplate.update(query, 
            student.getName(),   // Correct method name
            student.getBalance(), // Correct method name
            student.getUsername(), // Correct method name
            student.getPassword()  // Correct method name
        );
    }


    

    public static String getUserName(String username, String password) {
        String sql = "SELECT name FROM users WHERE username = ? AND password = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{username, password}, String.class);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }
    public static Double getBalance(String username, String password) {
        try {
            String sql = "SELECT balance FROM users WHERE username = ? AND password = ?";
            return jdbcTemplate.queryForObject(sql, new Object[]{username, password}, Double.class);
        } catch (EmptyResultDataAccessException e) {
            return null; // If user not found, return null
        }
} 

    public User getUserByUsername(String username) {
        String query = "SELECT * FROM users WHERE username = ?";
        try {
            return jdbcTemplate.queryForObject(query, new Object[]{username}, (rs, rowNum) -> 
                new User(rs.getString("name"), rs.getDouble("balance"),
                         rs.getString("username"), rs.getString("password"))
            );
        } catch (Exception e) {
            return null; // User not found
        }
    }
    public User getUserBypassword(String password) {
        String query = "SELECT * FROM users WHERE password = ?";
        try {
            return jdbcTemplate.queryForObject(query, new Object[]{password}, (rs, rowNum) -> 
                new User(rs.getString("name"), rs.getDouble("balance"),
                         rs.getString("username"), rs.getString("password"))
            );
        } catch (Exception e) {
            return null; // User not found
        }
    }
    public boolean transferAmount(String password, String receiverUsername, double amount) {
        // Deduct amount from sender using password
        String deductQuery = "UPDATE users SET balance = balance - ? WHERE password = ? AND balance >= ?";
        int rowsAffected1 = jdbcTemplate.update(deductQuery, amount, password, amount);

        if (rowsAffected1 == 0) {
            return false; // Insufficient balance or incorrect password
        }

        // Add amount to receiver
        String addQuery = "UPDATE users SET balance = balance + ? WHERE username = ?";
        int rowsAffected2 = jdbcTemplate.update(addQuery, amount, receiverUsername);

        // Insert transaction record
        String insertTransaction = "INSERT INTO transactions (password, receiver, amount, transaction_date) VALUES (?, ?, ?, NOW())";
        jdbcTemplate.update(insertTransaction, password, receiverUsername, amount);

        return rowsAffected2 > 0; // Return true if the transfer was successful
    }

public List<Transaction> getTransactionHistory(String password, String username) {
    String query = "SELECT * FROM transactions WHERE password = ? OR receiver = ? ORDER BY transaction_date DESC";
    return jdbcTemplate.query(query, new Object[]{password, username}, (rs, rowNum) -> 
        new Transaction(rs.getString("password"), 
                        rs.getString("receiver"), 
                        rs.getDouble("amount"), 
                        rs.getTimestamp("transaction_date"))
    );
}}

    

