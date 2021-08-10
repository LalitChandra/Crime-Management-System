<html><head></script>

<script language="javascript" src="./menu.js"></script>
<script language="javascript" src="./police_items.js"></script>
<script language="javascript" src="./menu_tpl.js"></script>
<script language="javascript">
  new menu (MENU_ITEMS, MENU_POS, MENU_STYLES);
</script>

<style type="text/css">
body {
          background-image:  url('ricebk.jpg');
          background-repeat: repeat;
          background-position:  center 50%;
          background-height:100px
         
          }

</style></head>
<body><center><br><br>
<%@page import="java.sql.*"%>
<%!
String location,descr;
Connection con;
Statement stmt;
%>
<%
location=(String)session.getAttribute("location");
descr=request.getParameter("desc");
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocr","ocr");
stmt=con.createStatement();
String str="insert into cautions values('"+location+"','"+descr+"',sysdate)"; 
stmt.execute(str);
out.println("<h3>Successfully entered</h3>");
stmt.close();
con.close();
%>
</center>
</body></html>
