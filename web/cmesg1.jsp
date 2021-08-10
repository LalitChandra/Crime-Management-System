<%@page import="java.sql.*"%>
<%!
String frm,toadd,sub,desc;
Connection con;
Statement stmt;
%>
<%
frm=(String)session.getAttribute("location");
toadd=request.getParameter("desg");
sub=request.getParameter("txt");
desc=request.getParameter("mesg");
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocr","ocr");
stmt=con.createStatement();

String str="insert into cmesgs(frm,subject,description,toadd) values('"+frm+"','"+sub+"','"+desc+"','"+toadd+"')"; 
stmt.execute(str);
stmt.close();

out.println("successfully sent");
con.close();

%>
<jsp:include page="policedept.jsp"/>

