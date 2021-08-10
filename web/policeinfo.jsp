<%@page import="java.sql.*"%>
<%!
Connection con;
Statement st;
ResultSet rs;
%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocr","ocr");
st=con.createStatement();
rs=st.executeQuery("select pid,pname,desg,locatio,pno from admin");
%>
<html>

<head>
<title>Contact us</title>
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

</style></head>

<body>
    <table align=right><tr><td>
<a href=logout.jsp>Logout</a></td></tr></table>
<h1>
<marquee bgcolor="skyblue">
Online Crime Reporting
</marquee><h1>
<center><h3><b><u>Police Information</u></b></h3></center>
    <center><table border=2>
         <th>
            <th><tr><td><h3>PoliceId:</h3></td> <td><h3>PoliceName:</h3></td><td><h3>Desgnation:</h3></td><td><h3>Location:</h3></td>
            <td><h3>Phonenumber:</h3></td> </tr></th>
            <%
            while(rs.next())
            {
            %>
            
            <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(1)%></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(2)%></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(3)%></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(4)%></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(5)%></td>
            </tr>
            <%
            }
            
            %>   
        </table>
    </center>
</body>
</html>