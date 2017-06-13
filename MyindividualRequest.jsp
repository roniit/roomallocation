<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
   <TITLE>  ROOM ALLOCATION SYSTEM </TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">
 </HEAD>

 <BODY background=abc.jpg>

 <%
 String requestID=request.getParameter("id");
 String requeststatus=null;
 //requeststatus=request.getParameter("requeststatus");
 //out.println(requeststatus+" "+requestID);
 try{
		 Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomdatabase","root","123");
		Statement stmt=con.createStatement();
		if(requeststatus==null)
	 {
		ResultSet rs=null;
		String status=null;
		rs=stmt.executeQuery("select * from requestroom,user,locationtable where (requestroom.userID=user.userID and locationtable.locationId=requestroom.location and requestID='"+requestID+"') order by requestID asc");
		rs.next();

		%>
		<form method="post" action="individualRequest.jsp">
 <center>
<% session.setAttribute("REQUESTID",rs.getString(1));session.setMaxInactiveInterval(36000);%>
<table border=0>
<tr><td></td><td><font size=4 face="Baskerville Old Face" color=blue>Requested User</font></td><td><font size=4 face="Baskerville Old Face" color=green><%=rs.getString(20)%></font></td><td></td></tr><tr></tr>

<tr><td><font size=4 face="Baskerville Old Face" color=blue>Start Date</td><td><font size=4 face="Baskerville Old Face" color=green><%=rs.getString(3)%></font></td><td><font size=4 face="Baskerville Old Face" color=blue>End Date</font></td><td><font size=4 face="Baskerville Old Face" color=green><%=rs.getString(4)%></font></td></tr>

<tr><td><font size=4 face="Baskerville Old Face" color=blue>Start Time</td><td><font size=4 face="Baskerville Old Face" color=green><%=rs.getString(5)%></font></td><td><font size=4 face="Baskerville Old Face" color=blue>End Time</font></td><td><font size=4 face="Baskerville Old Face" color=green><%=rs.getString(6)%></font></td></tr>

<tr><td><font size=4 face="Baskerville Old Face" color=blue>Location</td><td><font size=4 face="Baskerville Old Face" color=green><%=rs.getString(32)%></font></td><td><font size=4 face="Baskerville Old Face" color=blue>Capacity</font></td><td><font size=4 face="Baskerville Old Face" color=green><%=rs.getString(8)%></font></td></tr>

<tr><td><font size=4 face="Baskerville Old Face" color=blue>Recurring Title</td><td><font size=4 face="Baskerville Old Face" color=green><%=rs.getString(10)%></font></td>
<%status=rs.getString(15);%>
<td><font size=4 face="Baskerville Old Face" color=blue>Status</td><td><font size=5 face="Baskerville Old Face" color=green><%=status%></td>
</tr>
<tr><td><font size=4 face="Baskerville Old Face" color=blue>Request Type</font></td><td colspan=4><font size=4 face="Baskerville Old Face" color=green><%=rs.getString(11)%></font></td></tr>
<tr><td><font size=4 face="Baskerville Old Face" color=blue>Purpose</font></td><td colspan=4><font size=4 face="Baskerville Old Face" color=green><%=rs.getString(9)%></font></td></tr>
<tr><td><font size=4 face="Baskerville Old Face" color=blue>Approval Comments</font></td><td colspan=4><font size=4 face="Baskerville Old Face" color=green><%=rs.getString(18)%></font></td></tr>
<%rs.close();
if(status.equals("APPROVED"))
		 {
	rs=stmt.executeQuery("select distinct(roomno) from roomallocation,room where roomallocation.roomID=room.roomID and roomallocation.requestID='"+requestID+"'");
	if(rs.next())
			 {%>
<tr><td><font size=4 face="Baskerville Old Face" color=blue>Allocated Room</font></td><td colspan=4><font size=4 face="Baskerville Old Face" color=green><%=rs.getString(1)%></font></td></tr>
<%
			 }
		 }
%>
</table>
<script>
document.write("<input type='button' " +
"onClick='window.print()' " +
"class='printbutton' " +
"value='Print This Page'/>");
</script>
<%}
 else{}
}
catch(Exception e)
{
	//out.println(e.toString());
	%><font size=4 face="Baskerville Old Face" color=red>Sorry Problem with the database. TRY AGAIN AFTER SOME TIME. For other details contact Administrator</font><br><%

}


 %>
 </body>
 </html>
