<%-- 
    Document   : create-election
    Created on : Dec 27, 2016, 2:47:24 PM
    Author     : Oladeji Femi
--%>

<%@page import="voting.Voting, org.json.JSONObject, java.util.Base64" %>
<%
    String election = request.getParameter("election");
    String description = request.getParameter("description");
    String electionSession = request.getParameter("session");
    if(election.trim() == "" || description.trim() == "" || electionSession.trim() == "") {
        out.print(new JSONObject("{\"status\": 0, \"message\": \"All fields are required\"}"));
    } else {
        Voting vote = new Voting();
        int resId = vote.createElection(election, description, electionSession);
        if (resId > 0) {
            String electionId = Base64.getEncoder().encodeToString(Integer.toString(resId).getBytes());
            out.print(new JSONObject("{\"status\": 1, \"message\": \"Election created\", \"electionId\": \"" + electionId + "\" }"));
        } else {
            out.print(new JSONObject("{\"status\": 0, \"message\": \"An error occured\"}"));
        }
    }
%>
