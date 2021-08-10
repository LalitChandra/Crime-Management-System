<html><head>
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

</style>

</head><body><br><br>
<center><h3>
<%@page import="java.sql.*"%>
<%!
String name,alias,gender,crime,rwd;
int age,tid;
Connection con;
Statement stmt;
%>
<%
name=request.getParameter("tname");
alias=request.getParameter("aname");
age=Integer.parseInt(request.getParameter("ag"));
gender=request.getParameter("gen");
tid=Integer.parseInt(request.getParameter("id"));
rwd=request.getParameter("rward");
crime=request.getParameter("crimes");
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocr","ocr");
stmt=con.createStatement();
String str="insert into theifinfo values('"+name+"','"+alias+"',"+age+",'"+gender+"','"+tid+"','"+crime+"','"+rwd+"')";
stmt.execute(str);
out.println("Successfully inserted");
stmt.close();
con.close();
%>
</h3></center>
</body>
</html>