<%@ page language="java" contentType="text/html" %>
<%@ page import ="java.sql.*" %>
<html>
<head>  <TITLE>  ROOM ALLOCATION SYSTEM </TITLE>
<script type="text/javascript">
  function formValidator(Form1){
              var elem,helperMsg; 
	var oldpassword = document.getElementById('oldpassword');
        var newpassword = document.getElementById('newpassword');
		if(validPassword(oldpassword,"PLEASE ENTER VALID OLD PASSWORD"))
	{
			if(validPassword(newpassword,"PLEASE ENTER VALID NEW PASSWORD"))
		{
				return true;
		}
	}
	return false;
}
function validPassword(elem,helperMsg)
{
	var alphaExp = /^[a-zA-Z0-9@._]+$/;
        if(elem.value==""||elem.value=='null' || elem.value.length<4 || elem.value.length>30)
        {
            alert('Please Enter data in The Required field (SHOULD NOT BE NULL, MINIMUM 4 AND MAXIMUM 30 CHARACTERS)'+' ONLY [a-zA-Z0-9@._] are Allowed');
		elem.focus();
		return false;
	}
	if(elem.value.match(alphaExp)){
		return true;
	}else{
		alert(helperMsg);
		elem.focus();
		return false;
	}
}
</script>
</head>
<body background="abc.jpg" >
<%
try{
String userid=null,buttonType=null;
userid=(String)session.getAttribute("USERID");
buttonType=request.getParameter("submitPassword");
//out.println(userid);
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomdatabase","root","123");
		Statement stmt=con.createStatement();
if(buttonType==null)
	{
%>
<center>
 <form name='form1' method="post" onsubmit='return formValidator(this)' action="ChangePassword.jsp">
	   <fieldset>
		<legend align="left"><font size=4 face="Baskerville Old Face" color=blue><b>Change Password</b></font></legend>
	   <table border=0>
	   <tr><td><font size=4 face="Baskerville Old Face" color=blue>Old Password<font size=4 face="Baskerville Old Face" color=red>*</font></font></td><td><input type="password" name="oldpassword" size=15 id="oldpassword"></td></tr>
	   <tr><td><font size=4 face="Baskerville Old Face" color=blue>New Password<font size=4 face="Baskerville Old Face" color=red>*</font></font></td><td><input type="password" name="newpassword" size=15 id="newpassword"></td></tr>
	   </table>
	   <input type="submit" name="submitPassword" value="submitPassword">
 </form>
 </center>
 <div align="left">(<font size=4 face="Baskerville Old Face" color=red>*</font>)--<font size=4 face="Baskerville Old Face" color=blue>Fields are mandatory</font>
<%}
else
	{
	//out.println(request.getParameter("oldpassword"));
	//	out.println(request.getParameter("newpassword"));
	String oldpass=null,newpass=null;
	oldpass=request.getParameter("oldpassword");
	newpass=request.getParameter("newpassword");
	ResultSet rs=null;
	rs=stmt.executeQuery("select * from user where password='"+oldpass+"' and userID='"+userid+"' and IDStatus='ACTIVE'");
	if(rs.next())
		{
		rs.close();
		int i=stmt.executeUpdate("update user set password='"+newpass+"' where userID='"+userid+"'");
		if(i>0)
			{%><center>
			<font size=5 face="Baskerville Old Face" color=green>Your Password has been Changed</font><%
			}
		else
			{%><center>
			<font size=5 face="Baskerville Old Face" color=red>Sorry Your Password is not changed. Please contact administrator or TRY AGAIN</font><%
			}
		}
	else
		{
		%><center><font size=5 face="Baskerville Old Face" color=red>USERID AND PASSWORD ARE NOT MATCHING. TRY AGAIN</font><%
		}
	}
}
catch(Exception e)
{
//	out.println(e.toString());
		%><center><font size=5 face="Baskerville Old Face" color=red>Sorry. Their is a problem with the database. Try again by login again or contact Administrator</font><%
}
%>
</body>
</html>
