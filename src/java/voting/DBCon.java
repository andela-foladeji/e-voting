package voting;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Oladeji Femi
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DBCon {
    Connection connection = null;
    String driverName = "com.mysql.jdbc.Driver";
    String serverName = "127.0.0.1"; // Use this server.
    String portNumber = "3306";
    String sid = "e-voting";
    String url = "jdbc:mysql://"+serverName+":"+portNumber+"/"+sid; //for Mysql
    String username = "root";
    String password = "";
    
    public void doConnection(){
        try {
            // Load the JDBC driver
            Class.forName(driverName);
            // Create a connection to the database
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            // Could not find the database driver
            System.out.println("ClassNotFoundException : "+e.getMessage());
        } catch (SQLException e) {
            // Could not connect to the database
            System.out.println(e.getMessage());
        }
    }
}
