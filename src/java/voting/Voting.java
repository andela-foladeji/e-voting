/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package voting;

import java.sql.SQLException;
import java.util.HashMap;

/**
 *
 * @author Oladeji Femi
 */
public class Voting {
    public int createElection(String election, String description, String electionSession) throws SQLException {
        HashMap<String, String> electionDetails = new HashMap<String, String>();
        electionDetails.put("name", election);
        electionDetails.put("description", description);
        electionDetails.put("session", electionSession);
        Query.insert("elections", electionDetails);
        return 2;
    }
}
