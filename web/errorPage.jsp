<%@ page isErrorPage="true" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<HTML>
    <head>
<title>First</title>
<style type="text/css">
body {
          background-image:  url('ricebk.jpg');
          background-repeat: repeat;
          background-position:  center 50%;
          background-height:100px
         
          }

</style>
</head>
<BODY >
Error Occured :<%
    if(exception instanceof SQLException)
        out.println("Already Registered");
    else
        out.println(exception.toString());
        %>
</BODY>
</HTML>
