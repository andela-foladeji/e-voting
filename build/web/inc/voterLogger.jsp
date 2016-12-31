<%-- 
    Document   : voterLogger
    Created on : Dec 31, 2016, 8:19:23 AM
    Author     : Oladeji Femi
--%>

<%
    if(session.getAttribute("voter") == null || session.getAttribute("voterId") == null) {
        response.sendRedirect("index.jsp");
    }
%>
