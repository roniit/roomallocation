<html>
<head>  <TITLE>  ROOM ALLOCATION SYSTEM </TITLE></head>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<body background=abc.jpg>
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomdatabase","root","123");
		Statement stmt=con.createStatement();
		Statement stmt1=con.createStatement();
		ResultSet rs=null,rs2=null;
String getstr=request.getQueryString();
//out.println("sdsds------"+getstr);
String divarray[]=getstr.split("&");
String curdate=null;
String roomid=null;
roomid=divarray[0];
if(!roomid.equals("ALL"))
	{
curdate=divarray[1];
String sp[]=curdate.split("-");
int year1=Integer.parseInt(sp[0]);
int month1=Integer.parseInt(sp[1]);
int date1=Integer.parseInt(sp[2]);
Calendar c1 = Calendar.getInstance();
c1.set(year1,(month1-1),date1);
int x=c1.get(Calendar.DAY_OF_WEEK);
//out.println(x);
String passstr=divarray[2];
rs=stmt.executeQuery("select roomno from room where roomID='"+roomid+"'");
String roomnumber=null;
rs.next();
roomnumber=rs.getString(1);
rs.close();
//out.println("to next page---"+passstr);
%>
<font size=5 face="TimesNewRoman" color=darkpink><I><B>Room details for a particular day</B></I></font>
<div align="right"><a href="nextcheckIndividualReports.jsp?<%=passstr%>">BACK</a></div>
<center>
<%
String dayofweek=null;
switch(x)
	{
	case 1:dayofweek="SUNDAY";break;
	case 2:dayofweek="MONDAY";break;
	case 3:dayofweek="TUESDAY";break;
	case 4:dayofweek="WEDNESDAY";break;
	case 5:dayofweek="THURSDAY";break;
	case 6:dayofweek="FRIDAY";break;
	case 7:dayofweek="SATURDAY";break;
	}
//	out.println(dayofweek);
rs=stmt.executeQuery("select * from roomallocation,requestroom,user where roomallocation.requestID=requestroom.requestID and requestroom.userID=user.userID and roomID='"+divarray[0]+"' and givenDate='"+divarray[1]+"' order by roomallocation.startTime,roomallocation.endTime");
%>
<table border=0>
<tr><td><font size=4 face="TimesNewRoman" color=blue>Room number</font></td><td><font size=4 face="TimesNewRoman" color=darkbrown><%=roomnumber%></font></td><td>&nbsp;&nbsp;&nbsp;</td><td><font size=4 face="TimesNewRoman" color=blue>Date</font></td><td><font size=4 face="TimesNewRoman" color=darkbrown><%=curdate%></font></td><td>&nbsp;&nbsp;&nbsp;</td><td><font size=4 face="TimesNewRoman" color=blue>Day_of_the_week</font></td><td><font size=4 face="TimesNewRoman" color=darkbrown><%=dayofweek%></font></td></tr></table><br>
<table border=1><tr><td align=center><font size=4 face="TimesNewRoman" color=blue>TIMINGS</font></td><td></td><td align=center><font size=4 face="TimesNewRoman" color=blue>TITLE</font></td><td align=center><font size=4 face="TimesNewRoman" color=blue>REQUESTED BY</font></td></tr>
<%
while(rs.next())
	{
		String stime=rs.getString(5);
		String tempstime[]=stime.split(":");
		String realstime=tempstime[0]+":"+tempstime[1];
		String etime=rs.getString(6);
		String tempetime[]=etime.split(":");
		String realetime=tempetime[0]+":"+tempetime[1];
		String title=rs.getString(19);
		%><tr><td><font size=4 face="TimesNewRoman" color=green><%out.println(realstime+"-"+realetime);%></font></td><td></td><td><font size=4 face="TimesNewRoman" color=green><%=title%></font></td><td><font size=4 face="TimesNewRoman" color=green><%=rs.getString(31)%></font></td></tr><%
	}
		%></table>
		<script>
document.write("<input type='button' " +
"onClick='window.print()' " +
"class='printbutton' " +
"value='Print This Page'/>");
</script>
		<%
	}
