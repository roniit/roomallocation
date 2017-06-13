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
		String cc=null;cc=(String)session.getAttribute("USERID");//out.println(cc);
		if(cc==null)
	 {
			%><div align=right><font size=4 face="TimesNewRoman" color=blue><a href="MainPage.html" target="_top">Home</a></font><%
	 }
//String syear=null,smonth=null,sdate=null;
//String eyear=null,emonth=null,edate=null;
//String preyear=null,premonth=null,predate=null;
String getstr=request.getQueryString();
//out.println(getstr);
String divstring[]=getstr.split("_");
String roomid=divstring[0];
if(!roomid.equals("ALL"))
	{
rs2=stmt.executeQuery("select * from room where roomid='"+roomid+"'");
rs2.next();
String roomno=rs2.getString(2);
String startdate=divstring[1];
String divstartdate[]=startdate.split("-");
int syear=Integer.parseInt(divstartdate[0]);
int smonth=Integer.parseInt(divstartdate[1]);
int sdate=Integer.parseInt(divstartdate[2]);
Calendar startcal = Calendar.getInstance();
startcal.set(syear,(smonth-1),sdate);
String enddate=divstring[2];
String divenddate[]=enddate.split("-");
int eyear=Integer.parseInt(divenddate[0]);
int emonth=Integer.parseInt(divenddate[1]);
int edate=Integer.parseInt(divenddate[2]);
Calendar endcal=Calendar.getInstance();
endcal.set(eyear,(emonth-1),edate);
String previousdate=divstring[3];
String sequencedate=divstring[4];
String divpredate[]=previousdate.split("-");
String preyear=divpredate[0];
String premonth=divpredate[1];
String predate=divpredate[2];
int preyear1=Integer.parseInt(preyear);
int premonth1=Integer.parseInt(premonth);
int predate1=Integer.parseInt(predate);
Calendar precal=Calendar.getInstance();
precal.set(preyear1,(premonth1-1),predate1);
int curyear=preyear1;
int curmonth=0;
if(sequencedate.equals("NEXT"))
	{
curmonth=premonth1+1;
if(curmonth>12)
	{
	curyear=curyear+1;
	curmonth=1;
	}
	}
else if(sequencedate.equals("PREVIOUS"))
	{
	curmonth=premonth1-1;
	if(curmonth==0)
		{
		curyear=curyear-1;
		curmonth=12;
		}
	}

int curdate=predate1;
String curmonthdate=curyear+"-"+curmonth+"-"+curdate;
Calendar c1 = Calendar.getInstance();
c1.set(curyear,(curmonth-1),curdate);
String monthstring=null;
//out.println(curmonth);
switch(curmonth)
			{
			case 1: monthstring="JANUARY";break;
			case 2: monthstring="FEBRUARY";break;
			case 3: monthstring="MARCH";break;
			case 4: monthstring="APRIL";break;
			case 5: monthstring="MAY";break;
			case 6: monthstring="JUNE";break;
			case 7: monthstring="JULY";break;
			case 8: monthstring="AUGUST";break;
			case 9: monthstring="SEPTEMBER";break;
			case 10: monthstring="OCTOBER";break;
			case 11: monthstring="NOVEMBER";break;
			case 12: monthstring="DECEMBER";break;
			}
%>
<div align="left"><font size=5 face="TimesNewRoman" color=darkpink><b><I>Room Details for a Particular month</I></b></font></div>
		<center><font size=5 face="TimesNewRoman" color=blue>RoomID</font>&nbsp;&nbsp;&nbsp;<font size=5 face="TimesNewRoman" color=green><%=roomno%></font>
		<font size=5 face="TimesNewRoman" color=blue>Current Month</font>&nbsp;&nbsp;&nbsp;<font size=4 face="TimesNewRoman" color=green><%out.println(monthstring+"-"+curyear);%></font><br>
		<hr>
		</center>
		<%
	String passingstring=roomid+"_"+startdate+"_"+enddate+"_"+curmonthdate;
//int alin=0;
	if(c1.after(startcal))
	{ 
		if(!c1.equals(startcal)){
	%><div align="left"><a href="nextcheckIndividualReports.jsp?<%=passingstring+"_"+"PREVIOUS"%>">PREVIOUS MONTH</a></div>
	<%}}
	if(c1.before(endcal))
	{
	%><div align="right"><a href="nextcheckIndividualReports.jsp?<%=passingstring+"_"+"NEXT"%>">NEXT MONTH</a></div>
	<%}%>
	<center>
<table border=1 width=400 height=200 cellspacing=2 cellpadding=2>
<tr><td align="center"><font size=4 face="TimesNewRoman" color=blue>SUN</font></td><td align="center"><font size=4 face="TimesNewRoman" color=blue>MON</font></td><td align="center"><font size=4 face="TimesNewRoman" color=blue>TUE</font></td><td align="center"><font size=4 face="TimesNewRoman" color=blue>WED</font></td><td align="center"><font size=4 face="TimesNewRoman" color=blue>THU</font></td><td align="center"><font size=4 face="TimesNewRoman" color=blue>FRI</font></td><td align="center"><font size=4 face="TimesNewRoman" color=blue>SAT</font></td></tr>
<%
		
		c1.set(curyear,(curmonth-1),1);
int x=c1.get(Calendar.DAY_OF_WEEK);
		//out.println(x);
		int daysInMonth = c1.getActualMaximum(Calendar.DAY_OF_MONTH);
		String DATE_FORMAT = "yyyy-MM-dd";
		java.text.SimpleDateFormat simpledataformat = new java.text.SimpleDateFormat(DATE_FORMAT);
		//out.println(simpledataformat.format(c1.getTime()).toString());
		int month = c1.get(Calendar.MONTH) + 1;
        int year = c1.get(Calendar.YEAR);
		String firstdate=year+"-"+month+"-"+1;
		String lastdate=year+"-"+month+"-"+31;
		rs=stmt.executeQuery("select * from roomallocation,requestroom where roomallocation.requestID=requestroom.requestID and givenDate>='"+firstdate+"' and givenDate<='"+lastdate+"' and roomID='"+roomid+"' and allocationstatus='NOTCOMPLETED'");

		if(rs.next())
		{
			rs.previous();
			Hashtable tablerow=new Hashtable();
			int i=0;
			String gdate=null;
			String gstime=null;
			String getime=null;
			String gtitle=null;
			String totalstring=null;
			while(rs.next())
			{
				gdate=rs.getString(4);
				String xx=rs.getString(5);
				String xx1[]=xx.split(":");
				gstime=xx1[0]+":"+xx1[1];//out.println(xx1[0]+"  "+xx1[1]);
				String xx4=rs.getString(6);
				String xx2[]=xx4.split(":");
				getime=xx2[0]+":"+xx2[1];
				gtitle=rs.getString(19);
				totalstring=gdate+"_"+gstime+"_"+getime+"_"+gtitle;
				tablerow.put(totalstring,new Integer(i));
				i++;
			}
			int initialloop=8-x;
			int date=1;
		
				for(int j=1;j<x;j++)
				{
					%><td></td>
				<%}
					for(int k=1;k<=initialloop;k++)
					{
						Enumeration e = tablerow.keys();
						String tempstr=null;
						String findstime=null;
						String findetime=null;
						String findtitle=null;
						int found=0;
						String date10=null;
						while( e. hasMoreElements() ){
						 tempstr=(String)e.nextElement();
						String tempstr2[]=tempstr.split("_");
						date10=tempstr2[0];
						findstime=tempstr2[1];
						findetime=tempstr2[2];
						findtitle=tempstr2[3];
						String date100[]=date10.split("-");
						int actdate=Integer.parseInt(date100[2]);
						if(actdate==date){
							found=1;
							break;
						}
						}
						if(found==1)
						{
							
								%><td bgcolor=red align="center"><%
								String strToNextPage=null;
								strToNextPage=roomid+"&"+date10+"&"+getstr;
								%><a href="dateReport.jsp?<%=strToNextPage%>"><%out.println(date);%></a><br><%//out.println("   "+findtitle);out.println(findstime);out.println("-"+findetime);%></td>
								<%date++;
						}
						else
						{						
					%><td bgcolor=green align="center"><%=date%></td>
					<% date++;
						}
					}
					%></tr>
				<%for(int i1=0;date<=daysInMonth;i1++)
				{%>
				<tr><%
				for(int p=1;p<=7;p++)
					{
						if(date<=daysInMonth){


				Enumeration e = tablerow.keys();
						String tempstr=null;
						String findstime=null;
						String findetime=null;
						String findtitle=null;
						int found=0;
						String date10=null;
						while( e. hasMoreElements() ){
						 tempstr=(String)e.nextElement();
						String tempstr2[]=tempstr.split("_");
						date10=tempstr2[0];
						findstime=tempstr2[1];
						findetime=tempstr2[2];
						findtitle=tempstr2[3];
						String date100[]=date10.split("-");
						int actdate=Integer.parseInt(date100[2]);
						if(actdate==date){
							found=1;
							break;
						}
						}
						if(found==1)
						{							
								%><td bgcolor=red align="center"><%
								String strToNextPage=null;
								strToNextPage=roomid+"&"+date10+"&"+getstr;	
								%><a href="dateReport.jsp?<%=strToNextPage%>"><%out.println(date);%></a><br><%//out.println("    "+findtitle);out.println(findstime);out.println("-"+findetime);%></td>
								<%date++;							
						}
						else
						{						
					%><td bgcolor=green align="center"><%=date%></td>
					<% date++;
						}
				}
					}%>
					</tr>		
					<%}
			
		}
		else
		{		
		int initialloop=8-x;
		int date=1;
		
				for(int j=1;j<x;j++)
				{
					%><td></td>
				<%}
					for(int k=1;k<=initialloop;k++)
					{
					%><td bgcolor=green align="center"><%=date%></td>
					<% date++;}
					%></tr>
				<%for(int i=0;date<=daysInMonth;i++)
				{%>
				<tr><%
				for(int p=1;p<=7;p++)
					{
						if(date<=daysInMonth){%>
				<td bgcolor=green align="center"><%=date%></td>
				<%date++;}
					}%>
					</tr>		
					<%}
		}
		%>
		</table><br>
		<div align=right><I><B><font size=5 face="TimesNewRoman" color=RED>RED</font></b></i>--<font size=4 face="TimesNewRoman" color=RED>Represents Partially Available</font><br>
<I><B><font size=5 face="TimesNewRoman" color=GREEN>GREEN</font></b></i>--<font size=4 face="TimesNewRoman" color=GREEN>Represents Fully Available</font><br></div>
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
//	out.println("ALL");
//	rs2=stmt.executeQuery("select * from room where roomid='"+roomid+"'");
//rs2.next();
String roomno=null;
//roomno=rs2.getString(2);
String startdate=divstring[1];
String divstartdate[]=startdate.split("-");
int syear=Integer.parseInt(divstartdate[0]);
int smonth=Integer.parseInt(divstartdate[1]);
int sdate=Integer.parseInt(divstartdate[2]);
Calendar startcal = Calendar.getInstance();
startcal.set(syear,(smonth-1),sdate);
String enddate=divstring[2];
String divenddate[]=enddate.split("-");
int eyear=Integer.parseInt(divenddate[0]);
int emonth=Integer.parseInt(divenddate[1]);
int edate=Integer.parseInt(divenddate[2]);
Calendar endcal=Calendar.getInstance();
endcal.set(eyear,(emonth-1),edate);
String previousdate=divstring[3];
String sequencedate=divstring[4];
String divpredate[]=previousdate.split("-");
String preyear=divpredate[0];
String premonth=divpredate[1];
String predate=divpredate[2];
int preyear1=Integer.parseInt(preyear);
int premonth1=Integer.parseInt(premonth);
int predate1=Integer.parseInt(predate);
Calendar precal=Calendar.getInstance();
precal.set(preyear1,(premonth1-1),predate1);
int curyear=preyear1;
int curmonth=0;
if(sequencedate.equals("NEXT"))
	{
curmonth=premonth1+1;
if(curmonth>12)
	{
	curyear=curyear+1;
	curmonth=1;
	}
	}
else if(sequencedate.equals("PREVIOUS"))
	{
	curmonth=premonth1-1;
	if(curmonth==0)
		{
		curyear=curyear-1;
		curmonth=12;
		}
	}

int curdate=predate1;
String curmonthdate=curyear+"-"+curmonth+"-"+curdate;
Calendar c1 = Calendar.getInstance();
c1.set(curyear,(curmonth-1),curdate);
String monthstring=null;
//out.println(curmonth);
switch(curmonth)
			{
			case 1: monthstring="JANUARY";break;
			case 2: monthstring="FEBRUARY";break;
			case 3: monthstring="MARCH";break;
			case 4: monthstring="APRIL";break;
			case 5: monthstring="MAY";break;
			case 6: monthstring="JUNE";break;
			case 7: monthstring="JULY";break;
			case 8: monthstring="AUGUST";break;
			case 9: monthstring="SEPTEMBER";break;
			case 10: monthstring="OCTOBER";break;
			case 11: monthstring="NOVEMBER";break;
			case 12: monthstring="DECEMBER";break;
			}
%>
<div align="left"><font size=5 face="TimesNewRoman" color=darkpink>All Rooms Details for a Particular month</font></div>
<center>
		<table><tr><td><font size=5 face="TimesNewRoman" color=blue>Start Date</font></td><td><font size=4 face="TimesNewRoman" color=green><%=startdate%></font></td><td></td><td></td><td><font size=5 face="TimesNewRoman" color=blue>End Date</font></td><td><font size=4 face="TimesNewRoman" color=green><%=enddate%></font></td></tr>
		</table>
		</center>
		<center><font size=5 face="TimesNewRoman" color=blue>RoomID</font>&nbsp;&nbsp;&nbsp;<font size=5 face="TimesNewRoman" color=green>ALLROOMS</font>
		<font size=5 face="TimesNewRoman" color=blue>Current Month</font>&nbsp;&nbsp;&nbsp;<font size=4 face="TimesNewRoman" color=green><%out.println(monthstring+"-"+curyear);%></font><br>
		</center>
		<%
	String passingstring=roomid+"_"+startdate+"_"+enddate+"_"+curmonthdate;
//int alin=0;
	if(c1.after(startcal))
	{ 
		if(!c1.equals(startcal)){
	%><div align="left"><a href="nextcheckIndividualReports.jsp?<%=passingstring+"_"+"PREVIOUS"%>">PREVIOUS MONTH</a>
	<%}}
	if(c1.before(endcal))
	{
	%><div align="right"><a href="nextcheckIndividualReports.jsp?<%=passingstring+"_"+"NEXT"%>">NEXT MONTH</a></div>
	<%}%>
	<center>
<table border=1 width=400 height=200 cellspacing=2 cellpadding=2>
<tr><td align="center"><font size=4 face="TimesNewRoman" color=blue>SUN</font></td><td align="center"><font size=4 face="TimesNewRoman" color=blue>MON</font></td><td align="center"><font size=4 face="TimesNewRoman" color=blue>TUE</font></td><td align="center"><font size=4 face="TimesNewRoman" color=blue>WED</font></td><td align="center"><font size=4 face="TimesNewRoman" color=blue>THU</font></td><td align="center"><font size=4 face="TimesNewRoman" color=blue>FRI</font></td><td align="center"><font size=4 face="TimesNewRoman" color=blue>SAT</font></td></tr>
<%
		
		c1.set(curyear,(curmonth-1),1);
int x=c1.get(Calendar.DAY_OF_WEEK);
		//out.println(x);
		int daysInMonth = c1.getActualMaximum(Calendar.DAY_OF_MONTH);
		String DATE_FORMAT = "yyyy-MM-dd";
		java.text.SimpleDateFormat simpledataformat = new java.text.SimpleDateFormat(DATE_FORMAT);
		//out.println(simpledataformat.format(c1.getTime()).toString());
		int month = c1.get(Calendar.MONTH) + 1;
        int year = c1.get(Calendar.YEAR);
		String firstdate=year+"-"+month+"-"+1;
		String lastdate=year+"-"+month+"-"+31;
		rs=stmt.executeQuery("select * from roomallocation,requestroom where roomallocation.requestID=requestroom.requestID and givenDate>='"+firstdate+"' and givenDate<='"+lastdate+"' and allocationstatus='NOTCOMPLETED'");

		if(rs.next())
		{
			rs.previous();
			Hashtable tablerow=new Hashtable();
			int i=0;
			String gdate=null;
			String gstime=null;
			String getime=null;
			String gtitle=null;
			String totalstring=null;
			while(rs.next())
			{
				gdate=rs.getString(4);
				String xx=rs.getString(5);
				String xx1[]=xx.split(":");
				gstime=xx1[0]+":"+xx1[1];//out.println(xx1[0]+"  "+xx1[1]);
				String xx4=rs.getString(6);
				String xx2[]=xx4.split(":");
				getime=xx2[0]+":"+xx2[1];
				gtitle=rs.getString(19);
				totalstring=gdate+"_"+gstime+"_"+getime+"_"+gtitle;
				tablerow.put(totalstring,new Integer(i));
				i++;
			}
			int initialloop=8-x;
			int date=1;
		
				for(int j=1;j<x;j++)
				{
					%><td></td>
				<%}
					for(int k=1;k<=initialloop;k++)
					{
						Enumeration e = tablerow.keys();
						String tempstr=null;
						String findstime=null;
						String findetime=null;
						String findtitle=null;
						int found=0;
						String date10=null;
						while( e. hasMoreElements() ){
						 tempstr=(String)e.nextElement();
						String tempstr2[]=tempstr.split("_");
						date10=tempstr2[0];
						findstime=tempstr2[1];
						findetime=tempstr2[2];
						findtitle=tempstr2[3];
						String date100[]=date10.split("-");
						int actdate=Integer.parseInt(date100[2]);
						if(actdate==date){
							found=1;
							break;
						}
						}
						if(found==1)
						{
							
								%><td bgcolor=red align="center"><%
								String strToNextPage=null;
								strToNextPage=roomid+"&"+date10+"&"+getstr;
								%><a href="dateReport.jsp?<%=strToNextPage%>"><%out.println(date);%></a><br><%//out.println("   "+findtitle);out.println(findstime);out.println("-"+findetime);%></td>
								<%date++;
						}
						else
						{						
					%><td bgcolor=green align="center"><%=date%></td>
					<% date++;
						}
					}
					%></tr>
				<%for(int i1=0;date<=daysInMonth;i1++)
				{%>
				<tr><%
				for(int p=1;p<=7;p++)
					{
						if(date<=daysInMonth){


				Enumeration e = tablerow.keys();
						String tempstr=null;
						String findstime=null;
						String findetime=null;
						String findtitle=null;
						int found=0;
						String date10=null;
						while( e. hasMoreElements() ){
						 tempstr=(String)e.nextElement();
						String tempstr2[]=tempstr.split("_");
						date10=tempstr2[0];
						findstime=tempstr2[1];
						findetime=tempstr2[2];
						findtitle=tempstr2[3];
						String date100[]=date10.split("-");
						int actdate=Integer.parseInt(date100[2]);
						if(actdate==date){
							found=1;
							break;
						}
						}
						if(found==1)
						{							
								%><td bgcolor=red align="center"><%
								String strToNextPage=null;
								strToNextPage=roomid+"&"+date10+"&"+getstr;	
								%><a href="dateReport.jsp?<%=strToNextPage%>"><%out.println(date);%></a><br><%//out.println("    "+findtitle);out.println(findstime);out.println("-"+findetime);%></td>
								<%date++;							
						}
						else
						{						
					%><td bgcolor=green align="center"><%=date%></td>
					<% date++;
						}
				}
					}%>
					</tr>		
					<%}
			
		}
		else
		{		
		int initialloop=8-x;
		int date=1;
		
				for(int j=1;j<x;j++)
				{
					%><td></td>
				<%}
					for(int k=1;k<=initialloop;k++)
					{
					%><td bgcolor=green align="center"><%=date%></td>
					<% date++;}
					%></tr>
				<%for(int i=0;date<=daysInMonth;i++)
				{%>
				<tr><%
				for(int p=1;p<=7;p++)
					{
						if(date<=daysInMonth){%>
				<td bgcolor=green align="center"><%=date%></td>
				<%date++;}
					}%>
					</tr>		
					<%}
		}
		%>
		</table><br>
		<div align=right><I><B><font size=5 face="TimesNewRoman" color=RED>RED</font></b></i>--<font size=4 face="TimesNewRoman" color=RED>Represents Partially Available</font><br>
<I><B><font size=5 face="TimesNewRoman" color=GREEN>GREEN</font></b></i>--<font size=4 face="TimesNewRoman" color=GREEN>Represents Fully Available</font><br></div>
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
	%><font size=4 face="Baskerville Old Face" color=red>Sorry Problem with the databse. TRY AGAIN AFTER SOME TIME. For other details contact Administrator</font><br><%

}
%>
</body>
</html>
