<html>
<head>
<title>police department</title>
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
<body> <br><br>
<center><h2><b><u><%=(String)session.getAttribute("location")%>  Police Station</u>
</b></font></h2></center>
</font>
</body>
</html>