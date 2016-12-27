<%-- 
    Document   : logout
    Created on : Dec 27, 2016, 1:57:07 PM
    Author     : Oladeji Femi
--%>

<%
    session.setAttribute("user", null);
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
