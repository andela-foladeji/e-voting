<%-- 
    Document   : logger
    Created on : Dec 29, 2016, 10:51:28 PM
    Author     : Oladeji Femi
--%>

<%
    if(session.getAttribute("user") == null) {
        response.sendRedirect("index.jsp");
    }
%>
