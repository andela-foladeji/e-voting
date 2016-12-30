/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package voting;

/**
 *
 * @author Oladeji Femi
 */

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
public class Query {
//    private DBCon conn = null;
//    public void query() {
//        conn = new DBCon();
//        conn.doConnection();
//    }
    public static ResultSet fetchData(String tableName, HashMap<String, String> parameters) {
        String sqlQuery = "SELECT * FROM " + tableName + " WHERE ";
        int counter = 0;
        for(String key : parameters.keySet()) {
            if (counter > 0) {
                sqlQuery += " AND ";
            }
            sqlQuery += key +" = '" + parameters.get(key) + "'";
            counter++;
        }
        return Query.runQuery(sqlQuery);
    }
    
    public static ResultSet runQuery(String sqlQuery) {
        ResultSet res = null;
        try {
            DBCon conn = new DBCon();
            conn.doConnection();
            PreparedStatement statement = conn.connection.prepareStatement(sqlQuery);
            res = statement.executeQuery();
        } catch(SQLException e) {
            System.out.println(e);
        }
        return res;
    }
    
    public static int runQuery2(String sqlQuery) {
        int affectedRows, rowId = 0;
        try {
            DBCon conn = new DBCon();
            conn.doConnection();
            PreparedStatement statement = conn.connection.prepareStatement(sqlQuery, Statement.RETURN_GENERATED_KEYS);
            affectedRows = statement.executeUpdate();
            ResultSet generatedKeys = statement.getGeneratedKeys();
            if (generatedKeys.next()) {
                rowId = generatedKeys.getInt(1);
            }
        } catch(SQLException e) {
            System.out.println(e);
            rowId = -1;
        }
        return rowId;
    }
    
    public static ResultSet fetchTable(String tableName, String order) {
        String sqlQuery = "SELECT * FROM " + tableName + " ORDER BY id "+order;
        return Query.runQuery(sqlQuery);
    }
    
    public static int insert(String tableName, HashMap<String, String> parameters) throws SQLException {
        String sqlQuery = "INSERT INTO " + tableName + " ( ";
        int counter = 0;
        for(String key : parameters.keySet()) {
            if (counter > 0) {
                sqlQuery += ", ";
            }
            sqlQuery += key;
            counter++;
        }
        sqlQuery += " ) VALUES(";
        counter = 0;
        for(String key : parameters.keySet()) {
            if (counter > 0) {
                sqlQuery += ", ";
            }
            sqlQuery += "'"+parameters.get(key)+"'";
            counter++;
        }
        sqlQuery += " )";
        return Query.runQuery2(sqlQuery);
    }
    
    public static int update(String tableName, HashMap<String, String> whereClause, HashMap<String, String> updates) {
        String sqlQuery = "UPDATE " + tableName + " SET ";
        int counter = 0;
        for(String key : updates.keySet()) {
            if (counter > 0) {
                sqlQuery += ", ";
            }
            sqlQuery += key + " = '" + updates.get(key) +"' ";
            counter++;
        }
        sqlQuery += " WHERE ";
        counter = 0;
        for(String key : whereClause.keySet()) {
            if (counter > 0) {
                sqlQuery += ", ";
            }
            sqlQuery += key + " = '" + whereClause.get(key) +"' ";
            counter++;
        }
        return Query.runQuery2(sqlQuery);
    }
}
