<%@page import="java.sql.*"%>
<%!
String str;
int tid,a=1000;
Connection con;
Statement stmt;
ResultSet rs;
%>
<%
tid=Integer.parseInt(request.getParameter("id"));
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:ocr","ocr","ocr");
stmt=con.createStatement();
str="select theifid,name,alias,age,gender,crimescommited,rewards from theifinfo where theifid="+tid;
rs=stmt.executeQuery(str);
%>
<html>
    <body bgcolor="silver">
        <center>
                       <br><br>
                       <a href="thiefs.html#<%=tid%>">
                <table align="center">
                    <% while(rs.next())
                    {
                    %>
                    <tr><td>THEIF-ID :</td><td><%=rs.getInt(1)%></td></tr>
                    <tr><td>NAME :</td><td><%=rs.getString(2)%></td></tr>
                    <tr><td>ALIAS :</td><td><%=rs.getString(3)%></td></tr>
                    <tr><td>AGE :</td><td><%=rs.getString(4)%></td></tr>
                    <tr><td>GENDER : </td><td><%=rs.getString(5)%></td></tr>
                    <tr><td>CRIMES COMMITED  : </td><td><%=rs.getString(6)%></td></tr>
                    <tr><td>REWARDS  : </td><td><%=rs.getString(7)%></td></tr>
                    <%
                    }
                    %>
                    
                </table>
            </a>
        </center>
         <%@ include file="theifs.html"%>
    </body>
</html>