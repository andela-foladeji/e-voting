<%-- 
    Document   : election
    Created on : Dec 28, 2016, 12:40:04 AM
    Author     : Oladeji Femi
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.Base64, java.util.HashMap, voting.Vote"%>
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
            response.sendRedirect("admin.jsp");
        } else {
            name = electionInfo.get("name");
            description = electionInfo.get("description");
            electionSession = electionInfo.get("session");
        }
    } else {
        response.sendRedirect("admin.jsp");
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
                    <h4 class="center-align">Election page</h4>
                    <p>This is where you enter all the posts that are being vied for in the election whose details are below</p>
                    <p>Election Name: <b><% out.print(name); %></b></p>
                    <p>Election Description: <b><% out.print(description); %></b></p>
                    <p>Election Session: <b><% out.print(electionSession); %></b></p>
                    <form class="col s12" action="processor/create-post.jsp">
                        <div class="row">
                            <div class="input-field col s12 m5 l5">
                                <input id="post" type="text" name="post">
                                <label for="post">Post</label>
                            </div>
                            <div class="input-field col s12 m5 l5">
                                <input id="desc" type="text" name="desc">
                                <label for="desc">Description</label>
                            </div>
                            <div class="input-field col s12 m2 l2">
                                <input type="hidden" name="election_id" value="<% out.print(election); %>"/>
                                <input type="submit" value="Create Post" name="create_post" class="btn waves-effect waves-light"/>
                            </div>
                        </div>
                    </form>
                    <table class="striped">
                        <thead>
                            <tr>
                                <th data-field="id">S/N</th>
                                <th data-field="post">POST</th>
                                <th data-field="desc">DESCRIPTION</th>
                                <th data-field="candidates">CANDIDATES</th>
                                <th data-field="add">ADD</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int counter = 1;
                                ResultSet allPosts = vote.getPosts();
                                while(allPosts.next()) {
                                    out.print("<tr><td>"+counter+"</td><td>"+allPosts.getString("post")+"</td><td>"+allPosts.getString("description")+"</td><td></td><td><a class='btn waves-effect waves-light' href=add-candidates.jsp?e="+allPosts.getString("id")+">Add</a></td></tr>");
                                    counter++;
                                }
                            %>
                        </tbody>
                    </table>
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
