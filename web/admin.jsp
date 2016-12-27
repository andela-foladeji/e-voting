<%-- 
    Document   : admin (Admin Page)
    Created on : Dec 25, 2016, 4:08:52 PM
    Author     : Oladeji Femi
--%>
<%
    if(session.getAttribute("user") == null) {
        response.sendRedirect("index.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="inc/head.jsp" %>
    <body style="padding: 0; margin: 0">
        <div class="container">
            <%@include file="inc/adminnav.jsp" %>
            <div class="row">
                <div class="col s6">
                    <p class="center-align">
                        Hi <%= session.getAttribute("user") %>, welcome to the administrator page. You have a complete control over how the application works. You can create a new election, view past results and add new administrators. Note! Other administrators added can also do anything you do so use that option carefully 
                    </p>
                </div>
                <div class="col s6">
                    <form class="col s12" method="POST" id="create-election">
                        <div class="row">
                            <div class="input-field col s12">
                              <input id="election" type="text" name="election">
                              <label for="election">Election Name</label>
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
                            <input class="btn waves-effect waves-light" name="submit" type="submit" name="action" value="LOGIN">
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
