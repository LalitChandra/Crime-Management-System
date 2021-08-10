<html>
<%@page import="java.sql.*"%>
<%!
int cid;
Connection con;
Statement st;
ResultSet rs;
%>
<%
cid=Integer.parseInt(request.getParameter("no"));
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocr","ocr");
st=con.createStatement();
rs=st.executeQuery("select cname,sub,loca,da,descri from branch where cid="+cid+"");
%>
<head>
<title>COMPLAINTS </title>

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
 <center><br><br><h3>Complaint&nbsp;&nbsp;&nbsp; Details</h3><table border=1>
        <%
        while(rs.next())
        {
        %>
                <tr><td><h4>COMPLAINTEE NAME:</h4></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(1)%></td></tr>
        <tr><td><h4>COMPLAINT ID:</h4></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<%=cid%></td></tr>
        <tr><td><h4>SUBJECT:</h4></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(2)%></td></tr>
        <tr><td><h4>LOCATION:</h4></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(3)%></td></tr>
        <tr><td><h4>DATE:</h4></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(4)%></td></tr>
        <tr><td><h4>DESCRIPTION:</h4></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(5)%></td></tr>
        <%
        }
        
        %>  
        </table>
</body>
</html>