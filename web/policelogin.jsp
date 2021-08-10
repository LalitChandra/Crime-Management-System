<%@page import="java.sql.*"%>
<%!

Connection con;
Statement stmt;
ResultSet rs;
%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocr","ocr");
stmt=con.createStatement();
String str="select distinct(locatio) from admin"; 
rs=stmt.executeQuery(str);
%>
<html>
<head>
<title>POLICE DEPT LOGIN</title>
<script>
function fun()
{
var no1=f.uname.value;
if(no1.length==0 )
{
alert("plz enter valid user name");
f.uname.focus();
return false;
}
var no2=f.pwd.value;
if(no2.length==0)
{
alert("plz enter  password");
f.pwd.focus();
return false;
}
}
    </script>
<script language="javascript" src="./menu.js"></script>
<script language="javascript" src="./menu_items.js"></script>
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
<center><br><br><br><h1>Police Department Login</h1><hr width="440"><br><br>
<form method="post" name="f" action="validpol.jsp" onsubmit="return fun()">
<table height="95">
<tr><td height="22">User Name:</td><td height="22"><input name="uname" type="text" size="20"></td></tr>
<tr><td height="22">Password:</td><td height="22"><input name="pwd" type="password" size="20"></td></tr>
<tr><td height="22">Logon To:</td><td><select size="1" name="desg">
        <option selected>select</option>
        <%
        while(rs.next())
        {
        %>
        
        <option><%=rs.getString(1)%></option>
        <%
        }
        %>  
</select></td></tr>
<tr><td height="1"></td><td height="1"></td></tr>
<tr><td height="1"></td><td height="1"></td></tr>
<tr><td height="1"></td><td height="1"></td></tr>
<tr><td height="27"> <input type="submit" value="submit"></td>
<td height="27"><input type="reset" value="clear">
</td></tr>
</table>
</form>
</center>
</body>
</html>