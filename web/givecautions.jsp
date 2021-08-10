<%@page import="java.sql.*"%>
<%!
String location,descr;
Connection con;
Statement stmt;
%>
<%
location=request.getParameter("loc");
descr=request.getParameter("desc");
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocr","ocr");
stmt=con.createStatement();
String str="insert into cautions values('"+location+"','"+descr+"',sysdate)"; 
stmt.execute(str);
out.println("<br><br><center>Successfully entered</center>");
%>
<jsp:include page="givecautions.html"/> 
<%
stmt.close();
con.close();
%>
