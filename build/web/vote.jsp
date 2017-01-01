<%-- 
    Document   : vote
    Created on : Dec 30, 2016, 11:03:17 PM
    Author     : Oladeji Femi
--%>
<%@page import="java.util.Base64"%>
<%@page import="voting.Vote"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="inc/voterLogger.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="inc/head.jsp" %>
    <body style="padding: 0; margin: 0">
        <div class="container">
            <%@include file="inc/nav.jsp" %>
            <div class="row">
                <div class="col s12 m12 l12">
                    <p class="col s10 m10 l10 offset-m1 offset-l1 center-align">
                        Welcome <%= session.getAttribute("voter").toString() %>, below are the elections currently on that you can participate in. You can also view result for past elections
                    </p>
                    <table class="striped">
                        <thead>
                            <tr>
                                <th data-field="post">ELECTION</th>
                                <th data-field="desc">DESCRIPTION</th>
                                <th data-field="session">SESSION</th>
                                <th data-field="vote">VOTE</th>
                                <th data-field="view">VIEW RESULTS</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Vote vote = new Vote();
                                ResultSet eligible = vote.getAssignedElections(session.getAttribute("voterId").toString());
                                while(eligible.next()) {
                                    String viewResult= "";
                                    String electionId = Base64.getEncoder().encodeToString(eligible.getString("electionId").getBytes());
                                    if(eligible.getInt("publishstatus") == 1) {
                                        viewResult = "<a class=btn href='view-result.php?q='"+electionId+">View Result</a>";
                                    }
                                    out.print("<tr><td>"+eligible.getString("name")+"</td><td>"+eligible.getString("description")+"</td><td>"+eligible.getString("session")+"</td><td><a class=btn href=cast.jsp?e="+electionId+">VOTE</a></td><td>"+viewResult+"</td></tr>");
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
