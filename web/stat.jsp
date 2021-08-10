
<%@page import="java.sql.*"%>
<%!
int id,id1;
String status,user,name,sub;
Connection con;
Statement stmt;
ResultSet rs;
%>
<%
id=Integer.parseInt(request.getParameter("id"));
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocr","ocr");
stmt=con.createStatement();
String str="select cid,cname,sub,status from branch where cid="+id+""; 
name=(String)session.getAttribute("usr");
rs=stmt.executeQuery(str);
if(rs.next())
{
id1=rs.getInt(1);
user=rs.getString(2);
sub=rs.getString(3);
status=rs.getString(4);
%>
<jsp:include page="viewstatus.html"/>
<%
if(name.equals(user))
    out.println("<center><br><br><br><br><br><br><br><br><table border=2><tr><th>complaint id</th><th>complaintee name</th><th>subject</th><th>status</th></tr><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+id1+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+user+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+sub+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+status+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</table>");
else
    out.println("<center><br><br><br><br><br><br><br><br><H1>A C C E S S  D E N I E D</H1></center>");
stmt.close();
con.close();
}
else
 {   
%>
<jsp:include page="viewstatus.html"/>
<%
    out.println("<center><br><br><br><br><br><br><br><br><H1>NOT A VALID COMPLAINT ID</H1>");
    }
 %>
