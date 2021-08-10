<%@page import="java.sql.*"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.StringTokenizer"%>

<%!
String name,pword,gender,address,email,tno,puid;
int age;
Connection con;
Statement stmt;
ResultSet rs;
%>
<%
puid=request.getParameter("puid");
name=request.getParameter("name");
pword=request.getParameter("pwd");
age=Integer.parseInt(request.getParameter("age"));
gender=request.getParameter("gender");
address=request.getParameter("address");
tno=request.getParameter("pno");
email=request.getParameter("mail");
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocr","ocr");
stmt=con.createStatement();
String str2="select * from publicuid1 where puid='"+puid+"'"; 
rs=stmt.executeQuery(str2);
if(rs.next())
{
String str="insert into register1 values('"+name+"','"+pword+"',"+age+",'"+gender+"','"+address+"',to_number('"+tno+"'),'"+email+"',to_number('"+puid+"'))"; 
String str1="insert into login values('"+name+"','"+pword+"')";
stmt.execute(str);
stmt.execute(str1);


String to=email;//change accordingly
       // to = "musku.sravanthi@gmail.com";

//Get the session object
  Properties props = new Properties();
  props.put("mail.smtp.host", "smtp.gmail.com");
  props.put("mail.smtp.socketFactory.port", "465");
  props.put("mail.smtp.socketFactory.class",
        	"javax.net.ssl.SSLSocketFactory");
  props.put("mail.smtp.auth", "true");
  props.put("mail.smtp.port", "465");
 
  Session session1 = Session.getDefaultInstance(props,
   new javax.mail.Authenticator() {
       //@Override
   protected PasswordAuthentication getPasswordAuthentication() {
   return new PasswordAuthentication("cmc.testmail@gmail.com","cmctestmail");//change accordingly
   }
  });
 
//compose message
  try {
   MimeMessage message = new MimeMessage(session1);
   message.setFrom(new InternetAddress(to));//change accordingly
   message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
   message.setSubject("Ecops Registration");
   message.setText("Your Sucessfully registered into ecops website");
  Transport.send(message);

        System.out.println("Done");
   //send message
  // Transport.send(message);

   System.out.println("message sent successfully");
 
  } catch(Exception e) {
  e.printStackTrace();
  
  }



out.println("Successfully registered<br>");
%>
<jsp:include page="user.html"/>
<%
}
%>


<%

stmt.close();
con.close();
%>
