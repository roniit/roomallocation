<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd"> 
<%@ page language="java" contentType="text/html" %>

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<html>
<head>
  <TITLE>  ROOM ALLOCATION SYSTEM </TITLE>
<SCRIPT LANGUAGE="JavaScript">
function formValidator(form1)
{
	var elem,helperMsg;
	var loc=document.getElementById('locations');
	var cap=document.getElementById('size');
	var title=document.getElementById('title');
	var stdate = document.getElementById('startdate');
	var eddate = document.getElementById('enddate');
	if(stdate.value =="" || stdate.value =='null')
	{
		alert("Please Enter valid Start data");
		stdate.focus();
		return false;
	}
	if(eddate.value =="" || eddate.value =='null')
	{
		alert("Please Enter valid End data");
		eddate.focus();
		return false;
	}
	//alert(eddate.value);
	if(loc.value=='locations')
	{
			alert("Please Select Location");
			loc.focus();
				return false;
	}
	var alphaExp = /^[0-9]+$/;
        if(cap.value==""|| cap.value=='null' || !cap.value.match(alphaExp))
	{
			alert("Please Enter valid data in Capacity field");
			cap.focus();
			return false;
	}
	if(title.value=='null' || title.value=='' || title.value.length>47)
	{
		alert("Please Enter Title and length should be less than 47 characters");
		title.focus();
		return false;
	}
}
window.onload = function(){
if(form1.recurrencetype[0].checked==true)
{
//	form1.recurrencetype[1].checked=false;
	
	//form1.weeksun.checked = false;
	form1.weekmon.checked = false;
	form1.weektue.checked = false;
	form1.weekwed.checked = false;
	form1.weekthu.checked = false;
	form1.weekfri.checked = false;
	form1.weeksat.checked = false;

	//form1.weeksun.disabled = true;
	form1.weekmon.disabled = true;
	form1.weektue.disabled = true;
	form1.weekwed.disabled = true;
	form1.weekthu.disabled = true;
	form1.weekfri.disabled = true;
	form1.weeksat.disabled = true;

	form1.dayofmonth.value="";
//	form1.recurrencetype[2].checked=false;
	form1.dayofmonth.disabled=true;
}
else if(form1.recurrencetype[1].checked==true)
	{
//	form1.recurrencetype[0].checked=false;
//	form1.recurrencetype[2].checked=false;
	
	//form1.weeksun.disabled = false;
	form1.weekmon.disabled = false;
	form1.weektue.disabled = false;
	form1.weekwed.disabled = false;
	form1.weekthu.disabled = false;
	form1.weekfri.disabled = false;
	form1.weeksat.disabled = false;

	form1.dayofmonth.value="";
	form1.dayofmonth.disabled=true;
	}
else 
	{
	
	//form1.weeksun.checked = false;
	form1.weekmon.checked = false;
	form1.weektue.checked = false;
	form1.weekwed.checked = false;
	form1.weekthu.checked = false;
	form1.weekfri.checked = false;
	form1.weeksat.checked = false;


	//form1.weeksun.disabled = true;
	form1.weekmon.disabled = true;
	form1.weektue.disabled = true;
	form1.weekwed.disabled = true;
	form1.weekthu.disabled = true;
	form1.weekfri.disabled = true;
	form1.weeksat.disabled = true;

	form1.dayofmonth.disabled=false;
	}	
};
function Disab (val) {
//	alert(form1.recurrencetype[0]);
//	alert(val);
if(val==1)
{//alert("sdasd");
//	form1.recurrencetype[1].checked=false;
//	alert(document.form1.recurrencetype[0]);
	//form1.weeksun.checked = false;
	document.form1.weekmon.checked = false;
	document.form1.weektue.checked = false;
	document.form1.weekwed.checked = false;
	document.form1.weekthu.checked = false;
	document.form1.weekfri.checked = false;
	document.form1.weeksat.checked = false;

	//form1.weeksun.disabled = true;
	document.form1.weekmon.disabled = true;
	document.form1.weektue.disabled = true;
	document.form1.weekwed.disabled = true;
	document.form1.weekthu.disabled = true;
	document.form1.weekfri.disabled = true;
	document.form1.weeksat.disabled = true;

	document.form1.dayofmonth.value="";
//	form1.recurrencetype[2].checked=false;
	document.form1.dayofmonth.disabled=true;
}
else if(val==2)
	{//alert("sdasd");
//	form1.recurrencetype[0].checked=false;
//	form1.recurrencetype[2].checked=false;
	
	//form1.weeksun.disabled = false;
	document.form1.weekmon.disabled = false;
	document.form1.weektue.disabled = false;
	document.form1.weekwed.disabled = false;
	document.form1.weekthu.disabled = false;
	document.form1.weekfri.disabled = false;
	document.form1.weeksat.disabled = false;

	document.form1.dayofmonth.value="";
	document.form1.dayofmonth.disabled=true;
	}
else 
	{
	//alert("sdasd");
	//form1.weeksun.checked = false;
	document.form1.weekmon.checked = false;
	document.form1.weektue.checked = false;
	document.form1.weekwed.checked = false;
	document.form1.weekthu.checked = false;
	document.form1.weekfri.checked = false;
	document.form1.weeksat.checked = false;


	//form1.weeksun.disabled = true;
	document.form1.weekmon.disabled = true;
	document.form1.weektue.disabled = true;
	document.form1.weekwed.disabled = true;
	document.form1.weekthu.disabled = true;
	document.form1.weekfri.disabled = true;
	document.form1.weeksat.disabled = true;

	document.form1.dayofmonth.disabled=false;
	}	
}
</SCRIPT>
</head>
<body background=abc.jpg onUnload="window.opener.location.reload(true);">
<font size=4 face="Baskerville Old Face" color=blue> 
<% 
try{
String test = (String)session.getAttribute("USERNAME");
String userid=(String)session.getAttribute("USERID");
int useridint=0;

useridint=Integer.parseInt(userid);
out.println("<b>Welcome "+test+ ",</b>");%>
<br>
<%
String submitButtonValue=null;
String finalSubmit=null;
submitButtonValue=request.getParameter("submitRequest");
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomdatabase","root","123");
		Statement stmt=con.createStatement();
if((submitButtonValue==null))
{
	%>
<form name="form1" method="post" onsubmit='return formValidator(this)' action="EnterRequestFinal.jsp">
<fieldset>
<legend align="left"><font size=3 face="TimesNewRoman" color=blue><b>Request Details</b></font></legend>
<center>
<font size=4 face="TimesNewRoman" color=blue>
Booking Period &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Meeting Time
<table border=0 cellspacing=5>
<tr><td></td><td></td><td></td><td></td><td></td>
<td><font size=3 face="TimesNewRoman" color=blue>HH</font></td><td><font size=3 face="TimesNewRoman" color=blue>MIN</font></td></tr>
<tr>
<%
	Calendar cal = Calendar.getInstance();
        int day = cal.get(Calendar.DATE);
        int month = cal.get(Calendar.MONTH) + 1;
        int year = cal.get(Calendar.YEAR);
		int year1=year;
		int year2=year;
		int hours=cal.get(Calendar.HOUR_OF_DAY);
		int minutes=cal.get(Calendar.MINUTE);
		cal.set(year,month,day);
		int daysInMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
%>
	<td align="left"><font size=4 face="TimesNewRoman" color=blue>Start Date<font size=4 face="Baskerville Old Face" color=red>*</font></td>
	<td>
		<input type="date" name="startdate" id="startdate">
	</td>
	
	
	
	<td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td>
	<td><font size=4 face="TimesNewRoman" color=blue>Start Time</td>
	<td><select name="shours">
		<option value="HH" selected>HH</option>
		<%for(int i=0;i<24;i++)
	{
		if(i==hours)
		{
			%>
			<option value=<%=hours%> selected><%=hours%></option>
			<%}
			else
		{%>
				<option value=<%=i%>><%=i%></option>
				<%}
	}%>
					</select></td>
	<td><select name="sminutes">
		<option value="MIN" selected>MIN</option>
		<%
		if(minutes>0 && minutes<15)
	{%>
		<option value="00">00</option>
		<option value="15" selected>15</option>
		<option value="30">30</option>
		<option value="45">45</option>
		<%}
	else if(minutes>15 && minutes<30)
	{%>
		<option value="00">00</option>
		<option value="15">15</option>
		<option value="30" selected>30</option>
		<option value="45">45</option>
		<%}
	else if(minutes>30 && minutes<45)
	{%>
		<option value="00">00</option>
		<option value="15">15</option>
		<option value="30">30</option>
		<option value="45" selected>45</option>
		<%}
	else
	{%>
				<option value="00" selected>00</option>
		<option value="15">15</option>
		<option value="30">30</option>
		<option value="45">45</option>
		<%}%>

		</select></td>
</tr>
<td align="left"><font size=4 face="TimesNewRoman" color=blue>End Date<font size=4 face="Baskerville Old Face" color=red>*</font></td>
	<td>
		<input type="date" name="enddate" id="enddate" >
	</td>
	
	
	
	<td>&nbsp;&nbsp;</td><td>&nbsp;&nbsp;</td>
	<td><font size=4 face="TimesNewRoman" color=blue>End Time</td>
	<td><select name="ehours">
		<option value="HH" selected>HH</option>
		<%for(int i=0;i<24;i++)
	{
		if(i==hours)
		{
			%>
			<option value=<%=hours%> selected><%=hours%></option>
			<%}
			else
		{%>
				<option value=<%=i%>><%=i%></option>
				<%}
	}%>
					</select></td>
	<td><select name="eminutes">
		<option value="MIN" selected>MIN</option>
		<%
		if(minutes>0 && minutes<15)
	{%>
		
		<option value="00">00</option>
		<option value="15" selected>15</option>
		<option value="30">30</option>
		<option value="45">45</option>
		<%}
	else if(minutes>15 && minutes<30)
	{%>

		<option value="00">00</option>
			<option value="15">15</option>
		<option value="30" selected>30</option>
		<option value="45">45</option>
		<%}
	else if(minutes>30 && minutes<45)
	{%>

		<option value="00">00</option>
			<option value="15">15</option>
		<option value="30">30</option>
		<option value="45" selected>45</option>
		<%}
	else
	{%>

		<option value="00" selected>00</option>
				<option value="15">15</option>
		<option value="30">30</option>
		<option value="45">45</option>
		<%}%>

		</select></td>
</tr><tr>
<td align="left"><font size=4 face="TimesNewRoman" color=blue>Select Location<font size=4 face="Baskerville Old Face" color=red>*</font></td>
<td colspan=3 align="left"><select name="locations" id="locations">
				<option value="locations">locations</option>
				<% ResultSet rs=null;
					rs=stmt.executeQuery("select * from locationtable order by locationName asc");
					while(rs.next())
					{
						String locname=null,locid=null;
						locname=rs.getString(2);
						locid=rs.getString(1);
						if(locname.equals("Electronic City")){%>						
				<option value=<%=locid%> selected><%=locname%></option>
					<%}
						else
						{%><option value=<%=locid%>><%=locname%></option><%

						}
						}rs.close();%>
				</select></td>

<td align="left"><font size=4 face="TimesNewRoman" color=blue>Capacity<font size=4 face="Baskerville Old Face" color=red>*</font></td>
<td colspan=2><input type="text" name="size" size=10 id="size"></td>
</tr>
<tr>
<td align="left"><font size=4 face="TimesNewRoman" color=blue>Recurrence Type</td>
<td colspan=2 align="left"><input type="radio" name="recurrencetype" value="DAILY" onClick="Disab(1)" checked><font size=3 face="TimesNewRoman" color=blue>DAILY
</td>
<td></td><td align="left"><font size=4 face="TimesNewRoman" color=blue>Title<font size=4 face="Baskerville Old Face" color=red>*</font></font></td><td colspan=3><input type="text" name="title" size=10 id="title"></td>
</tr>
<tr>
<td></td>
<td colspan=2 align="left"><input type="radio" name="recurrencetype" value="WEEKLY" onClick="Disab(2)"><font size=3 face="TimesNewRoman" color=blue>WEEKLY
</td>
</tr>
<tr>
<td></td>

<td><font size=3 face="TimesNewRoman" color=blue>MON</td>
<td><font size=3 face="TimesNewRoman" color=blue>TUE</td>
<td><font size=3 face="TimesNewRoman" color=blue>WED</td>
<td><font size=3 face="TimesNewRoman" color=blue>THU</td>
<td><font size=3 face="TimesNewRoman" color=blue>FRI</td>
<td><font size=3 face="TimesNewRoman" color=blue>SAT</td>
</tr>
<tr>
<td></td>

<td><input type="checkbox" name="weekmon" value="MON" disabled></td>
<td><input type="checkbox" name="weektue" value="TUE" disabled></td>
<td><input type="checkbox" name="weekwed" value="WED" disabled></td>
<td><input type="checkbox" name="weekthu" value="THU" disabled></td>
<td><input type="checkbox" name="weekfri" value="FRI" disabled></td>
<td><input type="checkbox" name="weeksat" value="SAT" disabled></td>
</tr>
<tr>
<td></td>
<td colspan=2 align="left"><input type="radio" name="recurrencetype" value="MONTHLY" onClick="Disab(3)"><font size=3 face="TimesNewRoman" color=blue>MONTHLY
</td>
<td colspan=2><font size=3 face="TimesNewRoman" color=blue>Dayofmonth(1-31)</td>
<td colspan=2><input type="text" name="dayofmonth" size=10 disabled></td>
</tr>
<tr><td align="left"><font size=4 face="TimesNewRoman" color=blue>Enter Purpose</font></td>
<td colspan=10 align="left"><textarea name="purpose" rows=4 cols=50></textarea></td>
<td><font size=4 face="TimesNewRoman" color=red>(*Maximum 450 characters)</font></td>
</tr>
</table>
<input type="submit" name="submitRequest" value="SubmitRequest">&nbsp;&nbsp;&nbsp;&nbsp;<input type="RESET">
</fieldset>
</form>
<div align="left">(<font size=4 face="Baskerville Old Face" color=red>*</font>)--<font size=4 face="Baskerville Old Face" color=blue>Fields are mandatory</font>
<%}
else
	{
	
	String syear=null,smonth=null,sdate=null,shours=null,sminutes=null,eyear=null,emonth=null,edate=null,ehours=null,eminutes=null,locations=null,size=null,recurrencetype=null,title=null,purpose=null,startDate=null,endDate=null,startTime=null,endTime=null;
	
	syear=request.getParameter("startdate").substring(0,4);
	//syear=request.getParameter("syear");
	
	smonth=request.getParameter("startdate").substring(5,7);
	//smonth=request.getParameter("smonth");
	
	sdate=request.getParameter("startdate").substring(8,10);
	//sdate=request.getParameter("sdate");
	
	shours=request.getParameter("shours");
	sminutes=request.getParameter("sminutes");
	
	eyear=request.getParameter("enddate").substring(0,4);
	//eyear=request.getParameter("eyear");
	
	emonth=request.getParameter("enddate").substring(5,7);
	//emonth=request.getParameter("emonth");
	
	edate=request.getParameter("enddate").substring(8,10);
	//edate=request.getParameter("edate");
	
	ehours=request.getParameter("ehours");
	eminutes=request.getParameter("eminutes");
	locations=request.getParameter("locations");
	size=request.getParameter("size");
	title=request.getParameter("title");
	recurrencetype=request.getParameter("recurrencetype");
	purpose=request.getParameter("purpose");
	//out.println(recurrencetype);
	if(syear.equals("YYYY") || smonth.equals("MM") || sdate.equals("DD") || shours.equals("HH") || sminutes.equals("MIN") || eyear.equals("YYYY") || emonth.equals("MM") || edate.equals("DD") || ehours.equals("HH") || eminutes.equals("MIN"))
		{%>
		<font size=4 face="TimesNewRoman" color=red> Request details are not valid. Please select the dates and times properly</font>
	<%	}
	else
	{
		 Calendar cal1 = Calendar.getInstance();
		 Calendar cal2 = Calendar.getInstance();
    Calendar currentcal = Calendar.getInstance();
	int syear2=0,smonth2=0,sdate2=0,shours2=0,sminutes2=0;
	int eyear2=0,emonth2=0,edate2=0,ehours2=0,eminutes2=0;
	syear2=Integer.parseInt(syear);
	smonth2=Integer.parseInt(smonth);
	sdate2=Integer.parseInt(sdate);
	shours2=Integer.parseInt(shours);
	sminutes2=Integer.parseInt(sminutes);
	eyear2=Integer.parseInt(eyear);
	emonth2=Integer.parseInt(emonth);
	edate2=Integer.parseInt(edate);
	ehours2=Integer.parseInt(ehours);
	eminutes2=Integer.parseInt(eminutes);
    cal1.set(syear2,smonth2,sdate2);
	cal2.set(eyear2,emonth2,edate2);
    currentcal.set(currentcal.get(Calendar.YEAR),
currentcal.get(Calendar.MONTH), currentcal.get(Calendar.DAY_OF_MONTH));
if(cal1.before(currentcal) || cal2.before(cal1) || (shours2>ehours2) || ((shours2==ehours2) && (sminutes2==eminutes2)) || ((shours2==ehours2) && (eminutes2<=sminutes2)))
		{%><br>
		<font size=4 face="TimesNewRoman" color=red>Start Date should be GREATER than or equal to CURRENTDATE and Start date is LESS than End date and their timings also should in order. <br>But Dates should not be equal<br>Start Time should be LESS Than End Time<br>Please check request Details</font>
		<%}
else
		{
	startDate= request.getParameter("startdate");	
	//startDate=syear+"-"+smonth+"-"+sdate;
	startTime=shours+":"+sminutes;
	endDate= request.getParameter("enddate");
	//endDate=eyear+"-"+emonth+"-"+edate;
	endTime=ehours+":"+eminutes;
	int capacityint=Integer.parseInt(size);
	//out.println(locations);
	int locationint=Integer.parseInt(locations);
	int result=0;
	Calendar cal = Calendar.getInstance();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String todayDate=null;	
    todayDate=sdf.format(cal.getTime());
	String approvalcomments=null;
	if(recurrencetype.equals("DAILY"))
		{
	result=stmt.executeUpdate("insert into requestroom(userID,startDate,endDate,startTime,endTime,location,capacity,purpose,requesttitle,recurringType,weeklyString,dayofmonth,requestTime,requestStatus,lastUpdatedUser,approvalcomments) values('"+useridint+"','"+startDate+"','"+endDate+"','"+startTime+"','"+endTime+"','"+locations+"','"+capacityint+"','"+purpose+"','"+title+"','DAILY','0000000','0','"+todayDate+"','OPEN','"+useridint+"','"+approvalcomments+"')");
	if(result==1)
		{%>
		<font size=4 face="TimesNewRoman" color=green>Request is successfully added to database</font>
		<%}
	else
		{%>
		<font size=4 face="TimesNewRoman" color=red>Their is a problem with database or your entered values. Please check your values and try again</font>
		<%}
		}
		else if(recurrencetype.equals("WEEKLY"))
		{
			String mon=null,tue=null,wed=null,thu=null,fri=null,sat=null;
			int mo=1,tu=1,we=1,th=1,fr=1,sa=1,su=0;;
			mon=request.getParameter("weekmon");
			tue=request.getParameter("weektue");
			wed=request.getParameter("weekwed");
			thu=request.getParameter("weekthu");
			fri=request.getParameter("weekfri");
			sat=request.getParameter("weeksat");
			
			if(mon==null)
			{
				mo=0;
			}
			if(tue==null)
			{
				tu=0;
			}
			if(wed==null)
			{
				we=0;
			}
			if(thu==null)
			{
				th=0;
			}
			if(fri==null)
			{
				fr=0;
			}
			if(sat==null)
			{
				sa=0;
			}
			String weeklyString=null;
			weeklyString=su+""+mo+""+tu+""+we+""+th+""+fr+""+sa;
		//	out.println(weeklyString);
			if(weeklyString.equals("0000000"))
			{%>
				<font size=4 face="TimesNewRoman" color=red>You selected Weekly type but didn't select the week properly. Please select them properly.</font>
				<%}
			else
			{
				String apprcom=null;
				result=stmt.executeUpdate("insert into requestroom(userID,startDate,endDate,startTime,endTime,location,capacity,purpose,requesttitle,recurringType,weeklyString,dayofmonth,requestTime,requestStatus,lastUpdatedUser,approvalcomments) values('"+useridint+"','"+startDate+"','"+endDate+"','"+startTime+"','"+endTime+"','"+locations+"','"+capacityint+"','"+purpose+"','"+title+"','WEEKLY','"+weeklyString+"','0','"+todayDate+"','OPEN','"+useridint+"','"+apprcom+"')");
	if(result==1)
		{%>
		<font size=4 face="TimesNewRoman" color=green>Request is successfully added to database</font>
		<%}
	else
		{%>
		<font size=4 face="TimesNewRoman" color=red>Their is a problem with database or your entered values. Please check your values and try again</font>
		<%}

			}
		}
		else{
			//out.println("Monthly");
			String dayofMonth=null;
			dayofMonth=request.getParameter("dayofmonth");
			//out.println(dayofMonth);
			int dayofMonthInt=Integer.parseInt(dayofMonth);
			String apcom=null;
			result=stmt.executeUpdate("insert into requestroom(userID,startDate,endDate,startTime,endTime,location,capacity,purpose,requesttitle,recurringType,weeklyString,dayofmonth,requestTime,requestStatus,lastUpdatedUser,approvalcomments) values('"+useridint+"','"+startDate+"','"+endDate+"','"+startTime+"','"+endTime+"','"+locations+"','"+capacityint+"','"+purpose+"','"+title+"','MONTHLY','000000',"+dayofMonthInt+",'"+todayDate+"','OPEN','"+useridint+"','"+apcom+"')");
	if(result==1)
		{%>
		<font size=4 face="TimesNewRoman" color=green>Request is successfully added to database</font>
		<%}
	else
		{%>
		<font size=4 face="TimesNewRoman" color=red>Their is a problem with database or your entered values (check problems like leap year, febravary month date values). Please check your values and try again</font>
		<%}

		}
		}
	}

	}
}
catch(Exception e)
{//out.println(e.toString());%>
	<font size=4 face="TimesNewRoman" color=red>Invalid Request Details. Please check your values(format), DATES(February-Leapyear), Enable JAVASCRIPT options in your browser, PURPOSE SHOULD BE LESS THAN 500 CHARACTERS and TRY AGAIN</font>
<%}%>
</body>
</html>
