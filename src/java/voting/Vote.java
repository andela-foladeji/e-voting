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
    
    public ResultSet getPosts(String electionId) {
        HashMap<String, String> details = new HashMap<String, String>();
        details.put("election_id", electionId);
        return Query.fetchData("posts", details);
    }
    
    public int addCandidate(String candidateName, String profile, String manifesto, String nickname, String postId) throws SQLException {
        HashMap<String, String> candidateDetails = new HashMap<String, String>();
        candidateDetails.put("name", candidateName);
        candidateDetails.put("profile", profile);
        candidateDetails.put("manifesto", manifesto);
        candidateDetails.put("post_id", postId);
        if(nickname != null) {
            candidateDetails.put("nickname", nickname);
        }
        return Query.insert("candidates", candidateDetails);
    }
    
    public ResultSet getCandidatesForPost(String postId) {
        HashMap<String, String> post = new HashMap<String, String>();
        post.put("post_id", postId);
        return Query.fetchData("candidates", post);
    }
    
    public ResultSet getElections() {
        return Query.fetchTable("elections", "DESC");
    }
    
    public int changeElectionStatus(String status, String electionId) {
        HashMap<String, String> whereClause = new HashMap<String, String>();
        HashMap<String, String> updates = new HashMap<String, String>();
        whereClause.put("id", electionId);
        updates.put("status", status);
        return Query.update("elections", whereClause, updates);
    }
    
    public int changePublishStatus(String status, String electionId) {
        HashMap<String, String> whereClause = new HashMap<String, String>();
        HashMap<String, String> updates = new HashMap<String, String>();
        whereClause.put("id", electionId);
        updates.put("publishstatus", status);
        return Query.update("elections", whereClause, updates);
    }
    
    public ResultSet getAssignedElections(String voterId) {
        String sqlQuery = "SELECT *, elections.id AS electionId FROM elections, voters, voters_assignment WHERE voters.id = '"+voterId+"' AND voters_assignment.voters_id = voters.id AND voters_assignment.elections_id = elections.id AND voters_assignment.elections_id AND elections.id AND elections.status = 1";
        return Query.runQuery(sqlQuery);
    }
    
    public int castVote(String voterId, String choice, String postId) throws SQLException {
        HashMap<String, String> voteCasted = new HashMap<String, String>();
        voteCasted.put("voters_id", voterId);
        voteCasted.put("posts_id", postId);
        voteCasted.put("candidate_id", choice);
        return Query.insert("votes", voteCasted);
    }
    
    public int updateVoteStatus(String voterId, String electionId) {
        HashMap<String, String> newStatus = new HashMap<String, String>();
        newStatus.put("vote_status", "1");
        HashMap<String, String> whereClause = new HashMap<String, String>();
        whereClause.put("voters_id", voterId);
        whereClause.put("elections_id", electionId);
        return Query.update("voters_assignment", whereClause, newStatus);
    }
    
    public ResultSet getResultForCandidate(String candidateId) {
        String sqlQuery = "SELECT COUNT(votes.id) AS totalvotes FROM votes WHERE candidate_id = " + candidateId;
        return Query.runQuery(sqlQuery);
    }
}