else
	{
//#########################################################################################################
//	out.println("code for all rooms");
	curdate=divarray[1];
String sp[]=curdate.split("-");
int year1=Integer.parseInt(sp[0]);
int month1=Integer.parseInt(sp[1]);
int date1=Integer.parseInt(sp[2]);
Calendar c1 = Calendar.getInstance();
c1.set(year1,(month1-1),date1);
int x=c1.get(Calendar.DAY_OF_WEEK);
//out.println(x);
String passstr=divarray[2];
//out.println("div string  "+divarray[2]);
//rs=stmt.executeQuery("select roomno from room where roomID='"+roomid+"'");
String roomnumber=null;
//rs.next();
//roomnumber=rs.getString(1);
//rs.close();
//out.println("to next page---"+passstr);
%>
<div align="right"><a href="nextcheckIndividualReports.jsp?<%=passstr%>">BACK</a></div>
<center>
<%
String dayofweek=null;
switch(x)
	{
	case 1:dayofweek="SUNDAY";break;
	case 2:dayofweek="MONDAY";break;
	case 3:dayofweek="TUESDAY";break;
	case 4:dayofweek="WEDNESDAY";break;
	case 5:dayofweek="THURSDAY";break;
	case 6:dayofweek="FRIDAY";break;
	case 7:dayofweek="SATURDAY";break;
	}
//	out.println(dayofweek);
rs=stmt.executeQuery("select * from roomallocation,requestroom,room where roomallocation.requestID=requestroom.requestID and roomallocation.roomID=room.roomID and givenDate='"+divarray[1]+"' order by roomallocation.startTime,roomallocation.endTime");
%>
<div align="left"><font size=5 face="TimesNewRoman" color=darkpink>All Rooms Details for a Particular Day</font></div><br>
<table border=0>
<tr><td></td><td><font size=4 face="TimesNewRoman" color=darkpink>FOR ALLROOMS</font></td><td></td><td><font size=4 face="TimesNewRoman" color=blue>DATE</font></td><td><font size=4 face="TimesNewRoman" color=darkbrown><%=curdate%></font></td><td></td><td><font size=4 face="TimesNewRoman" color=blue>DAY_OF_THE_WEEK</font></td><td><font size=4 face="TimesNewRoman" color=darkbrown><%=dayofweek%></font></td></tr></table>
<table border=1 cellspacing=3 cellpadding=3><tr><td align=center><font size=4 face="TimesNewRoman" color=blue>Timings</font></td><td></td><td align=center><font size=4 face="TimesNewRoman" color=blue>TITLE</font></td><td><font size=4 face="TimesNewRoman" color=blue>Allocated Room</font></td></tr>
<%
while(rs.next())
	{
		String stime=rs.getString(5);
		String tempstime[]=stime.split(":");
		String realstime=tempstime[0]+":"+tempstime[1];
		String etime=rs.getString(6);
		String tempetime[]=etime.split(":");
		String realetime=tempetime[0]+":"+tempetime[1];
		String title=rs.getString(19);
		%><tr><td><font size=4 face="TimesNewRoman" color=green><%out.println(realstime+"-"+realetime);%></font></td><td></td><td><font size=4 face="TimesNewRoman" color=green><%=title%></font></td><td><font size=4 face="TimesNewRoman" color=green><%=rs.getString(29)%></font></td></tr><%
	}
		%></table>
		<script>
document.write("<input type='button' " +
"onClick='window.print()' " +
"class='printbutton' " +
"value='Print This Page'/>");
</script>
		<%

//#########################################################################################################
	}
}
catch(Exception e)
{
	//out.println(e.toString());
	%><font size=4 face="Baskerville Old Face" color=red>Sorry problem with database. TRY AGAIN. For other details contact Administrator</font><br><%
}%>
</body>
</html>
