<%@page import="java.sql.*"%>
<%!
Connection con;
Statement st;
ResultSet rs;
%>
<%Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocr","ocr");
st=con.createStatement();
rs=st.executeQuery("select distinct(locatio) from admin");
%>
<head>
<title>COMPLAINT FORM</title>
<script>
function fun()
{
var no1=f.sub.value;
if(no1.length==0 )
{
alert("plz enter valid subject");
f.sub.focus();
return false;
}
var no2=f.loc.value;
if(no2.length==0)
{
alert("plz enter valid location");
f.loc.focus();
return false;
}
var no3=f.dat.value;
if(no3.length==0)
{
alert("plz enter valid date");
f.dat.focus();
return false;
}
var no4=f.desc.value;
if(no4.length==0 )
{
alert("plz enter valid description");
f.desc.focus();
return false;
}
if(f.desg.value=="select")
{
alert("plz select valid police station name");
return false;
}
}
</script>
<script language="javascript" src="./menu.js"></script>
<script language="javascript" src="./user_items.js"></script>
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
<br><br>

    <center><h1><b><u>COMPLAINT FORM</u></b></h1></center>
    <h2>Complaint details:</h2>
<i><form method="post" name="f" action="complaint.jsp" onsubmit="return fun()">
<table align=center>
<tr><td>Subject:</td>
<td><input type=text name="sub" size=20 >
</td></tr>
<tr><td>
Location:
</td><td><input type=text name="loc" size=20></td></tr>
<tr><td >Date:</td>
<td><input type=text name="dat" size=15 >
</td></tr>
<tr><td>Description:
</td><td><textarea cols="20"rows="5" name="desc">
</textarea></font></td></tr>
<tr><td>Send To</td><td>
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
</select><!--mstheme--></font></td>
</table><!--mstheme--><font face="Trebuchet MS, Arial, Helvetica">


<br><br>
<center><input type=submit value=submit >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <input type=reset value=clear > </center>
</form></i>
<!--mstheme--></font></h1>
<!--mstheme--></font></body>
</html>