<%@ page language="java" contentType="text/html" %>
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
  <script src="jquery-3.2.1.min.js"></script>
  <script src="jquery-1.4.4.min.js" type="text/javascript"></script>
        <script src="jquery.dataTables.min.js" type="text/javascript"></script>

        <script src="jquery-ui.js" type="text/javascript"></script>

        <script src="jquery.dataTables.columnFilter.js" type="text/javascript"></script>

		<script type="text/javascript" charset="utf-8">
			$(document).ready( function () {
				$('#example').dataTable().columnFilter();
				
			} );
		</script>
		<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.15/css/jquery.dataTables.css">
  
	<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>
<script>		
$.fn.dataTable.ext.search.push(
    function( settings, data, dataIndex ) {
        var min = parseInt( $('#min').val(), 10 );
        var max = parseInt( $('#max').val(), 10 );
        var age = parseFloat( data[0] ) || 0; 
 
        if ( ( isNaN( min ) && isNaN( max ) ) ||
             ( isNaN( min ) && age <= max ) ||
             ( min <= age   && isNaN( max ) ) ||
             ( min <= age   && age <= max ) )
        {
            return true;
        }
        return false;
    }
);
 
$(document).ready(function() {
    var table = $('#example').DataTable();
     
    $('#min, #max').keyup( function() {
        table.draw();
    } );
} );
</script>

 </HEAD>
 <BODY background=abc.jpg>
<MARQUEE DIRECTION=LEFT> <font size=5 face="Baskerville Old Face" color=red>Refresh the page to view Latest Database Updates</font></marquee>
<form method="post" action="approveRequests.jsp">
 <center>
 <input type="submit" name="buttonType" value="Open Requests">&nbsp;&nbsp;&nbsp;
 <input type="submit" name="buttonType" value="Approved Requests">&nbsp;&nbsp;&nbsp;
 <input type="submit" name="buttonType" value="Rejected Requests">&nbsp;&nbsp;&nbsp;
 <input type="submit" name="buttonType" value="Cancelled Requests">&nbsp;&nbsp;&nbsp;
 


</form>

 <form method="post" action="approveRequests.jsp">
            Request Type: <select name="buttonType" id="testsamp">
                <option value="select" selected>Select</option>
                <option value="Open Requests">Open Requests</option>
                <option value="Approved Requests">Approved Requests</option>
                <option value="Rejected Requests">Rejected Requests</option>
                <option value="Cancelled Requests">Cancelled Requests</option>    
            </select> 
           <input type="submit" value="Enter" />
    </form>
    
    <table border="0" cellspacing="5" cellpadding="5">
        <tbody><tr>
            <td>Minimum Capacity:</td>
            <td><input type="text" id="min" name="min"></td>
        </tr>
        <tr>
            <td>Maximum Capacity:</td>
            <td><input type="text" id="max" name="max"></td>
        </tr>
    </tbody></table>
