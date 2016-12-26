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
            Statement statement = conn.connection.createStatement();
            res = statement.executeQuery(sqlQuery);
        } catch(SQLException e) {
            System.out.println(e);
        }
        return res;
    }
}
