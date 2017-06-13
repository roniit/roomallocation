<html>
<head>  <TITLE>  ROOM ALLOCATION SYSTEM </TITLE>
</head>
<body>
<% 
try{
	response.setContentType("text/html");
     response.setHeader("Cache-Control","no-cache"); 
     response.setHeader("Cache-Control","no-store");
     response.setDateHeader("Expires", 0);
     response.setHeader("Pragma","no-cache"); 
     
     (request.getSession(false)).invalidate();
	//session.removeAttribute("USERID");
	//session.setMaxInactiveInterval(1);
	//session.removeAll();
	//session.invalidate();
	%> <jsp:forward page="MainPage.html"/><%
}
catch(Exception e)
      {
        out.println(e.toString());
		%><center><font size=4 face="Baskerville Old Face" color=red>Sorry Session is not validated. Please Login again</font><br><%
      }
	  %>
	  

</body>
</html>