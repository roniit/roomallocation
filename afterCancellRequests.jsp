<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
   <TITLE>  ROOM ALLOCATION SYSTEM - REQUEST CANCELLATION</TITLE>
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
	  //#############DATA BASE CONNECTIVITY##########################################
	  Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomdatabase","root","123");
		Statement stmt=con.createStatement();
	//################################################################################
	//#############GETTING REQUEST ID TO BE CANCELLED################################
		String x=(String)session.getAttribute("REQUESTID1");session.removeAttribute("REQUESTID1");
		String userid=null;userid=(String)session.getAttribute("USERID");
	//#################################################################################
//		out.println(x);
//#############DELETING CORRESPONDING ROWS FROM roomallocation and requestroom tables################
		int x1=stmt.executeUpdate("delete from roomallocation where requestID='"+x+"'");
		int y1=stmt.executeUpdate("update requestroom set requestStatus='CANCELLED',lastUpdatedUser='"+userid+"' where requestID='"+x+"'");
//###################################################################################################
		if(x1>0 && y1>0)
	 {//#####################DISPLAYING STATUS############################################################
			%></center><font size=5 face="Baskerville Old Face" color=darkbrown>Request is Cancelled and its status is updated</font><%
	 //##################################################################################################
	 }
		else
	 {
			%><font size=4 face="Baskerville Old Face" color=blue>Sorry, Their is a problem with the database. Please try again or contact administrator</font><%
	 }
 }
 catch(Exception e)
 {
	// out.println(e.toString());
			%><center><font size=5 face="Baskerville Old Face" color=red>Sorry Their is a problem with the database. Please try again or contact administrator</font><%
 }%>
 </body>
 </html>
