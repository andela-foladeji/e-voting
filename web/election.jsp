<%-- 
    Document   : election
    Created on : Dec 28, 2016, 12:40:04 AM
    Author     : Oladeji Femi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.Base64"%>
<%
    String election = request.getParameter("q");
    String electionId = new String(Base64.getDecoder().decode(election));
%>
<!DOCTYPE html>
<html>
    <%@include file="inc/head.jsp" %>
    <body style="padding: 0; margin: 0">
        <div class="container">
            <%@include file="inc/adminnav.jsp" %>
            <div class="row">
                <div class="col s12 m6 l6">
                    <p>Election page</p>
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
