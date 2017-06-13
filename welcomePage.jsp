<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page language="java" contentType="text/html" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<HTML>
 <HEAD>
    <TITLE>  ROOM ALLOCATION SYSTEM </TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">
 </HEAD>
<body background=abc.jpg>
<font size=6 face="Baskerville Old Face" color=blue> 
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomdatabase","root","123");
		Statement stmt=con.createStatement();
		String test = (String)session.getAttribute("USERNAME");
		out.println("<b>Welcome "+test+ ",</b>");%>
<br></font><br>
<font size=6 face="Baskerville Old Face" color=green> 
<<  &nbsp;&nbsp;Select Options
</font>
<%
Calendar cal = Calendar.getInstance();
        int day = cal.get(Calendar.DATE);
        int month = cal.get(Calendar.MONTH) + 1;
        int year = cal.get(Calendar.YEAR);
		int hours=cal.get(Calendar.HOUR_OF_DAY);
		int minutes=cal.get(Calendar.MINUTE);
		String todaydate=null,nowtime=null;
		todaydate=year+"-"+month+"-"+day;
		nowtime=hours+":"+minutes;
		//out.println(nowtime);
		stmt.executeUpdate("update roomallocation set allocationstatus='COMPLETED' where givenDate<'"+todaydate+"' or (givenDate='"+todaydate+"' and endTime<'"+nowtime+"')");
}
catch(Exception e)
{
//	out.println(e.toString());
%><font size=4 face="Baskerville Old Face" color=red>Sorry Problem with the database. TRY AGAIN AFTER SOME TIME. For other details contact Administrator</font><br><%

}
		%>
</body>
</HTML>
