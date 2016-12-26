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
//import java.util.Map;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
public class User {
    public Boolean login(String username, String password) {
        HashMap<String, String> loginDetails = new HashMap<String, String>();
        loginDetails.put("username", username);
        loginDetails.put("password", password);
        ResultSet res = Query.fetchData("user_admin", loginDetails);
        try {
            while (res.next()) {
                return true;
            }
        } catch(SQLException e) {
            System.out.println(e);
            return false;
        }
        return false;
    }
}
