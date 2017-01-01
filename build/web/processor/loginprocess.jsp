<%-- 
    Document   : loginprocess
    Created on : Dec 25, 2016, 10:52:16 PM
    Author     : Oladeji Femi
--%>
<%@page import="voting.User" %>
<%
    
    if(request.getParameter("submit") != null) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User aUser = new User();
        Boolean result = aUser.login(username, password);
        if(result){
            response.sendRedirect("../admin.jsp");
        } else {
            response.sendRedirect("../index.jsp?q=1");
        }
    }
%>
