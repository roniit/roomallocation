<%@ page language="java" contentType="text/html" %>
<%@ page import ="java.sql.*" %>
<html>
<head><TITLE> ROOMALLOCATION SYSTEM - ADD ROOMS </TITLE>
</head>
<body background="abc.jpg" >
<%
try
{
	String roomno1=null;
	String locations1=null;
	String capacity1=null;
	String cost1=null;
	String floorno1=null;
	String address1=null;
	String openstatus1=null;
	roomno1=request.getParameter("roomno");
	locations1=request.getParameter("locations");
	capacity1=request.getParameter("capacity");
	cost1=request.getParameter("cost");
	floorno1=request.getParameter("floorno");
//	address1=request.getParameter("address");
	openstatus1=request.getParameter("openstatus");
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomdatabase","root","123");
		Statement stmt=con.createStatement();
		ResultSet rs=null;
		String presentID=null;
		presentID = (String)session.getAttribute("USERID");
		
		rs=stmt.executeQuery("select * from room where roomno='"+roomno1+"'");
//		out.println(roomno1+"  "+locations1+"  "+cost1+"  "+floorno1+"  "+address1+"  "+openstatus1);
		if(roomno1==null || locations1.equals("locations") || cost1==null || floorno1==null || openstatus1.equals("status"))
		{
			%>
			<font size=4 face="Baskerville Old Face" color=red>Sorry No field is null. Please Enter valid data in each and every field</font><br>
			<%
		}
		else
		{
			if(!rs.next())
			{
				int i=0;
				i=stmt.executeUpdate("insert into room(roomno,location,capacity,cost,floorno,openstatus,lastUpdatedUser) values('"+roomno1+"','"+locations1+"',"+capacity1+","+cost1+","+floorno1+",'"+openstatus1+"','"+presentID+"')");
				
				if(i>0)
				{
					%>	
					<br>
					<center>
					<font size=4 face="Baskerville Old Face" color=green> 
					Room details are successfully added to database
					</font>
					<%
					
				}
				else
				{
					%><font size=4 face="Baskerville Old Face" color=red>Sorry Room Details are not added to Database. Please Check the input values and try again or Contact Administrator</font><br><%
				}
				stmt.close();
				con.close();
			}
			else
			{
				%>
				<font size=4 face="Baskerville Old Face" color=red>RoomNumber is already existed. Choose another RoomNumber and try again</font>
				<%
			}
			%>
			<script>
			window.location.href = "<%=request.getContextPath()%>/roomChanges.jsp";
			</script>
			<%	
		}
}
catch(Exception e)
{
	out.println(e.toString());
	%>
	<font size=4 face="Baskerville Old Face" color=red>Please Check the input data again.Each and every field should not exceed maximum and length and should not be Null. (OR) ENABLE JAVASCRIPT OPTION IN YOUR BROWSER. For other details contact Administrator</font><br>
	<%
}
%>
</body>
</html>
