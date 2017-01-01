<%-- 
    Document   : cast
    Created on : Dec 31, 2016, 7:57:55 PM
    Author     : Oladeji Femi
--%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Base64"%>
<%@page import="voting.Vote"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="inc/voterLogger.jsp" %>
<%! String name, description, electionSession, election;
    Vote vote;
%>
<%
    election = new String(Base64.getDecoder().decode(request.getParameter("e")));
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="inc/head.jsp" %>
    <body style="padding: 0; margin: 0">
        <div class="container">
            <%@include file="inc/nav.jsp" %>
            <div class="row">
                <div class="col s12 m10 l10 offset-m1 offset-l1">
                    <h4 class="center-align">Vote page</h4>
                    <p>Cast your vote for the election below, select your preferred choice</p>
                    <p>Election Name: <b><% out.print(name); %></b></p>
                    <p>Election Description: <b><% out.print(description); %></b></p>
                    <p>Election Session: <b><% out.print(electionSession); %></b></p>
                    <hr/>
                    <form action="processor/cast-vote.jsp" method="POST">
                        <%
                            ResultSet eligible = vote.getAssignedElections(session.getAttribute("voterId").toString());
                            while(eligible.next()) {
                                if(eligible.getInt("vote_status") == 0) {
                                    ResultSet allPosts = vote.getPosts(election);
                                    while(allPosts.next()) {
                                        out.print("<p class=center-align><b>"+allPosts.getString("post")+"</b><br/>"+allPosts.getString("description")+"</p>");
                                        ResultSet candidates = vote.getCandidatesForPost(allPosts.getString("id"));
                                        while(candidates.next()) {
                                            out.print("<div class='row'><input type=radio required name="+allPosts.getString("id")+" value="+candidates.getString("id")+" id='"+candidates.getString("id")+"' /><label for="+candidates.getString("id")+"><b>Name:</b> "+candidates.getString("name")+"<br/><b>Profile:</b> "+candidates.getString("profile")+"<br/><b>Manifesto:</b> "+candidates.getString("manifesto")+"</label></div>");
                                        }
                                        out.print("<hr/>");
                                    }
                                } else {
                                    out.print("<p style='font-weight:bold' class='center-align'>You've successfuly cast your vote</p>");
                                }
                            }
                            
                        %>
                        <input type="hidden" name="electionId" value="<%= election %>"/>
                        <center><input type="submit" name="cast-vote" class="btn waves-effect waves-light" value="CAST VOTE" /></center>
                    </form>
                </div>
            </div>
            <footer>
                <div class="row" style="height:50px; background-color: #ee6e73">
                    <p class="center-align" style="color:#fff; line-height:50px;">Copyright 2016 <a style="color: yellow" href="https://github.com/andela-foladeji">femidotexe</a></p>
                </div>
            </footer>
        </div>
    </body>
</html>