<%
try
{
	String test = null;
	test= request.getParameter("testsamp");
	//out.println(test);
	String buttonType=null;
	
	buttonType=request.getParameter("buttonType");
	if(buttonType!=null)
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomdatabase","root","123");
		Statement stmt=con.createStatement();
		Statement stmt2=con.createStatement();
		String user=(String)session.getAttribute("USERID");
		//out.println(user);
		if(buttonType.equals("Open Requests"))
		{
			ResultSet rs=null;
			rs=stmt.executeQuery("select * from requestroom,user where (requeststatus='OPEN' and requestroom.userID=user.userID and requestroom.userID<>'"+user+"') order by requestID desc");
			if(rs.next())
			{
				%>
				<br>
				
				
				<div align=left>
					<font size=5 face="Baskerville Old Face" color=barkbrown><u>Open Requests for You<u></font>
				</div>
				<br>
				<table border=1 class="display" id="example">
				<tr>
					<td>
						<font size=4 face="Baskerville Old Face" color=blue>RequestID</font>
					</td>
					<td>
						<font size=4 face="Baskerville Old Face" color=blue>Requested User</font>
					</td>
					<td>
						<font size=4 face="Baskerville Old Face" color=blue>Date of Request</font>
					</td>
					<td>
						<font size=4 face="Baskerville Old Face" color=blue>Status</font>
					</td>
					<td>
						<font size=4 face="Baskerville Old Face" color=blue>Title</font>
					</td>
					<td id="min">
						<font size=4 face="Baskerville Old Face" color=blue>Requested Capacity</font>
					</td>
					<td>
						<font size=4 face="Baskerville Old Face" color=blue>Request Type</font>
					</td>
				</tr>
				<%

				rs.previous();
				while(rs.next())
				{
					String requestID=null;
					requestID=rs.getString(1);
					
					String userid=null;
					userid=rs.getString(2);
					
					String loginid=null;
					loginid=rs.getString(20);
					
					String dateofrequest=null;
					dateofrequest=rs.getString(14);
					
					String requeststatus=null;
					requeststatus=rs.getString(15);
					
					String title=null;
					title=rs.getString(10);
					
					String capacity=null;
					capacity=rs.getString(8);
					
					String requesttype=null;
					requesttype=rs.getString(11);
					
					%>
					<tr>
						  <td id="max" name="max">
							<font size=4 face="Baskerville Old Face" color=green><a href="individualRequest.jsp?<%=requestID%>"><%=requestID%></a></font>
						  </td>	
						  <td>
							<font size=4 face="Baskerville Old Face" color=green><%=loginid%></font>
						  </td>	
						  <td>
							<font size=4 face="Baskerville Old Face" color=green><%=dateofrequest%></font>
						  </td>
						  <td>
							<font size=4 face="Baskerville Old Face" color=green><%=requeststatus%></font>
						  </td>
						  <td >
							<font size=4 face="Baskerville Old Face" color=green><%=title%></font>
						  </td>
						  <td id="min">
							<font size=4 face="Baskerville Old Face" color=green><%=capacity%></font>
						  </td>
						  <td>
							<font size=4 face="Baskerville Old Face" color=green><%=requesttype%></font>
						  </td>
					<%
				}
				rs.close();
			}
			else
			{
				%>
				<center><font size=5 face="Baskerville Old Face" color=green> Their are no Pending requests</font></center>
				<%
			}

		}
		else if(buttonType.equals("Approved Requests"))
		{
			ResultSet rs=null;
			rs=stmt.executeQuery("select * from requestroom,user where (requeststatus='APPROVED' and requestroom.userID=user.userID) order by requestID desc");
			if(rs.next())
			{
			%>
			<br>
			<div align=left><font size=5 face="Baskerville Old Face" color=barkbrown><u>Approved Requests</u></font>
			</div>
			<br>
			<table border=1 class="display" id="example">
			<tr>
				<td>
					<font size=4 face="Baskerville Old Face" color=blue>RequestID</font>
				</td>
				<td>
					<font size=4 face="Baskerville Old Face" color=blue>Requested User</font>
				</td>
				<td>
					<font size=4 face="Baskerville Old Face" color=blue>Date of Request</font>
				</td>
				<td>
					<font size=4 face="Baskerville Old Face" color=blue>Status</font>
				</td>
				<td>
					<font size=4 face="Baskerville Old Face" color=blue>Title</font>
				</td>
				<td id="min">
					<font size=4 face="Baskerville Old Face" color=blue>Requested Capacity</font>
				</td>
				<td>
					<font size=4 face="Baskerville Old Face" color=blue>Request Type</font>
				</td>
				<td>
					<font size=4 face="Baskerville Old Face" color=blue>Approved By</font>
				</td>
			</tr>
			<%
				rs.previous();
				while(rs.next())
				{
					String requestID=null;
					requestID=rs.getString(1);
					
					String userid=null;
					userid=rs.getString(2);
					
					String loginid=null;
					loginid=rs.getString(20);
					
					String dateofrequest=null;
					dateofrequest=rs.getString(14);
					
					String requeststatus=null;
					requeststatus=rs.getString(15);
					
					String title=null;
					title=rs.getString(10);
					
					String capacity=null;
					capacity=rs.getString(8);
					
					String requesttype=null;
					requesttype=rs.getString(11);
					
					String updatedid=rs.getString(17);
					ResultSet rsTemp=stmt2.executeQuery("select name from user where userID='"+updatedid+"'");
					rsTemp.next();
					
					String updatedby=null;
					updatedby=rsTemp.getString(1);
					%>
					<tr>
					<td id="max" name="max">
						<font size=4 face="Baskerville Old Face" color=green><a href="individualRequest.jsp?<%=requestID%>"><%=requestID%></a></font>
					</td>
				    <td>
						<font size=4 face="Baskerville Old Face" color=green><%=loginid%></font>
				    </td>	
				    <td>
						<font size=4 face="Baskerville Old Face" color=green><%=dateofrequest%></font>
				    </td>
			 	    <td>
						<font size=4 face="Baskerville Old Face" color=green><%=requeststatus%></font>
				    </td>
				    <td>
						<font size=4 face="Baskerville Old Face" color=green><%=title%></font>
				    </td>
			  	    <td id="min">
						<font size=4 face="Baskerville Old Face" color=green><%=capacity%></font>
			 	    </td>
				    <td>
						<font size=4 face="Baskerville Old Face" color=green><%=requesttype%></font>
				    </td>
				    <td>
						<font size=4 face="Baskerville Old Face" color=green><%=updatedby%></font>
				    </td>
				<%
				}
				rs.close();
			}
			else
			{
				%>
				<center><font size=4 face="Baskerville Old Face" color=green> Their is no Approved requests</font></center>
				<%
			}

		}
		else if(buttonType.equals("Rejected Requests"))
		{
			ResultSet rs=null;
			rs=stmt.executeQuery("select * from requestroom,user where (requeststatus='REJECTED' and requestroom.userID=user.userID) order by requestID desc");
			if(rs.next())
			{
			%>
			<br>
			<div align=left><font size=5 face="Baskerville Old Face" color=barkbrown><u>Rejected Requests</u></font>
			</div>
			<br>
			<table border=1 class="display" id="example">
			<tr>
				<td>
					<font size=4 face="Baskerville Old Face" color=blue>RequestID</font>
				</td>
				
				<td>
					<font size=4 face="Baskerville Old Face" color=blue>Requested User</font>
				</td>
				
				<td>
					<font size=4 face="Baskerville Old Face" color=blue>Date of Request</font>
				</td>
				
				<td>
					<font size=4 face="Baskerville Old Face" color=blue>Status</font>
				</td>
				
				<td>
					<font size=4 face="Baskerville Old Face" color=blue>Title</font>
				</td>
				
				<td id="min">
					<font size=4 face="Baskerville Old Face" color=blue>Requested Capacity</font>
				</td>
				
				<td>
					<font size=4 face="Baskerville Old Face" color=blue>Request Type</font>
				</td>
				
				<td>
					<font size=4 face="Baskerville Old Face" color=blue>Rejected By</font>
				</td>
			</tr>
			<%
				rs.previous();
				while(rs.next())
				{
					String requestID=null;
					requestID=rs.getString(1);
					
					String userid=null;
					userid=rs.getString(2);
					
					String loginid=null;
					loginid=rs.getString(20);
					
					String dateofrequest=null;
					dateofrequest=rs.getString(14);
					
					String requeststatus=null;
					requeststatus=rs.getString(15);
					
					String title=null;
					title=rs.getString(10);
					
					String capacity=null;
					capacity=rs.getString(8);
					
					String requesttype=null;
					requesttype=rs.getString(11);
					
					String updatedid=rs.getString(17);
					ResultSet rsTemp=stmt2.executeQuery("select name from user where userID='"+updatedid+"'");
					rsTemp.next();
					String updatedby=null;
					updatedby=rsTemp.getString(1);
					%>
					<tr>
					<td id="max" name="max">
					<font size=4 face="Baskerville Old Face" color=green><a href="individualRequest.jsp?<%=requestID%>"><%=requestID%></a></font>
					</td>
						  <td>
								<font size=4 face="Baskerville Old Face" color=green><%=loginid%></font>
						  </td>	
						  <td>
								<font size=4 face="Baskerville Old Face" color=green><%=dateofrequest%></font>
						  </td>
						  <td>
								<font size=4 face="Baskerville Old Face" color=green><%=requeststatus%></font>
						  </td>
						  <td>
								<font size=4 face="Baskerville Old Face" color=green><%=title%></font>
						  </td>
						  <td id="min">
								<font size=4 face="Baskerville Old Face" color=green><%=capacity%></font>
						  </td>
						  <td>
								<font size=4 face="Baskerville Old Face" color=green><%=requesttype%></font>
						  </td>
						   <td>
								<font size=4 face="Baskerville Old Face" color=green><%=updatedby%></font>
						   </td>
				<%
				}
					rs.close();
			}
			else
			{
				%>
				<center><font size=4 face="Baskerville Old Face" color=green> Their is no Rejected requests</font></center>
				<%
			}
		}
		
		else if(buttonType.equals("Cancelled Requests"))
		{
			ResultSet rs=null;
			rs=stmt.executeQuery("select * from requestroom,user where (requeststatus='CANCELLED' and requestroom.userID=user.userID) order by requestID desc");
			if(rs.next())
			{
				%>
				<br><div align=left><font size=5 face="Baskerville Old Face" color=barkbrown><u>Cancelled Requests</u></font></div><br>
				<table border=1 class="display" id="example">
				<tr>
					<td>
						<font size=4 face="Baskerville Old Face" color=blue>RequestID</font>
					</td>
					
					<td>
						<font size=4 face="Baskerville Old Face" color=blue>Requested User</font>
					</td>
					
					<td>
						<font size=4 face="Baskerville Old Face" color=blue>Date of Request</font>
					</td>
					
					<td>
						<font size=4 face="Baskerville Old Face" color=blue>Status</font>
					</td>
					
					<td>
						<font size=4 face="Baskerville Old Face" color=blue>Title</font>
					</td>
					
					<td id="min">
						<font size=4 face="Baskerville Old Face" color=blue>Requested Capacity</font>
					</td>
					
					<td>
						<font size=4 face="Baskerville Old Face" color=blue>Request Type</font>
					</td>
					
					<td>
						<font size=4 face="Baskerville Old Face" color=blue>Cancelled By</font>
					</td>
					</tr>
					<%
					rs.previous();
					while(rs.next())
					{
						String requestID=null;
						requestID=rs.getString(1);
						
						String userid=null;
						userid=rs.getString(2);
						
						String loginid=null;
						loginid=rs.getString(20);
						
						String dateofrequest=null;
						dateofrequest=rs.getString(14);
						
						String requeststatus=null;
						requeststatus=rs.getString(15);
						
						String title=null;
						title=rs.getString(10);
						
						String capacity=null;
						capacity=rs.getString(8);
						
						String requesttype=null;
						requesttype=rs.getString(11);
						
						String updatedid=rs.getString(17);
						ResultSet rsTemp=stmt2.executeQuery("select name from user where userID='"+updatedid+"'");
						rsTemp.next();
						String updatedby=null;
						updatedby=rsTemp.getString(1);
						%>
						<tr>
						<td id="max" name="max">
						<font size=4 face="Baskerville Old Face" color=green><a href="individualRequest.jsp?<%=requestID%>"><%=requestID%></a></font>
						</td>
							  <td>
									<font size=4 face="Baskerville Old Face" color=green><%=loginid%></font>
							  </td>	
							  <td>
									<font size=4 face="Baskerville Old Face" color=green><%=dateofrequest%></font>
							  </td>
							  <td>
									<font size=4 face="Baskerville Old Face" color=green><%=requeststatus%></font>
							  </td>
							  <td>
									<font size=4 face="Baskerville Old Face" color=green><%=title%></font>
							  </td>
							  <td id="min">
									<font size=4 face="Baskerville Old Face" color=green><%=capacity%></font>
							  </td>
							  <td>
									<font size=4 face="Baskerville Old Face" color=green><%=requesttype%></font>
							  </td>
							  <td>
									<font size=4 face="Baskerville Old Face" color=green><%=updatedby%></font>
							  </td>
					<%
					}
					rs.close();
			}


			//########################################################################################33
			else
			{
				%>
				<center><font size=4 face="Baskerville Old Face" color=green> Their is no Cancelled requests</font></center>
				<%
			}
		}
		%>
		</table><br>
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
		%>
		</center><font size=5 face="Baskerville Old Face" color=green>select options >>
		<%
	}
}
catch(Exception e)
{
	 //out.println(e.toString());
	 %>
	 <font size=4 face="Baskerville Old Face" color=red>Please Check the input data again.Each and every field should not exceed maximum and length and should not be Null. TRY AGAIN. For other details contact Administrator</font><br><%

}
%>
</table>

</body>
</html>
