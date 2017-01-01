<%-- 
    Document   : index (Homepage)
    Created on : Dec 25, 2016, 4:08:52 PM
    Author     : Oladeji Femi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="voting.User" %>
<%
    
    if(request.getParameter("submit") != null) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User aUser = new User();
        Boolean result = aUser.login(username, password);
        if(result){
            session.setAttribute("user", username);
            response.sendRedirect("admin.jsp");
        } else {
            int voterId = aUser.votersLogin(username, password);
            if (voterId > 0) {
                session.setAttribute("voter", username);
                session.setAttribute("voterId", voterId);
                response.sendRedirect("vote.jsp");
            } else {
                response.sendRedirect("index.jsp?q=1");
            }
        }
    }
%>
<!DOCTYPE html>
<html>
    <%@include file="inc/head.jsp" %>
    <body style="padding: 0; margin: 0">
        <div class="container">
            <%@include file="inc/nav.jsp" %>
            <div class="row">
                <div class="col s6">
                    <img style="width:100%" src="img/vote.jpg"/>
                    <p>This project is to facilitate voting in tertiary institutions</p>
                </div>
                <div class="col s6">
                    <h2 class="center-align">LOGIN</h2>
                    <form class="col s12" method="POST" action="index.jsp">
                        <div class="row">
                            <div class="input-field col s12">
                              <input id="username" type="text" name="username">
                              <label for="username">Username/Matric Number</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                              <input id="password" type="password" name="password">
                              <label for="password">Password</label>
                            </div>
                        </div>
                        <% if(request.getParameter("q") != null) { %>
                        <div class="row">
                            <div class="input-field col s12">
                              <span>Invalid login details</span>
                            </div>
                        </div>
                        <% } %>
                        <div class="row">
                            <input class="btn waves-effect waves-light" name="submit" type="submit" value="LOGIN">
                        </div>
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
