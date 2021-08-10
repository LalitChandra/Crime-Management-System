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
String str="insert into pcautions values('"+location+"',sysdate,'"+descr+"')"; 
stmt.execute(str);
out.println("<br><br>Successfully entered");
%>
<jsp:include page="adcau.jsp"/> 
<%
stmt.close();
con.close();
%>
