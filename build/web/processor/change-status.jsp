<%-- 
    Document   : change-status
    Created on : Dec 30, 2016, 8:42:04 PM
    Author     : Oladeji Femi
--%>

<%@page import="voting.Vote, org.json.JSONObject" %>
<%
    String status = request.getParameter("status");
    String electionId = request.getParameter("electionId");
    Vote vote = new Vote();
    int resId = vote.changeElectionStatus(status, electionId);
    out.print(new JSONObject("{\"status\": 1, \"message\": \"Status changed\"}"));
%>
