/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package voting;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

/**
 *
 * @author Oladeji Femi
 */
public class Vote {
    public int createElection(String election, String description, String electionSession) throws SQLException {
        HashMap<String, String> electionDetails = new HashMap<String, String>();
        electionDetails.put("name", election);
        electionDetails.put("description", description);
        electionDetails.put("session", electionSession);
        return Query.insert("elections", electionDetails);
    }
    
    public HashMap getElectionInfo(String electionId) throws SQLException {
        HashMap<String, String>electionInfo = new HashMap<String, String>();
        electionInfo.put("id", electionId);
        ResultSet details = Query.fetchData("elections", electionInfo);
        HashMap<String, String> electionDetails = new HashMap<String, String>();
        if(details != null) {
            while(details.next()) {
                electionDetails.put("id", electionId);
                electionDetails.put("name", details.getString("name"));
                electionDetails.put("description", details.getString("description"));
                electionDetails.put("session", details.getString("session"));   
            }
        }
        return electionDetails;
    }
    
    public int createPost(String electionId, String post, String description) throws SQLException {
        HashMap<String, String> postDetails = new HashMap<String, String>();
        postDetails.put("post", post);
        postDetails.put("description", description);
        postDetails.put("election_id", electionId);
        return Query.insert("posts", postDetails);
    }
    
    public ResultSet getPosts() {
        return Query.fetchTable("posts");
    }
}
