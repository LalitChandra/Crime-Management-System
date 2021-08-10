<html>
<head>
<script language="javascript" src="./menu.js"></script>
<script language="javascript" src="./user_items.js"></script>
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
</head>
<body>
<%@page import="java.sql.*"%>
<%!
String uname,sub,loc,dat,desc,station;
int uid;
Connection con;
Statement stmt,st;
ResultSet rs;
%>
<%
sub=request.getParameter("sub");
loc=request.getParameter("loc");
dat=request.getParameter("dat");
desc=request.getParameter("desc");
station=request.getParameter("desg");
uname=(String)session.getAttribute("usr");
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocr","ocr");
stmt=con.createStatement();
st=con.createStatement();
String str1="select seq.nextval from dual";
rs=st.executeQuery(str1);
rs.next();
uid=rs.getInt(1);
String str="insert into branch(cid,cname,sub,loca,da,descri,station) values("+uid+",'"+uname+"','"+sub+"','"+loc+"',to_date('"+dat+"'),'"+desc+"','"+station+"')"; 
stmt.executeUpdate(str);
stmt.close();%>
<center><br><br><br><br><h3>your complaint id is <%=uid%></h3></center><%
st.close();
con.close();

%>
<body>
</html>