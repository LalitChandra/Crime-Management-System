<%@page import="java.sql.*"%>
<%!
int id;
Connection con;
Statement stmt;
ResultSet rs;
%>
<%
int id=Integer.parseInt(request.getParameter("complaintid"));
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocr","ocr");
stmt=con.createStatement();
String str="select cid,status from branch where cid="+id+""; 
rs=stmt.executeQuery(str);
rs.next();
%>
<html>
    <head>
        <title>Update status</title>
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
        
        <form action="upstatus1.jsp" method="post">
            <center><table><br><br>
                    <tr><td>Complaint id:</td><td>
                      <input type="text" name="id" value="<%=rs.getInt(1)%>" size="20">
                    </td></tr>
                    <tr><td>Previous Status:</td>
                        <td><textarea cols=15 rows=3  name="prest" disabled>
                                <%=rs.getString(2)%>
                    </textarea></td></tr>
                    <tr><td>Present Status:</td>
                    <td><textarea cols=15 rows=3 name="upst"></textarea>
                </table>
            </center><br>
            <br>
            <center>
                <input type=submit value="Submit"> 
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <input type=reset value="Clear">
            </center>
        </form>
    </body>
</html>