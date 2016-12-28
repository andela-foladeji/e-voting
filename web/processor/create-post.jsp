<%-- 
    Document   : create-post
    Created on : Dec 28, 2016, 6:41:24 PM
    Author     : Oladeji Femi
--%>

<%@page import="voting.Vote, java.util.Base64" %>
<%
    if(request.getParameter("create_post") != null) {
        String post = request.getParameter("post");
        String desc = request.getParameter("desc");
        String electionId = request.getParameter("election_id");
        Vote vote = new Vote();
        int resId = vote.createPost(electionId, post, desc);
        if (resId > 0) {
            response.sendRedirect("../election.jsp?q="+Base64.getEncoder().encodeToString(electionId.getBytes()));
        } else {
            response.sendRedirect("../election.jsp?e=1&q="+Base64.getEncoder().encodeToString(electionId.getBytes()));
        }
    } else {
        response.sendRedirect("../admin.jsp");
    }
    
%>
