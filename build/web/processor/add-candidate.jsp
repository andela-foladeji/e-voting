<%-- 
    Document   : add-candidate
    Created on : Dec 29, 2016, 2:42:18 PM
    Author     : Oladeji Femi
--%>

<%@page import="voting.Vote, org.json.JSONObject" %>
<%
    String candidate = request.getParameter("candidate");
    String nickname = request.getParameter("nickname");
    String profile = request.getParameter("profile");
    String manifesto = request.getParameter("manifesto");
    String postId = request.getParameter("postid");
    if(candidate.trim() == "" || profile.trim() == "" || manifesto.trim() == "" || postId.trim() == "") {
        out.print(new JSONObject("{\"status\": 0, \"message\": \"Some compulsory fields are empty\"}"));
    } else {
        Vote vote = new Vote();
        int resId = vote.addCandidate(candidate, profile, manifesto, nickname, postId);
        if (resId > 0) {
            out.print(new JSONObject("{\"status\": 1, \"message\": \"Candidate added\"}"));
        } else {
            out.print(new JSONObject("{\"status\": 0, \"message\": \"An error occured\"}"));
        }
    }
%>
