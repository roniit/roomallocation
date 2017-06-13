<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd"> 
<%@ page language="java" contentType="text/html" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>   
<%@ page import="java.io.*" %> 
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>

<HTML>
<HEAD>
     <TITLE>  ROOM ALLOCATION SYSTEM</TITLE>
</HEAD>
<body>
<%
try{
	String uid=request.getParameter("userid");
     String pass=request.getParameter("password");
				
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomdatabase","root","123");
		Statement stmt=con.createStatement();
       String q="select * from user where loginID='"+uid+"' and password='"+pass+"' and IDStatus='ACTIVE'";
		ResultSet rs=stmt.executeQuery(q);
		if(rs.next())
	{
			String usertype=rs.getString(10);
			String presentuser=rs.getString(1);
			String presentusername=rs.getString(4);
			session.setAttribute("USERID",presentuser);
			session.setAttribute("USERNAME",presentusername);
			session.setMaxInactiveInterval(75000);
			rs.close();
		Calendar cal = Calendar.getInstance();
        int day = cal.get(Calendar.DATE);
        int month = cal.get(Calendar.MONTH) + 1;
        int year = cal.get(Calendar.YEAR);
		int hours=cal.get(Calendar.HOUR_OF_DAY);
		int minutes=cal.get(Calendar.MINUTE);
		String todaydate=null,nowtime=null;
		todaydate=year+"-"+month+"-"+day;
		nowtime=hours+":"+minutes;
		out.println(nowtime);
		stmt.executeUpdate("update roomallocation set allocationstatus='COMPLETED' where givenDate<'"+todaydate+"' or (givenDate='"+todaydate+"' and endTime<'"+nowtime+"')");
			if(usertype.equals("SUPERUSER")){%>
   <jsp:forward page="admin.jsp"/>
  <%
   }
      else if(usertype.equals("REQUEST")){
  %> 
    <jsp:forward page="requester.jsp"/>        
  <% }
  else if(usertype.equals("APPROVE")){%>
   
   <jsp:forward page="approver.jsp"/>        
<%
      }
   
   else
   {%>
   <jsp:forward page="login.html"/>
   <%}
	}
	else
	{%>
   <jsp:forward page="login.html"/>
   <%}
	rs.close();
	stmt.close();
	con.close();
}
catch(Exception e)
      {
       out.println(e.toString());
	   %><font size=4 face="Baskerville Old Face" color=red>Sorry Problem with the database. For other details contact Administrator</font><br><%

      }
	 
     %>
</body>

</html>
