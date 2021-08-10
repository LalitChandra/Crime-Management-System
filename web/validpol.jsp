<%@page import="java.sql.*"%>
<%!
String name,password,station;
Connection con;
Statement stmt;
ResultSet rs;
%>
<%
name=request.getParameter("uname");
password=request.getParameter("pwd");
station=request.getParameter("desg");
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocr","ocr");
stmt=con.createStatement();
String str="select pname,pwd from admin where locatio='"+station+"'"; 
rs=stmt.executeQuery(str);

while(rs.next())
{
if(name.equals(rs.getString(1))&&password.equals(rs.getString(2)))
    {
    session.setAttribute("location",station);
    %>
<jsp:forward page="policedept.jsp"/>
<%
break;
}
}
out.println("<html><body>Invalid Login and Password</body></html>");
%>
<jsp:include page="policelogin.jsp"/> 
<%
stmt.close();
con.close();
%>
