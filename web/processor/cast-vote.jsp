<%-- 
    Document   : cast-vote
    Created on : Jan 1, 2017, 1:39:33 AM
    Author     : Oladeji Femi
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="voting.Vote, org.json.JSONObject, java.util.Base64" %>
<%
    Vote vote = new Vote();
    String election = request.getParameter("electionId");
    ResultSet allPosts = vote.getPosts(election);
    while(allPosts.next()) {
        String choice = request.getParameter(allPosts.getString("id"));
        vote.castVote(session.getAttribute("voterId").toString(), choice, allPosts.getString("id"));
    }
    vote.updateVoteStatus(session.getAttribute("voterId").toString(), election);
    response.sendRedirect("../cast.jsp?e="+Base64.getEncoder().encodeToString(election.getBytes()));
%>
