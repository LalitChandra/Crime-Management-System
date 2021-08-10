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
rs=st.executeQuery("select cid,cname,da,descri,station,status from branch");
%>
<html>

<head>
<title>Complaints</title>
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

</style></head>

<body>
<br><br>   
<h4>COMPLAINTS:
</h4>
    <center><table border=2>
            <tr><th>Complaint Id:</th><th>ComplainteeName:</th><th>Date:</th><th>Description:</th>
            <th>Stations:</th><th>Status:</th></tr>
            <%
            while(rs.next())
            {
            %>
            
            <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(1)%></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(2)%></td>
                <td width="100">&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getDate(3)%></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(4)%></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(5)%></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(6)%></td>
            </tr>
            <%
            }
            
            %>   
        </table>
    </center>
</body>
</html>