<html> <head><script language="javascript" src="./menu.js"></script>
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

</style></head>   <body>
  <br><br>         <%@page import="java.sql.*"%>
        <%!
        String place;
        int cid;
        Connection con;
        Statement st;
        ResultSet rs;
        %>
        <%
        place=(String)session.getAttribute("location");
        Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocr","ocr");
st=con.createStatement();
        rs=st.executeQuery("select cid from branch where station='"+place+"'");%><h1><CENTER><%=place%>  Police Station</CENTER></H1>COMPLAINT ID's
<%        while(rs.next())
        {
        cid=rs.getInt(1);
        out.println("<br><br><a href=viewcomp.jsp?no="+cid+">"+cid+" </a>");
        }
     %>  
    </body>
</html>
    