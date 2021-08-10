<%@page import="java.sql.*"%>
<%!
String username,password;
Connection con;
Statement stmt;
ResultSet rs;
%>
<%
username=request.getParameter("uname");
password=request.getParameter("pwd");
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocr","ocr");
stmt=con.createStatement();
String str="select * from admlogin where unam='"+username+"' and pwd='"+password+"'";
rs=stmt.executeQuery(str);
if(rs.next())
{
%>
<jsp:forward page="adminis.html"/>
<%
}
else
{
out.println("<html><body>Invalid Login and Password</body></html>");
%>
<jsp:include page="adminlogin.html"/> 
<%
}
stmt.close();
con.close();
%>
