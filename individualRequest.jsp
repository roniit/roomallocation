<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
 <div align="right">
	<font size=4 face="Baskerville Old Face" color=brown><a href="approveRequests.jsp">Back</a></font>
 </div>
 <center>
 <%
 String requestID=request.getQueryString();
 String requeststatus=null;
 requeststatus=request.getParameter("requeststatus");
 
 String test = request.getParameter("id");
 //out.println(test);
 //out.println(requestID);
 requestID = test;
 //out.println(requestID);
 try
 {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomdatabase","root","123");
		Statement stmt=con.createStatement();
		if(requeststatus==null)
		{
		ResultSet rs=null;
		String status=null;
		rs=stmt.executeQuery("select * from requestroom,user,locationtable where (requestroom.userID=user.userID and requestroom.location=locationtable.locationId and requestID='"+requestID+"') order by requestID asc");
		rs.next();

		%>
		<form method="post" action="individualRequest.jsp">
		<center>
		<% 
		session.setAttribute("REQUESTID",rs.getString(1));
		session.setMaxInactiveInterval(36000);
		status=rs.getString(15);
		String weeklystring=null,dayofmonth=null;
		weeklystring=rs.getString(12);
		dayofmonth=rs.getString(13);
		%>
		<table border=0>
		<tr>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>Requested User</font>
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=green><%=rs.getString(20)%></font>
			</td>
			
		</tr>
		<tr>
		</tr>
		<%
		String startdate=rs.getString(3);
		String enddate=rs.getString(4);
		session.setAttribute("STDATE",startdate);
		session.setAttribute("EDDATE",enddate);
		%>
		<tr>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>Start Date</font>
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=green><%=startdate%></font>
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>End Date</font>
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=green><%=enddate%></font>
			</td>
		</tr>
		<%
		String starttime=rs.getString(5);
		String endtime=rs.getString(6);
		session.setAttribute("STTIME",starttime);
		session.setAttribute("EDTIME",endtime);
		%>
		<tr>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>Start Time</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=green><%=starttime%></font>
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>End Time</font>
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=green><%=endtime%></font>
			</td>
		</tr>
		<%
		String location=rs.getString(31);
		String capacity=rs.getString(8);
		int capacityint=Integer.parseInt(capacity);
		%>
		<tr>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>Location</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=green><%=rs.getString(32)%></font>
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>Capacity</font>
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=green><%=capacity%></font>
			</td>
		</tr>

		<tr>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>Title</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=green><%=rs.getString(10)%></font>
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>Status</td>
			<td>
				<font size=5 face="Baskerville Old Face" color=green><%=status%>
			</td>
		</tr>
		<%
		String recurrencetype=rs.getString(11);
		session.setAttribute("RTYPE",recurrencetype);
		%>
		<tr>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>Recurring Type</font>
			</td>
			<td colspan=4>
				<font size=4 face="Baskerville Old Face" color=green><%=recurrencetype%></font>
			</td>
		</tr>
		<tr>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>Purpose</font>
			</td>
			<td colspan=6>
				<font size=4 face="Baskerville Old Face" color=green><%=rs.getString(9)%></font>
			</td>
		</tr>
		<tr>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>Approval Comments</font>
			</td>
			<td colspan=4>
				<font size=4 face="Baskerville Old Face" color=green><%=rs.getString(18)%></font>
			</td>
		</tr>
		
		<%
		rs.close();
		if(status.equals("APPROVED"))
		{
			rs=stmt.executeQuery("select distinct(roomno) from roomallocation,room where roomallocation.roomID=room.roomID and roomallocation.requestID='"+requestID+"'");
			if(rs.next())
			{
				%>
				<tr>
					<td>
						<font size=4 face="Baskerville Old Face" color=blue>Allocated Room</font>
					</td>
					<td colspan=4>
						<font size=4 face="Baskerville Old Face" color=green><%=rs.getString(1)%></font>
					</td>
				</tr>
				<%
			}
			rs.close();
			%>
			</table>
			<%
		}
		else if(status.equals("OPEN"))
		{

			rs=stmt.executeQuery("select * from room where location='"+location+"' and capacity>="+capacityint+" and openstatus='OPEN'");
			String availablerooms=null;
			//out.println(rs.next());rs.previous();
			if(rs.next())
			{
				rs.previous();
				while(rs.next())
				{
					if(availablerooms==null)
					{
						availablerooms=rs.getString(1);
					}
					else
					{
						availablerooms=availablerooms+","+rs.getString(1);
					}
				}
				//out.println(availablerooms);
				rs.close();
				String startvalue[]=startdate.split("-");
				String temp=startdate;
				String temp2=enddate;
				String endvalue[]=enddate.split("-");
				//out.println(startvalue[0]+"  "+startvalue[1]+"  "+startvalue[2]);
				int syear=Integer.parseInt(startvalue[0]);
				int smonth=Integer.parseInt(startvalue[1]);
				smonth=smonth-1;
				int sdate=Integer.parseInt(startvalue[2]);
				int eyear=Integer.parseInt(endvalue[0]);
				int emonth=Integer.parseInt(endvalue[1]);
				emonth=emonth-1;
				int edate=Integer.parseInt(endvalue[2]);
				Calendar c1 = Calendar.getInstance();
				Calendar c2= Calendar.getInstance();
				c1.set(syear, smonth , sdate);
				c2.set(eyear,emonth,edate);
				long difInDays = ((c2.getTime().getTime() - c1.getTime().getTime())/(1000*60*60*24));
				//out.println("DIFF  "+c1.getTime().getTime());
				//out.println("DIFF  "+c2.getTime().getTime());
				//out.println("DIFF  "+difInDays);
				int validrequest=0;
				String availableRoomNumbers[]=availablerooms.split(",");
				//out.println(availableRoomNumbers.length);
				String availdates=null;
				int finalRooms[]=new int[50];
				int findex=0;
				String DATE_FORMAT = "yyyy-MM-dd";
				java.text.SimpleDateFormat simpledataformat = new java.text.SimpleDateFormat(DATE_FORMAT);
				if(recurrencetype.equals("DAILY"))
				{
					for(int i=0;i<availableRoomNumbers.length;i++)
					{
						int avail=1;
						int currentroomnumber=Integer.parseInt(availableRoomNumbers[i]);
						startdate=temp;
						c1.set(syear, smonth , sdate);
						for(int j=0;j<=difInDays;j++)
						{
							//out.println("roomdsno  "+currentroomnumber);
							//out.println("    date"+startdate);
							rs=stmt.executeQuery("select * from roomallocation where roomID="+currentroomnumber+" and (givenDate='"+startdate+"' and (('"+starttime+"'>startTime and '"+starttime+"'<endTime) or ('"+endtime+"'>startTime and '"+endtime+"'<endTime) or (startTime='"+starttime+"' and endTime='"+endtime+"') or ('"+starttime+"'<=startTime and '"+endtime+"'>=endTime))) and allocationstatus='NOTCOMPLETED'");
							if(rs.next())
							{
								//out.println("  its there ");
								avail=0;
								break;
							}
							c1.add(Calendar.DATE,1);
							//out.println(c1);
							startdate=simpledataformat.format(c1.getTime()).toString();
						}
						if(avail==1)
						{
							//out.println("  ds avsdsddsail room  "+currentroomnumber);
							finalRooms[findex]=currentroomnumber;
							findex++;
						}
						rs.close();
								 
					}
				}
				else if(recurrencetype.equals("WEEKLY"))
				{
					%>
					<tr>
						<td colspan=2>
							<font size=4 face="Baskerville Old Face" color=blue>Requested Weekdays (sunday to saturday)</font>
						</td>
						<td colspan=4>
							<font size=4 face="Baskerville Old Face" color=green><%=weeklystring%></font>
						</td>
					</tr>
					<%
					String weekdays[]=weeklystring.split("");
					int requestedweeks[]=new int[7];
					int requestedweeksindex=0;
					String datesofweeks[]=new String[200];
					int datesofweeksindex=0;
					Calendar c11= Calendar.getInstance();
					//out.println(temp);
					//out.println(difInDays);
					String startvalue1[]=temp.split("-");
					int syear11=Integer.parseInt(startvalue1[0]);
					int smonth11=Integer.parseInt(startvalue1[1]);
					smonth11=smonth11-1;
					int sdate11=Integer.parseInt(startvalue1[2]);
					c11.set(syear11, smonth11 , sdate11);
					//out.println(c11.getTime());
					for(int i=1;i<weekdays.length;i++)
					{
						if(weekdays[i].equals("1"))
						{
							requestedweeks[requestedweeksindex]=i;
							requestedweeksindex++;
						}
					}
					for(int i=0;i<requestedweeksindex;i++)
					{
						%>
						<br>
						<%
						//out.println(requestedweeks[i]);
					}
					for(int i=0;i<=difInDays;i++)
					{
						int x=0;
						x=c11.get(Calendar.DAY_OF_WEEK);
						for(int j=0;j<requestedweeksindex;j++)
						{
							if(x==requestedweeks[j])
							{
								datesofweeks[datesofweeksindex]=simpledataformat.format(c11.getTime()).toString();
								//out.println(simpledataformat.format(c11.getTime()).toString());
								datesofweeksindex++;
							}
						}
						c11.add(Calendar.DATE,1);
							//startDate=simpledataformat.format(c1.getTime()).toString();
					}
					for(int j=0;j<datesofweeksindex;j++)
					{
						if(j==0)
						{
							availdates=datesofweeks[j];
						}
						else
						{
							availdates=availdates+","+datesofweeks[j];
						}
					}
					session.setAttribute("DATESOFREQUEST",availdates);
					//out.println("   available date    "+availdates);
					for(int i=0;i<availableRoomNumbers.length;i++)
					{
						int avail=1;
						// out.println(availableRoomNumbers[i]);
						int currentroomnumber=Integer.parseInt(availableRoomNumbers[i]);
						for(int j=0;j<datesofweeksindex;j++)
						{
							String sd=datesofweeks[j];
							rs=stmt.executeQuery("select * from roomallocation where roomID="+currentroomnumber+" and (givenDate='"+sd+"' and (('"+starttime+"'>startTime and '"+starttime+"'<endTime) or ('"+endtime+"'>startTime and '"+endtime+"'<endTime) or (startTime='"+starttime+"' and endTime='"+endtime+"') or ('"+starttime+"'<=startTime and '"+endtime+"'>=endTime))) and allocationstatus='NOTCOMPLETED'");
							if(rs.next())
							{
								avail=0;
								break;
							}
						}
						if(avail==1)
						{
							finalRooms[findex]=currentroomnumber;
							findex++;
						}
					}
				}
				else if(recurrencetype.equals("MONTHLY"))
				{
					//out.println("MONTHLY");%>
					<tr>
					<td colspan=1>
						<font size=4 face="Baskerville Old Face" color=blue>Day Of Month</font>
					</td>
					<td colspan=4>
						<font size=4 face="Baskerville Old Face" color=green><%=dayofmonth%></font>
					</td>
					</tr>
					<%
						int requesteddate=Integer.parseInt(dayofmonth);
						String startvalue2[]=temp.split("-");
						String endvalue2[]=temp2.split("-");
						int syear2=Integer.parseInt(startvalue2[0]);
						int eyear2=Integer.parseInt(endvalue2[0]);
						int smonth2=Integer.parseInt(startvalue2[1]);
						int emonth2=Integer.parseInt(endvalue2[1]);
						int sdate2=Integer.parseInt(startvalue2[2]);
						int edate2=Integer.parseInt(endvalue2[2]);
						smonth2=smonth2-1;
						emonth2=emonth2-1;
						//out.println(smonth2+"  "+emonth2);
						//String DATE_FORMAT = "yyyy-MM-dd";
						//java.text.SimpleDateFormat simpledataformat = new java.text.SimpleDateFormat(DATE_FORMAT);
						Calendar c21= Calendar.getInstance();
						Calendar nowdate= Calendar.getInstance();
						Calendar c22= Calendar.getInstance();
						Calendar cal = Calendar.getInstance();
						int day = cal.get(Calendar.DATE);
						int month = cal.get(Calendar.MONTH) + 1;
						int year = cal.get(Calendar.YEAR);
						int actdate=0;
						c21.set(syear2, smonth2 , requesteddate);
						nowdate.set(syear2,smonth2,sdate2);
						c22.set(eyear2, emonth2 , edate2);
						//c1.add(Calendar.DATE,1);
						//startdate=simpledataformat.format(c1.getTime()).toString();
						int k=0;
						String datesofmonths[]=new String[400];
						while(c21.before(c22) || c21.equals(c22))
						{
							if((c21.after(nowdate) || nowdate.equals(c21)) && ((c22.after(c21) || c22.equals(c21))))
							//	out.println(simpledataformat.format(c21.getTime()).toString());
							if(k==0)
							{
								//out.println(simpledataformat.format(c21.getTime()).toString());%><BR><%
								availdates=simpledataformat.format(c21.getTime()).toString();
								datesofmonths[k]=availdates;
								k++;
							}
							else
							{
								//out.println(simpledataformat.format(c21.getTime()).toString());
								availdates=availdates+","+simpledataformat.format(c21.getTime()).toString();
								datesofmonths[k]=simpledataformat.format(c21.getTime()).toString();
								k++;
							}
							c21.add(Calendar.MONTH,1);
						}
						session.setAttribute("DATESOFMONTH",availdates);
						for(int i=0;i<availableRoomNumbers.length;i++)
						{
							int avail=1;
							//out.println("-avail room--"+availableRoomNumbers[i]);
							int currentroomnumber=Integer.parseInt(availableRoomNumbers[i]);
							//out.println("  roon no--"+currentroomnumber);
							for(int j=0;j<k;j++)
							{
								//out.println(" dat  "+datesofmonths[j]);%><%
								String sd=datesofmonths[j];
								rs=stmt.executeQuery("select * from roomallocation where roomID="+currentroomnumber+" and (givenDate='"+sd+"' and (('"+starttime+"'>startTime and '"+starttime+"'<endTime) or ('"+endtime+"'>startTime and '"+endtime+"'<endTime) or (startTime='"+starttime+"' and endTime='"+endtime+"') or ('"+starttime+"'<=startTime and '"+endtime+"'>=endTime))) and allocationstatus='NOTCOMPLETED'");
								if(rs.next())
								{
									//out.println("---caught--");%><%
									avail=0;
									break;
								}
							}
							if(avail==1)
							{
								//out.println("---avila---");%><%
								finalRooms[findex]=currentroomnumber;
								findex++;
							}
						}


				 }



				if(status.equals("OPEN"))
				{
					%>
					<tr>
					<td colspan=1>
						<font size=4 face="Baskerville Old Face" color=blue>Available Rooms</font>
					</td>
					<td colspan=3>
						<font size=4 face="Baskerville Old Face" color=maroon>RoomNo (capacity)</td>
					</tr>
					<%
					for(int i=0;i<findex;i++)
					{
						rs=stmt.executeQuery("select * from room where roomID="+finalRooms[i]+" and openstatus='OPEN'");
						//out.println("Reached here");
						rs.next();
						String roomid=rs.getString(1);
						String roomno=rs.getString(2);
						int size=rs.getInt(4);
						String str=roomno+" ("+size+")";
						%>

						<tr>
							<td>
							</td>
							<td>
								<input type="radio" name=availrooms value=<%=roomid%>><font size=4 face="Baskerville Old Face" color=firebrick><%=str%></font>
							</td>
						</tr>
						<%
					 }
					 %>
					<tr>
					<td>
						<font size=4 face="Baskerville Old Face" color=blue>Approval Comments</font>
					</td>
					<td colspan=5>
						<textarea name="approvalcomments" rows=4 cols=50 value="No Comments">No Comments</textarea>
					</td>
					<td>
						<font size=4 face="TimesNewRoman" color=red>(*Maximum 250 characters)</font>
					</td>
					</tr>
					<%
					if(findex>0)
					{
						%>
						<tr>
							<td>
							</td>
							<td>
							<input type="submit" name="requeststatus"value="Approve">
							</td>
						<%
					}
					else
					{
						%>
						<tr>
						<td colspan=5>
							<font size=5 face="Baskerville Old Face" color=red>No existing rooms are available for this request.</font>
						<%
					}	
					%>
					<td>
						<input type="submit" name="requeststatus" value="Reject">
					</td>
					</tr>
					<%
				}
				%>

				</table>
				</form>
				<%
			}
			else
			{
				%>
				<br>
				<tr>
					<td colspan=6>
						<font size=5 face="Baskerville Old Face" color=red>No existing rooms are available for this request.</font>
					</td>
				</tr>
				<tr>
					<td>
						<font size=4 face="Baskerville Old Face" color=blue>Approval Comments</font>
					</td>
					<td colspan=5>
						<textarea name="approvalcomments" rows=4 cols=50 value="No Comments">NO Commnets</textarea>
					</td>
					<td>
						<font size=4 face="TimesNewRoman" color=red>(*Maximum 250 characters)</font>
					</td>
				</tr>

				<tr>
					<td>
						<input type="submit" name="requeststatus" value="Reject">
					</td>
				</tr>
				</table>
				</form>
				<%
			}
		
		}
		else
		{
			%>
			<tr>
			<td colspan=10>
			<font color=red>
			<%
			//out.println("code for REJECTED and APPROVED REQUESTS");
		}
	}
	else if(requeststatus.equals("Reject"))
	{
		String requestid=(String)session.getAttribute("REQUESTID");
		String nowuserid=(String)session.getAttribute("USERID");
		session.removeAttribute("REQUESTID");
		int result=0;
		String approvalcomments=request.getParameter("approvalcomments");
		result=stmt.executeUpdate("update requestroom set requeststatus='REJECTED',approvalcomments='"+approvalcomments+"',lastUpdatedUser='"+nowuserid+"' where requestID='"+requestid+"'");
		if(result==1)
		{
			%>
				<font size=4 face="Baskerville Old Face" color=green>Thank you Status updated</font>
			<%
		}
		else
		{
			%>
			<font size=4 face="Baskerville Old Face" color=red>Appologies, Their is a problem with database try again</font>
			<%	
		}
	}
	else if(requeststatus.equals("Approve"))
	{
	
		 String roomno=null;
		 roomno=request.getParameter("availrooms");
		 if(roomno==null)
		 {
			%>
			<font size=4 face="Baskerville Old Face" color=red>Please select Room number before Approve</font>
			<%
		 }
		 else
		 {
			String requestid=(String)session.getAttribute("REQUESTID");
			String userid=(String)session.getAttribute("USERID");
			session.removeAttribute("REQUESTID");
			String startdate1=(String)session.getAttribute("STDATE");
			session.removeAttribute("STDATE");
			String enddate1=(String)session.getAttribute("EDDATE");
			session.removeAttribute("EDDATE");
			String starttime1=(String)session.getAttribute("STTIME");
			session.removeAttribute("STTIME");
			String endtime1=(String)session.getAttribute("EDTIME");
			session.removeAttribute("EDTIME");
			String recurrencetype1=(String)session.getAttribute("RTYPE");
			session.removeAttribute("RTYOE");
			String dates=(String)session.getAttribute("DATESOFREQUEST");
			session.removeAttribute("DATESOFREQUEST");
			String startvalue[]=startdate1.split("-");
			String endvalue[]=enddate1.split("-");
			String approvalcomments=request.getParameter("approvalcomments");
			//out.println(approvalcomments);

			//out.println(startvalue[0]+"  "+startvalue[1]+"  "+startvalue[2]);
			int syear=Integer.parseInt(startvalue[0]);
			int smonth=Integer.parseInt(startvalue[1]);
			smonth=smonth-1;
			int sdate=Integer.parseInt(startvalue[2]);
			int eyear=Integer.parseInt(endvalue[0]);
			int emonth=Integer.parseInt(endvalue[1]);
			emonth=emonth-1;
			int edate=Integer.parseInt(endvalue[2]);
			Calendar c1 = Calendar.getInstance();
			Calendar c2= Calendar.getInstance();
			c1.set(syear, smonth , sdate);
			c2.set(eyear,emonth,edate);
			long difInDays = ((c2.getTime().getTime() - c1.getTime().getTime())/(1000*60*60*24));
			String DATE_FORMAT = "yyyy-MM-dd";
			java.text.SimpleDateFormat simpledataformat = new java.text.SimpleDateFormat(DATE_FORMAT);
			if(recurrencetype1.equals("DAILY"))
			{
				 for(int i=0;i<=difInDays;i++)
				 {
					stmt.executeUpdate("insert into roomallocation(requestID,roomID,givenDate,startTime,endTime,allocationstatus,lastUpdatedUser) values('"+requestid+"','"+roomno+"','"+startdate1+"','"+starttime1+"','"+endtime1+"','NOTCOMPLETED','"+userid+"')");
						c1.add(Calendar.DATE,1);
						startdate1=simpledataformat.format(c1.getTime()).toString();
				 }
				 stmt.executeUpdate("update requestroom set requestStatus='APPROVED',approvalcomments='"+approvalcomments+"',lastUpdatedUser='"+userid+"' where requestID='"+requestid+"'");
				 %>
				 <font size=4 face="Baskerville Old Face" color=green>Thankyou. Request is added to Database.</font>
				 <%
			 }
			 else if(recurrencetype1.equals("WEEKLY"))
			 {
				 // out.println("WEEKLY APPROVE    ");
				 // out.println(dates);
				 String alldates[]=dates.split(",");
				 for(int j=0;j<alldates.length;j++)
				 {
				 	stmt.executeUpdate("insert into roomallocation(requestID,roomID,givenDate,startTime,endTime,allocationstatus,lastUpdatedUser) values('"+requestid+"','"+roomno+"','"+alldates[j]+"','"+starttime1+"','"+endtime1+"','NOTCOMPLETED','"+userid+"')");
			 	    //out.println(j+"  "+alldates[j]);
				 }
				 stmt.executeUpdate("update requestroom set requestStatus='APPROVED',approvalcomments='"+approvalcomments+"',lastUpdatedUser='"+userid+"' where requestID='"+requestid+"'");
				 %>
				 <font size=4 face="Baskerville Old Face" color=green>Thankyou. Request is added to Database.</font>
				 <%
			 }
			 else if(recurrencetype1.equals("MONTHLY"))
			 {
				 		
				// out.println("APPROVE MONTHLY");
				 String x=(String)session.getAttribute("DATESOFMONTH");
				 //out.println(x);

				if(x==null)
				{				
					%>
					<font size=4 face="Baskerville Old Face" color=RED>No VALID date is selected for this request. INVALID REQUEST. REJECT THE REQUEST</font>
					<%
				}
				else
				{
					 String alldates[]=x.split(",");

					 for(int j=0;j<alldates.length;j++)
					 {
						stmt.executeUpdate("insert into roomallocation(requestID,roomID,givenDate,startTime,endTime,allocationstatus,lastUpdatedUser) values('"+requestid+"','"+roomno+"','"+alldates[j]+"','"+starttime1+"','"+endtime1+"','NOTCOMPLETED','"+userid+"')");
						//out.println(j+"  "+alldates[j]);
					 }
					 stmt.executeUpdate("update requestroom set requestStatus='APPROVED',approvalcomments='"+approvalcomments+"',lastUpdatedUser='"+userid+"' where requestID='"+requestid+"'");
					  %>
					 <font size=4 face="Baskerville Old Face" color=green>Thankyou. Request is added to Database.</font>
					 <%
				}
			 }
		 }
	 }
	 %>
	 <br>
	 <script>
	 document.write("<input type='button' " +
	 "onClick='window.print()' " +
	 "class='printbutton' " +
	 "value='Print This Page'/>");
	 </script>
	 <%
}
catch(Exception e)
{
	out.println(e.toString());
	%>
		<font size=4 face="Baskerville Old Face" color=RED><%out.println("INVALID OPERATION PLEASE REFRESH THIS PAGE ONCE");%></font>
	<%
}
%>
</center>
</body>
</html>
