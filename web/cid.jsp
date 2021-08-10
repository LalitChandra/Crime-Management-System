<%@page import="java.sql.*"%>
<%!
String place;
Connection con;
Statement stmt;
ResultSet rs;
%>
    <%
place=(String)session.getAttribute("location");
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocr","ocr");
stmt=con.createStatement();
String str="select distinct(cid) from branch where station='"+place+"'"; 
rs=stmt.executeQuery(str);
        %>
        <head>
            <title>
                complaint id's
            </title>
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

</style>       </head>
        <body>
            <h1><br><CENTER>Update Status of Complaint</H1>
            <BR><br>COMPLAINT ID's<BR>  
   
       <table><tr><td>Complaint Id:&nbsp&nbsp&nbsp&nbsp</td>
<form action="upstatus.jsp" method=post>
       <td><select name="complaintid">
          <%
        while(rs.next())
        {
        %>
        <option><%=rs.getInt(1)%></option>
    <% 
        }
       %>
        </select></td></tr><br><br>
   </table><br><br>
   <input type=submit value=submit>
        </form>
       </center>
   </body>
</html>

        

    