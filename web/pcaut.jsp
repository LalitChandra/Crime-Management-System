<%@page import="java.sql.*"%>
<%!
String place;
Connection con;
Statement st;
ResultSet rs;
%>
<%
place=(String)session.getAttribute("location");
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocr","ocr");
st=con.createStatement();
rs=st.executeQuery("select description,da from pcautions where location='"+place+"'");
        %>
        <head>
<title>Cautions </title>

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
<body><br><br><center><h2>Cautions Given by Administrator<table border=1>
        <%
        while(rs.next())
        {
        %>
         <br><br><br><br><br>
         <tr><td><h3>description:</h3></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(1)%></td></tr>
        <tr><td><h3>date:</h3></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString(2)%></td></tr>
        <tr><td>                          </td><td>                       </td></tr>
            <tr><td>                        </td><td>                                            </td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr> 
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
               <%
        }
        
        %>  
        </table>
</body>
</html>

    