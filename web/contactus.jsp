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

</style>
</head>

<body>
<h1>
<br>
<h4>To know further information contact us on :
</h4>
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