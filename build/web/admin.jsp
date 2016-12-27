<%-- 
    Document   : admin (Admin Page)
    Created on : Dec 25, 2016, 4:08:52 PM
    Author     : Oladeji Femi
--%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
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
                <div class="col s12 m6 l6">
                    <p class="center-align">
                        Hi <%= session.getAttribute("user") %>, welcome to the administrator page. You have a complete control over how the application works. You can create a new election, view past results and add new administrators. Note! Other administrators added can also do anything you do so use that option carefully 
                    </p>
                </div>
                <div class="col s12 m6 l6">
                    <h3 class="center-align">CREATE ELECTION</h3>
                    <form class="col s12" action="processor/create-election.jsp" id="create-election">
                        <div class="row">
                            <div class="input-field col s12">
                              <input id="election" type="text" name="election">
                              <label for="election">Election Name</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                              <textarea id="description" name="description" class="materialize-textarea"></textarea>
                              <label for="description">Description</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <select id="session" name="session">
                                    <option value="">--Select Session--</option>
                                    <%
                                        java.util.Calendar calendar = new java.util.GregorianCalendar();
                                        int year = calendar.get(Calendar.YEAR);
                                        for(int yearCount = year - 2; yearCount <= year + 5; yearCount++) {
                                            out.println("<option value=" + yearCount+"/"+(yearCount+1) + ">" + yearCount+"/" + (yearCount+1) + "</option>");
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form_status col s12"></div>
                        </div>
                        <div class="row">
                            <input class="btn waves-effect waves-light" name="create" type="submit" name="action" value="Create Election">
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
