<%-- 
    Document   : view
    Created on : Dec 29, 2016, 10:57:34 PM
    Author     : Oladeji Femi
--%>

<%@include file="inc/logger.jsp" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.Base64, voting.Vote"%>
<%! Vote vote = new Vote();
%>
<!DOCTYPE html>
<html>
    <%@include file="inc/head.jsp" %>
    <body style="padding: 0; margin: 0">
        <div class="container">
            <%@include file="inc/adminnav.jsp" %>
            <div class="row">
                <div class="col s12 m12 l12">
                    <h4 class="center-align">View All Elections</h4>
                    <p>Lists of all created elections can be seen below, you can create posts and subsequently add candidates to the post. You can also activate an election for voting, view results and so on.</p>
                    <table class="striped">
                        <thead>
                            <tr>
                                <th data-field="id">S/N</th>
                                <th data-field="post">ELECTION</th>
                                <th data-field="desc">DESCRIPTION</th>
                                <th data-field="desc">SESSION</th>
                                <th data-field="candidates">ADD POSTS</th>
                                <th data-field="add">ACTIVATE/DEACTIVATE</th>
                                <th data-field="add">PUBLISH RESULT</th>
                                <th data-field="add">VIEW RESULTS</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int counter = 1;
                                ResultSet elections = vote.getElections();
                                while(elections.next()) {
                                    String isChecked = "checked";
                                    String electionId = Base64.getEncoder().encodeToString(elections.getString("id").getBytes());
                                    if(elections.getInt("status") == 0) {
                                        isChecked = "";
                                    }
                                    String isPublished = "checked";
                                    String viewResult = "<a class=btn href='view-result.php?q='"+electionId+">View Result</a>";
                                    if(elections.getInt("publishstatus") == 0) {
                                        isPublished = "";
                                        viewResult = "";
                                    }
                                    String publishSwitch = "<div class=switch><label>Off<input class='switch-publish change' "+isPublished+" type=checkbox><span class=lever></span>On</label></div>";
                                    String activeSwitch = "<div class=switch><label>Off<input class='switch-status change' "+isChecked+" type=checkbox><span class=lever></span>On</label></div>";
                                    out.print("<tr id="+elections.getString("id")+"><td>"+counter+"</td><td>"+elections.getString("name")+"</td><td>"+elections.getString("description")+"</td><td>"+elections.getString("session")+"</td><td><a href='election.jsp?q="+electionId+"' class=btn waves-effect waves-light>ADD</a></td><td>"+activeSwitch+"</td><td>"+publishSwitch+"</td><td>"+viewResult+"</td></tr>");
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
