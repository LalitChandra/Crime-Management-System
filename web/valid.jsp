<%@page import="java.sql.*"%>
<%!
String login,password;
Connection con;
Statement stmt;
ResultSet rs;
%>
<%
login=request.getParameter("uname");
password=request.getParameter("pwd");
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocr","ocr");
stmt=con.createStatement();
String str="select * from login where username='"+login+"' and password='"+password+"'"; 
rs=stmt.executeQuery(str);
if(rs.next())
{
    session.setAttribute("usr",login);
%>
<jsp:forward page="userpage.jsp"/>
<%
}
else
{
out.println("<br><br>Invalid Login and Password");
%>
<jsp:include page="user.html"/> 
<%
}
stmt.close();
con.close();
%>
