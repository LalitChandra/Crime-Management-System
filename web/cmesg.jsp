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
rs=stmt.executeQuery("select distinct(locatio) from admin"); 

%>
<html>
  <head>
    <title></title>
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
</head>
  <body>
     <form action="cmesg1.jsp" method="post">
<table height="95">
<tr><td height="22">To:</td><td>
    <select size="1" name="desg">
    <option selected>select</option>
    <%
    while(rs.next())
    {
    %>
    
    <option><%=rs.getString(1)%></option>
    <%
    }
        %>  
</select></td></tr><br>
<tr><td height="22">Subject:</td><td height="22"><input name="txt" type="text" size="20"></td></tr>
<tr><td height="22">Message:</td><td height="22"><textarea  name="mesg" cols="40"rows="8"></textarea></td></tr>
<tr><td height="27"> <input type="submit" value="submit"></td>
<td height="27"><input type="reset" value="clear">
</td></tr>
</table>
</form> 
  
  </body>
</html>
