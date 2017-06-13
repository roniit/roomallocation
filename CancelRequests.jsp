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
  try{
	  String buttonType=null;
	  buttonType=request.getQueryString();
	  Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomdatabase","root","123");
		Statement stmt=con.createStatement();
	  if(buttonType==null)
	 {
		ResultSet rs=null;
		rs=stmt.executeQuery("select * from requestroom where requestID IN (select distinct(roomallocation.requestID) from roomallocation where allocationstatus='NOTCOMPLETED') order by requestID desc"); 
		if(rs.next())
	 {
			rs.previous();
		%>
		<form method="post" name="form1" action="CancelRequests.jsp">
		<font size=5 face="Baskerville Old Face" color=green><u>Select Cacellation Requests</font><br><br>
		<center>
	<table border=1>
			<tr><td align=center><font size=4 face="Baskerville Old Face" color=blue>RequestID</font></td><td align=center><font size=4 face="Baskerville Old Face" color=blue>DateOfRequest</font></td><td align=center><font size=4 face="Baskerville Old Face" color=blue>Status</font></td><td align=center><font size=4 face="Baskerville Old Face" color=blue>Title</font></td><td align=center><font size=4 face="Baskerville Old Face" color=blue>Start Date</font></td><td align=center><font size=4 face="Baskerville Old Face" color=blue>End Date</font></td></tr>
			<%
			while(rs.next())
		 {
			String id=null;
			id=rs.getString(1);
			%><tr>
			<td align=center><font size=4 face="Baskerville Old Face" color=green><a href="CancelRequests.jsp?<%=id%>"><%=id%></a></font></td>
			<td align=center><font size=4 face="Baskerville Old Face" color=green><%=rs.getString(14)%></font></td>
			<td align=center><font size=4 face="Baskerville Old Face" color=green><%=rs.getString(15)%></font></td>
			<td align=center><font size=4 face="Baskerville Old Face" color=green><%=rs.getString(10)%></font></td>
			<td align=center><font size=4 face="Baskerville Old Face" color=green><%=rs.getString(3)%></font></td>
			<td align=center><font size=4 face="Baskerville Old Face" color=green><%=rs.getString(4)%></font></td>

		 <%}
		 rs.close();
		 %></table></center>
			</form>
  
  <%}
  else
	 {
	  %><CENTER><font size=4 face="Baskerville Old Face" color=blue>NO MORE ALLOCATIONS IN DATABASE</font><%
	 }
	 }
	 else
	 {
		 
		// out.println(buttonType);
		ResultSet rs=null;
		String status=null;
		rs=stmt.executeQuery("select * from requestroom,user,locationtable where (requestroom.userID=user.userID and locationtable.locationId=requestroom.location and requestID='"+buttonType+"') order by requestID asc");
		rs.next();

		%>
		<form method="post" action="afterCancellRequests.jsp">
 <center>
<% session.setAttribute("REQUESTID1",rs.getString(1));
		session.setMaxInactiveInterval(36000);%>
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
	rs=stmt.executeQuery("select distinct(roomno) from roomallocation,room where roomallocation.roomID=room.roomID and roomallocation.requestID='"+buttonType+"'");
	if(rs.next())
			 {%>
<tr><td><font size=4 face="Baskerville Old Face" color=blue>Allocated Room</font></td><td colspan=4><font size=4 face="Baskerville Old Face" color=green><%=rs.getString(1)%></font></td></tr>
<%
			 }
		 }
%></table><input type="submit" name="Cancel" value="CancellRequest"><%

	 }
 }
 catch(Exception e)
 {
	// out.println(e.toString());
			%><center><font size=5 face="Baskerville Old Face" color=red>Sorry Their is a problem with the database. Please try again by login again or contact Administrator</font><%
 }
  
  %>
</body>
</html>
