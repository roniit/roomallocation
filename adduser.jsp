<%@ page language="java" contentType="text/html" %>
<%@ page import ="java.sql.*" %>
<html>
<head>  <TITLE>  ROOM ALLOCATION SYSTEM - ADDING USER</TITLE>
</head>
<body background="abc.jpg" >
<%
try
{
	String loginid=request.getParameter("userid");
	String password1=request.getParameter("pass");
	String name1=request.getParameter("name");
	String email1=request.getParameter("email");
	String dept1=request.getParameter("dept");
	String extnumber=request.getParameter("exnumber");
	String mnumber=request.getParameter("mobilenumber");
	//############DATA BASE CONNECTIVITY#######################################################
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomdatabase","root","123");
	Statement stmt=con.createStatement();
	Statement stmt1=con.createStatement();
	ResultSet rs=null;
	//##############################################################################################
	String presentID=null;
	presentID = (String)session.getAttribute("USERID");
	String userstatus=null;
	userstatus=request.getParameter("accessprivilage");
	//################# QUERY TO CHECK WHETHER USERID OR EMAILID IS ALREADY EXISTED OR NOT ######################
	rs=stmt.executeQuery("select * from user where (loginID='"+loginid+"' or email='"+email1+"')");
	ResultSet rs5=null;
	rs5=stmt1.executeQuery("select count(*) from user");
	rs5.next();
	String count = rs5.getString(1);
	int temp4 = Integer.parseInt(count);
	temp4++;
	count = Integer.toString(temp4);
	out.println("Ye");
	out.println(count);
					
			//#################CHWCKING INPUT VALUES IF ANY ONE IS NULL OR NOT ######################################
	if(loginid==null || password1==null || name1==null || email1==null ||dept1==null || extnumber==null || mnumber== null || userstatus==null)
	{
			%>
			<font size=4 face="Baskerville Old Face" color=red>Sorry No field is null. Please Enter valid data in each and every field</font><br>
			<font size=4 face="Baskerville Old Face" color=red>Access Privilage Should be selected</font>
			<%
	}
	else
	{
		if(!rs.next())
		{
			int i=0;
			//########################## UPDATING TABLE#########################################################
			i=stmt.executeUpdate("insert into user(userID,loginID,password,name,email,department,extenNumber,mobileNumber,IDStatus,accessPrivilage,lastUpdatedUser) values('"+count+"','"+loginid+"','"+password1+"','"+name1+"','"+email1+"','"+dept1+"','"+extnumber+"','"+mnumber+"','ACTIVE','"+userstatus+"','"+presentID+"')");
			
			if(i>0)
			{
					%>	
					<br>
					<center>
					<font size=4 face="Baskerville Old Face" color=green> 
					User details are successfully added to database
					</font>
					<%
					
					
				}
				else
				{
					%>
					<font size=4 face="Baskerville Old Face" color=red>Sorry User Details are not added to Database. Please Check the input values and try again or Contact Administrator</font><br>
					<%
				}
				
				
				stmt.close();
				con.close();
				%>
			<script>
			window.location.href = "<%=request.getContextPath()%>/userChanges.jsp";
			</script>
			<%					
		}
		else
		{
			%>
			<font size=4 face="Baskerville Old Face" color=red>Sorry LoginID or Email is already existed. Try again by choosing different userid or emailid</font>
			<%
		}
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
