package springmvc.model;

public class User {
    private String Name;
    private String username;
    private String password;
    private double balance;

    // Constructor
    public User(String Name,Double balance, String username, String password) {
        this.Name = Name;
        this.username = username;
        this.password = password;
        this.balance = 2000.0; // Default balance
    }

    // Getters
    public String getName() { return Name; }
    public void setName(String Name) { this.Name = Name; }
    
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public double getBalance() { return balance; }
    public void setBalance(double balance) {
        this.balance = balance;
    }


}
