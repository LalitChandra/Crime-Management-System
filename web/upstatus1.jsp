<%@page import="java.sql.*"%>
<%!
String prst;
int id;
Connection con;
Statement stmt;
%>
<%
prst=request.getParameter("upst");
id=Integer.parseInt(request.getParameter("id"));
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocr","ocr");
stmt=con.createStatement();
String str="update branch set status='"+prst+"' where cid="+id+""; 
stmt.execute(str);
out.println("<center><font color='green'><h3><br><br>status updated</font></center></h3>");
%>
<jsp:include page="cid.jsp"/>
