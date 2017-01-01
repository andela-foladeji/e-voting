<%-- 
    Document   : view-result
    Created on : Jan 1, 2017, 12:21:53 PM
    Author     : Oladeji Femi
--%>
<%@page import="java.util.HashMap"%>
<%@include file="inc/logger.jsp" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.Base64, voting.Vote"%>
<%! String name, description, electionSession, election;
    Vote vote;
%>
<%
    election = new String(Base64.getDecoder().decode(request.getParameter("q")));
    int electionId = Integer.parseInt(election);
    if(electionId > 0) {
        vote = new Vote();
        HashMap<String, String> electionInfo = vote.getElectionInfo(election);
        if(electionInfo == null) {
            response.sendRedirect("vote.jsp");
        } else {
            name = electionInfo.get("name");
            description = electionInfo.get("description");
            electionSession = electionInfo.get("session");
        }
    } else {
        response.sendRedirect("vote.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <%@include file="inc/head.jsp" %>
    <body style="padding: 0; margin: 0">
        <div class="container">
            <%@include file="inc/adminnav.jsp" %>
            <div class="row">
                <div class="col s12 m10 l10 offset-m1 offset-l1">
                    <h4 class="center-align">Result page</h4>
                    <p>Cast your vote for the election below, select your preferred choice</p>
                    <p>Election Name: <b><% out.print(name); %></b></p>
                    <p>Election Description: <b><% out.print(description); %></b></p>
                    <p>Election Session: <b><% out.print(electionSession); %></b></p>
                    <hr/>
                    <%
                        ResultSet allPosts = vote.getPosts(election);
                        while(allPosts.next()) {
                            out.print("<p class=center-align><b>"+allPosts.getString("post")+"</b><br/>"+allPosts.getString("description")+"</p>");
                            ResultSet candidates = vote.getCandidatesForPost(allPosts.getString("id"));
                            while(candidates.next()) {
                                ResultSet result = vote.getResultForCandidate(candidates.getString("id"));
                                int voteCount = 0;
                                while(result.next()) {
                                    voteCount = result.getInt("totalvotes");
                                }
                                out.print("<div class='row'><p class='col s12 l1 m2 center-align'>TOTAL VOTES: <b>"+voteCount+"</b></p><p class='col s12 l11 m10' for="+candidates.getString("id")+"><b>Name:</b> "+candidates.getString("name")+"<br/><b>Profile:</b> "+candidates.getString("profile")+"<br/><b>Manifesto:</b> "+candidates.getString("manifesto")+"</p></div>");
                            }
                            out.print("<hr/>");
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
