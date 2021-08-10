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
<title>cautions</title>
</head>
<script language="javascript" src="./menu.js"></script>
<script language="javascript" src="./admin_items.js"></script>
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
<body>
    <br><br>
<center>
   ADMINISTRATOR CAUTIONS TO POLICE DEPARTMENT:    

<form action="adcautions.jsp" method="post">
<table><tr><td>Description:</td>
<td><textarea  name="desc" cols="40"rows="8"></textarea></td></tr>
<tr><td>Send To:</td>
<td><select size="1" name="loc">
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
</table><br><br>
<center> 
<input type="submit" value="submit">
&nbsp&nbsp&nbsp&nbsp
<input type="reset" value="clear">
</center>
</body>
</form>
</html>