<html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<head>  <TITLE>  ROOM ALLOCATION SYSTEM </TITLE></head>
<body background=abc.jpg>
<%
try{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomdatabase","root","123");
		Statement stmt=con.createStatement();
		Statement stmt1=con.createStatement();
		Statement s8=con.createStatement();
		String cc=null;cc=(String)session.getAttribute("USERID");	
		//out.println(cc);
		if(cc==null)
		{
			%>
			<div align=right>
				<font size=4 face="TimesNewRoman" color=blue><a href="MainPage.html" target="_top">Home</a></font>
			<%
		}
		ResultSet rs=null,rs2=null;
		String room_ID=request.getParameter("id");
		s8.executeQuery ("select roomID from room where roomno = '"+room_ID+"'");
		ResultSet rs_roomid = s8.getResultSet();
		rs_roomid.next();
		String roomidresult = rs_roomid.getString(1);
		String roomid=null,syear=null,smonth=null,sdate=null;
		String eyear=null,edate=null,emonth=null;
		String startdate=null,enddate=null,nextstartdate=null;
		String roomno=null;
		//String room_ID=request.getQueryString();
		roomid=room_ID;
		roomno = roomidresult;
		//roomid=request.getParameter("roomno");
		//roomno=request.getParameter("roomid");
		
		//out.println("Yo");
		//out.println(roomid);
		//String str=request.getParameter("submitQuery");
		String str = "submit";
		//out.println(str);
		if(str.equals("submit"))
		{
		int syear1=0,smonth1=0,sdate1=0,eyear1=0,emonth1=0,edate1=0;
		roomid = room_ID;
		//roomid=request.getParameter("roomno");
		if(!roomid.equals("roomno"))
		{
			if(!roomid.equals("ALL"))
			{
			//out.println(roomid);
			rs2=stmt.executeQuery("select * from room where roomno='"+roomid+"'");
			rs2.next();
			//roomno=rs2.getString(2);
			rs2.close();
			////// FOR TODAY DATE/////////////
			Calendar cal = Calendar.getInstance();
			int day100 = cal.get(Calendar.DATE);
			int month100 = cal.get(Calendar.MONTH) + 1;
			int year100 = cal.get(Calendar.YEAR);
			int day200=31;
			int month200=12;
			int year200=year100+40;
			//////////////////////////////////////////
			syear=""+year100;syear1=Integer.parseInt(syear);
			smonth=""+month100;smonth1=Integer.parseInt(smonth);smonth1=smonth1-1;
			sdate=""+day100;sdate1=Integer.parseInt(sdate);
			eyear=""+year200;eyear1=Integer.parseInt(eyear);
			emonth=""+month200;emonth1=Integer.parseInt(emonth);emonth1=emonth1-1;
			edate=""+day200;edate1=Integer.parseInt(edate);
			startdate=syear+"-"+smonth+"-"+sdate;
			int tempvar=smonth1+2;
			nextstartdate=syear+"-"+tempvar+"-"+sdate;
			String currentmonth=syear+"-"+smonth+"-"+1;
			enddate=eyear+"-"+emonth+"-"+edate;
			Calendar c1 = Calendar.getInstance();
			Calendar c2 = Calendar.getInstance();
			Calendar c111 = Calendar.getInstance();
			Calendar c222 = Calendar.getInstance();
			c111.set(syear1,smonth1,sdate1);
			c222.set(eyear1,emonth1,edate1);
			String monthstring=null;
			switch(smonth1)
			{
				case 0: monthstring="JANUARY";break;
				case 1: monthstring="FEBRUARY";break;
				case 2: monthstring="MARCH";break;
				case 3: monthstring="APRIL";break;
				case 4: monthstring="MAY";break;
				case 5: monthstring="JUNE";break;
				case 6: monthstring="JULY";break;
				case 7: monthstring="AUGUST";break;
				case 8: monthstring="SEPTEMBER";break;
				case 9: monthstring="OCTOBER";break;
				case 10: monthstring="NOVEMBER";break;
				case 11: monthstring="DECEMBER";break;
			}
			if(c111.before(c222))
		{
		c1.set(syear1,smonth1,1);
		c2.set(eyear1,emonth1,1);
		String passingString=null;
		passingString=roomno+"_"+startdate+"_"+enddate+"_"+startdate+"_"+"NEXT";
	//	out.println(passingString);%>
	<div align="left"><font size=5 face="TimesNewRoman" color=darkpink><b><I>Room details for a particular month</I></b></font></div>
		
		<center><font size=5 face="TimesNewRoman" color=blue>Room number</font>&nbsp;&nbsp;&nbsp;<font size=5 face="TimesNewRoman" color=green><%=roomid%></font>&nbsp;&nbsp;&nbsp;
		<font size=5 face="TimesNewRoman" color=blue>Current month</font>&nbsp;&nbsp;&nbsp;<font size=4 face="TimesNewRoman" color=green><%out.println(monthstring);out.println("-"+syear1);%></font>
		<hr>
		</center>
		<%
		if(c1.before(c2))
		{
			%>
			<div align="right"><a href="nextcheckIndividualReports.jsp?<%=passingString%>">NEXT MONTH</a></div>
		<%
		}
		%>
		<center>
<table cellspacing=2 cellpadding=2 border=1 width=400 height=200>
	<tr>
	<td align="center"><font size=4 face="TimesNewRoman" color=blue>SUN</font></td>
	<td align="center"><font size=4 face="TimesNewRoman" color=blue>MON</font></td>
	<td align="center"><font size=4 face="TimesNewRoman" color=blue>TUE</font></td>
	<td align="center"><font size=4 face="TimesNewRoman" color=blue>WED</font></td>
	<td align="center"><font size=4 face="TimesNewRoman" color=blue>THU</font></td>
	<td align="center"><font size=4 face="TimesNewRoman" color=blue>FRI</font></td>
	<td align="center"><font size=4 face="TimesNewRoman" color=blue>SAT</font></td>
	</tr>
	<tr align="center">
		<%
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
		//out.println(firstdate);
		//out.println(lastdate);
		//out.println(roomid);
		rs=stmt.executeQuery("select * from roomallocation,requestroom where roomallocation.requestID=requestroom.requestID and givenDate>='"+firstdate+"' and givenDate<='"+lastdate+"' and roomallocation.roomID='"+roomid+"' and allocationstatus='NOTCOMPLETED'");
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
				String gg=rs.getString(5);
				String gg1[]=gg.split(":");
				gstime=gg1[0]+":"+gg1[1];
				gg=rs.getString(6);
				String gg2[]=gg.split(":");
				getime=gg2[0]+":"+gg2[1];
				gtitle=rs.getString(19);
				totalstring=gdate+"_"+gstime+"_"+getime+"_"+gtitle;
				tablerow.put(totalstring,new Integer(i));
				i++;
			}
			int initialloop=8-x;
			int date=1;
		
				for(int j=1;j<x;j++)
				{
					%>
					<td></td>
					<%
				}
					for(int k=1;k<=initialloop;k++)
					{
						Enumeration e = tablerow.keys();
						String tempstr=null;
						String findstime=null;
						String findetime=null;
						String findtitle=null;
						int found=0;
						String date10=null;
						while( e. hasMoreElements() )
						{
							tempstr=(String)e.nextElement();
							String tempstr2[]=tempstr.split("_");
							date10=tempstr2[0];
							findstime=tempstr2[1];
							findetime=tempstr2[2];
							findtitle=tempstr2[3];
							String date100[]=date10.split("-");
							int actdate=Integer.parseInt(date100[2]);
							if(actdate==date)
							{
								found=1;
								break;
							}
						}
						if(found==1)
						{
							
								%>
								<td bgcolor=red align="center">
								<%
								String strToNextPage=null;
								strToNextPage=roomid+"&"+date10+"&"+roomid+"_"+startdate+"_"+enddate+"_"+nextstartdate+"_"+"PREVIOUS";
								%>
								<a href="dateReport.jsp?<%=strToNextPage%>">
								<%
								out.println(date);%></a><br>
								<%
								//out.println("   "+findtitle);out.println(findstime);out.println("-"+findetime);
								%>
								</td>
								<%
								date++;
						}
						else
						{						
							%>
							<td bgcolor=green align="center"><%=date%>
							</td>
							<%
							 date++;
						}
					}
					%>
					</tr>
				<%
				for(int i1=0;date<=daysInMonth;i1++)
				{
					%>
					<tr>
					<%
				for(int p=1;p<=7;p++)
					{
						if(date<=daysInMonth)
						{
							Enumeration e = tablerow.keys();
							String tempstr=null;
							String findstime=null;
							String findetime=null;
							String findtitle=null;
							int found=0;
							String date10=null;
							while( e. hasMoreElements() )
							{
								tempstr=(String)e.nextElement();
								String tempstr2[]=tempstr.split("_");
								date10=tempstr2[0];
								findstime=tempstr2[1];
								findetime=tempstr2[2];
								findtitle=tempstr2[3];
								String date100[]=date10.split("-");
								int actdate=Integer.parseInt(date100[2]);
								if(actdate==date)
								{
									found=1;
									break;
								}
							}
							if(found==1)
							{
									%>
										<td bgcolor=red align="center">
									<%
										String strToNextPage=null;
										strToNextPage=roomid+"&"+date10+"&"+roomid+"_"+startdate+"_"+enddate+"_"+nextstartdate+"_"+"PREVIOUS";
									%>
										<a href="dateReport.jsp?<%=strToNextPage%>">
									<%
										out.println(date);%></a><br>
									<%
										//out.println("   "+findtitle);out.println(findstime);out.println("-"+findetime);%></td>
									<%
									date++;
							
							}
							else
							{						
							%>
								<td bgcolor=green align="center"><%=date%></td>
							<% 
							date++;
						}
						}
					}
					%>
					</tr>		
					<%
					}
			
		}
		else
		{		
		int initialloop=8-x;
		int date=1;
		
				for(int j=1;j<x;j++)
				{
					%>
					<td></td>
					<%
				}
					for(int k=1;k<=initialloop;k++)
					{
					%>
						<td bgcolor=green align="center"><%=date%></td>
					<%
					 date++;
					}
					%>
					</tr>
				<%
				for(int i=0;date<=daysInMonth;i++)
				{
					%>
					<tr>
					<%
					for(int p=1;p<=7;p++)
					{
						if(date<=daysInMonth)
						{
							%>
								<td bgcolor=green align="center"><%=date%>
								</td>
							<%
							date++;
						}
					}
					%>
					</tr>		
					<%
				}
		}
		%>
		</table>
		<br>
	<div align=right>	
	<I><B><font size=5 face="TimesNewRoman" color=RED>RED</font></b></i>--<font size=4 face="TimesNewRoman" color=RED>Represents Partially Available</font><br>
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
		%>
		<center>
		<br>
		<font size=5 face="TimesNewRoman" color=RED> PLEASE	SELECT THE INPUTS (DATES ORDER) CORRECTLY..AND TRY AGAIN</font>
		<%
	}
	}
		else
		{
//###########################################################


			//out.println("code for ALL");


		////// FOR TODAY DATE/////////////
		Calendar cal = Calendar.getInstance();
        int day100 = cal.get(Calendar.DATE);
        int month100 = cal.get(Calendar.MONTH) + 1;
        int year100 = cal.get(Calendar.YEAR);
		int day200=31;
		int month200=12;
		int year200=year100+10;
		//////////////////////////////////////////
		syear=""+year100;syear1=Integer.parseInt(syear);
		smonth=""+month100;smonth1=Integer.parseInt(smonth);smonth1=smonth1-1;
		sdate=""+day100;sdate1=Integer.parseInt(sdate);
		eyear=""+year200;eyear1=Integer.parseInt(eyear);
		emonth=""+month200;emonth1=Integer.parseInt(emonth);emonth1=emonth1-1;
		edate=""+day200;edate1=Integer.parseInt(edate);
		startdate=syear+"-"+smonth+"-"+sdate;
		int tempvar=smonth1+2;
		nextstartdate=syear+"-"+tempvar+"-"+sdate;
		startdate=syear+"-"+smonth+"-"+sdate;
		String currentmonth=syear+"-"+smonth+"-"+1;
		enddate=eyear+"-"+emonth+"-"+edate;
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		Calendar c111 = Calendar.getInstance();
		Calendar c222 = Calendar.getInstance();
		c111.set(syear1,smonth1,sdate1);
		c222.set(eyear1,emonth1,edate1);
		String monthstring=null;
		switch(smonth1)
			{
			case 0: monthstring="JANUARY";break;
			case 1: monthstring="FEBRUARY";break;
			case 2: monthstring="MARCH";break;
			case 3: monthstring="APRIL";break;
			case 4: monthstring="MAY";break;
			case 5: monthstring="JUNE";break;
			case 6: monthstring="JULY";break;
			case 7: monthstring="AUGUST";break;
			case 8: monthstring="SEPTEMBER";break;
			case 9: monthstring="OCTOBER";break;
			case 10: monthstring="NOVEMBER";break;
			case 11: monthstring="DECEMBER";break;
			}
			if(c111.before(c222))
		{
		c1.set(syear1,smonth1,1);
		c2.set(eyear1,emonth1,1);
		String passingString=null;
		passingString=roomno+"_"+startdate+"_"+enddate+"_"+startdate+"_"+"NEXT";
	//	out.println(passingString);%>
		<center>
		<table>
			<tr>
				<td>
					<font size=5 face="TimesNewRoman" color=blue>Start Date</font>
				</td>
				<td>
					<font size=4 face="TimesNewRoman" color=green><%=startdate%></font>
				</td>
				<td></td>
				<td></td>
				<td>
					<font size=5 face="TimesNewRoman" color=blue>End Date</font>
				</td>
				<td>
					<font size=4 face="TimesNewRoman" color=green><%=enddate%></font>
				</td>
			</tr>
		</table>
		<center><font size=5 face="TimesNewRoman" color=blue>RoomID</font>&nbsp;&nbsp;&nbsp;<font size=5 face="TimesNewRoman" color=green>ALLROOMS</font>
		<font size=5 face="TimesNewRoman" color=blue>Current Month</font>&nbsp;&nbsp;&nbsp;<font size=4 face="TimesNewRoman" color=green><%out.println(monthstring);out.println("-"+syear1);%></font>
		</center>
		<%
		if(c1.before(c2))
		{
			%>
			<div align="right"><a href="nextcheckIndividualReports.jsp?<%=passingString%>">NEXT MONTH</a></div>
			<%
		}
		%>
		<center>
<table cellspacing=2 cellpadding=2 border=1 width=400 height=200>
<tr>
	<td align="center">
		<font size=4 face="TimesNewRoman" color=blue>SUN</font>
	</td>
	<td align="center">
		<font size=4 face="TimesNewRoman" color=blue>MON</font>
	</td>
	<td align="center">
		<font size=4 face="TimesNewRoman" color=blue>TUE</font>
	</td>
	<td align="center">
		<font size=4 face="TimesNewRoman" color=blue>WED</font>
	</td>
	<td align="center">
		<font size=4 face="TimesNewRoman" color=blue>THU</font>
	</td>
	<td align="center">
		<font size=4 face="TimesNewRoman" color=blue>FRI</font>
	</td>
	<td align="center">
		<font size=4 face="TimesNewRoman" color=blue>SAT</font>
	</td>
</tr>
<tr align="center">
		<%
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
				String gg=rs.getString(5);
				String gg1[]=gg.split(":");
				gstime=gg1[0]+":"+gg1[1];
				gg=rs.getString(6);
				String gg2[]=gg.split(":");
				getime=gg2[0]+":"+gg2[1];
				gtitle=rs.getString(19);
				totalstring=gdate+"_"+gstime+"_"+getime+"_"+gtitle;
				tablerow.put(totalstring,new Integer(i));
				i++;
			}
			int initialloop=8-x;
			int date=1;
		
				for(int j=1;j<x;j++)
				{
					%>
					<td></td>
				<%
				}
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
								strToNextPage=roomid+"&"+date10+"&"+roomid+"_"+startdate+"_"+enddate+"_"+nextstartdate+"_"+"PREVIOUS";
								%>
								<a href="dateReport.jsp?<%=strToNextPage%>">
									<%	out.println(date);%>
								</a>
								<br>
								<%
									//out.println("   "+findtitle);out.println(findstime);out.println("-"+findetime);
								%>
								</td>
								<%
								date++;
						}
						else
						{						
							%>
							<td bgcolor=green align="center">
								<%=date%>
							</td>
							<%
							date++;
						}
					}
					%>
					</tr>
				<%
				for(int i1=0;date<=daysInMonth;i1++)
				{
					%>
				<tr>
					<%
				for(int p=1;p<=7;p++)
					{
						if(date<=daysInMonth)
						{
						Enumeration e = tablerow.keys();
						String tempstr=null;
						String findstime=null;
						String findetime=null;
						String findtitle=null;
						int found=0;
						String date10=null;
						while( e. hasMoreElements() )
						{
							tempstr=(String)e.nextElement();
							String tempstr2[]=tempstr.split("_");
							date10=tempstr2[0];
							findstime=tempstr2[1];
							findetime=tempstr2[2];
							findtitle=tempstr2[3];
							String date100[]=date10.split("-");
							int actdate=Integer.parseInt(date100[2]);
							if(actdate==date)
							{
								found=1;
								break;
							}
						}
						if(found==1)
						{
								%>
								<td bgcolor=red align="center">
								<%
								String strToNextPage=null;
								strToNextPage=roomid+"&"+date10+"&"+roomid+"_"+startdate+"_"+enddate+"_"+nextstartdate+"_"+"PREVIOUS";
								%>
								<a href="dateReport.jsp?<%=strToNextPage%>">
								<%out.println(date);%>
								</a>
								<br>
								<%
								//out.println("   "+findtitle);out.println(findstime);out.println("-"+findetime);
								%>
								</td>
								<%
								date++;
						
						}
						else
						{						
							%>
							<td bgcolor=green align="center"><%=date%>
							</td>
							<%
							 date++;
						}
					}
					}
					%>
					</tr>		
					<%
					}
			
		}
		else
		{		
		int initialloop=8-x;
		int date=1;
		
				for(int j=1;j<x;j++)
				{
					%>
					<td>
					</td>
					<%
				}
					for(int k=1;k<=initialloop;k++)
					{
					%>
					<td bgcolor=green align="center"><%=date%>
					</td>
					<%
					 date++;
					 }
					%>
					</tr>
				<%
				for(int i=0;date<=daysInMonth;i++)
				{
					%>
				<tr>
					<%
				for(int p=1;p<=7;p++)
					{
						if(date<=daysInMonth)
						{
							%>
							<td bgcolor=green align="center"><%=date%>
							</td>
							<%date++;
						}
					}
					%>
					</tr>		
					<%
					}
		}
		%>
		</table>
		<br>
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
			%>
			<center>
			<br>
			<font size=5 face="TimesNewRoman" color=RED> PLEASE	SELECT THE INPUTS (DATES ORDER) CORRECTLY..AND TRY AGAIN</font>
			<%
		}


//###############################################################
		}
		}
		else
		{
			%>
			<center>
			<br>
			<font size=5 face="TimesNewRoman" color=RED> PLEASE	SELECT THE INPUTS (ROOMID) CORRECTLY..AND TRY AGAIN</font>
			<%
		}
	
	}
	else
	{
		//out.println("code for another operations");
	}
	
}
catch(Exception e)
{
	out.println(e.toString());
	%>
	<center>
	<br>
	<font size=5 face="TimesNewRoman" color=RED> PLEASE	SELECT THE INPUTS CORRECTLY..AND TRY AGAIN</font>
	<%
}
%>

</body>
</html>
