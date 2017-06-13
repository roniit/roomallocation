/*
 * JSP generated by Resin-3.2.0 (built Wed, 06 Aug 2008 08:41:33 PDT)
 */

package _jsp;
import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
import java.text.*;
import java.util.Date;
import java.util.*;
import java.text.SimpleDateFormat;

public class _individualRequest__jsp extends com.caucho.jsp.JavaPage
{
  private static final java.util.HashMap<String,java.lang.reflect.Method> _jsp_functionMap = new java.util.HashMap<String,java.lang.reflect.Method>();
  private boolean _caucho_isDead;
  private com.caucho.jsp.PageManager _jsp_pageManager;
  
  public void
  _jspService(javax.servlet.http.HttpServletRequest request,
              javax.servlet.http.HttpServletResponse response)
    throws java.io.IOException, javax.servlet.ServletException
  {
    javax.servlet.http.HttpSession session = request.getSession(true);
    com.caucho.server.webapp.WebApp _jsp_application = _caucho_getApplication();
    com.caucho.jsp.PageContextImpl pageContext = _jsp_pageManager.allocatePageContext(this, _jsp_application, request, response, null, session, 8192, true, false);

    TagState _jsp_state = new TagState();

    try {
      _jspService(request, response, pageContext, _jsp_application, session, _jsp_state);
    } catch (java.lang.Throwable _jsp_e) {
      pageContext.handlePageException(_jsp_e);
    } finally {
      _jsp_state.release();
      _jsp_pageManager.freePageContext(pageContext);
    }
  }
  
  private void
  _jspService(javax.servlet.http.HttpServletRequest request,
              javax.servlet.http.HttpServletResponse response,
              com.caucho.jsp.PageContextImpl pageContext,
              javax.servlet.ServletContext application,
              javax.servlet.http.HttpSession session,
              TagState _jsp_state)
    throws Throwable
  {
    javax.servlet.jsp.JspWriter out = pageContext.getOut();
    final javax.el.ELContext _jsp_env = pageContext.getELContext();
    javax.servlet.ServletConfig config = getServletConfig();
    javax.servlet.Servlet page = this;
    javax.servlet.jsp.tagext.JspTag _jsp_parent_tag = null;
    response.setContentType("text/html");

    out.write(_jsp_string0, 0, _jsp_string0.length);
    
 String requestID=request.getQueryString();
 String requeststatus=null;
 requeststatus=request.getParameter("requeststatus");
// out.println(requeststatus);
 try{
		 Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomdatabase","root","crs");
		Statement stmt=con.createStatement();
		if(requeststatus==null)
	 {
		ResultSet rs=null;
		String status=null;
		rs=stmt.executeQuery("select * from requestroom,user,locationtable where (requestroom.userID=user.userID and requestroom.location=locationtable.locationId and requestID='"+requestID+"') order by requestID asc");
		rs.next();

		
    out.write(_jsp_string1, 0, _jsp_string1.length);
     session.setAttribute("REQUESTID",rs.getString(1));session.setMaxInactiveInterval(36000);
status=rs.getString(15);
String weeklystring=null,dayofmonth=null;
weeklystring=rs.getString(12);
dayofmonth=rs.getString(13);

    out.write(_jsp_string2, 0, _jsp_string2.length);
    out.print((rs.getString(20)));
    out.write(_jsp_string3, 0, _jsp_string3.length);
    String startdate=rs.getString(3);
String enddate=rs.getString(4);
session.setAttribute("STDATE",startdate);
session.setAttribute("EDDATE",enddate);
    out.write(_jsp_string4, 0, _jsp_string4.length);
    out.print((startdate));
    out.write(_jsp_string5, 0, _jsp_string5.length);
    out.print((enddate));
    out.write(_jsp_string6, 0, _jsp_string6.length);
    String starttime=rs.getString(5);
String endtime=rs.getString(6);
session.setAttribute("STTIME",starttime);
session.setAttribute("EDTIME",endtime);
    out.write(_jsp_string7, 0, _jsp_string7.length);
    out.print((starttime));
    out.write(_jsp_string8, 0, _jsp_string8.length);
    out.print((endtime));
    out.write(_jsp_string6, 0, _jsp_string6.length);
    String location=rs.getString(31);
String capacity=rs.getString(8);
int capacityint=Integer.parseInt(capacity);
    out.write(_jsp_string9, 0, _jsp_string9.length);
    out.print((rs.getString(32)));
    out.write(_jsp_string10, 0, _jsp_string10.length);
    out.print((capacity));
    out.write(_jsp_string11, 0, _jsp_string11.length);
    out.print((rs.getString(10)));
    out.write(_jsp_string12, 0, _jsp_string12.length);
    out.print((status));
    out.write(_jsp_string13, 0, _jsp_string13.length);
    String recurrencetype=rs.getString(11);
session.setAttribute("RTYPE",recurrencetype);

    out.write(_jsp_string14, 0, _jsp_string14.length);
    out.print((recurrencetype));
    out.write(_jsp_string15, 0, _jsp_string15.length);
    out.print((rs.getString(9)));
    out.write(_jsp_string16, 0, _jsp_string16.length);
    out.print((rs.getString(18)));
    out.write(_jsp_string17, 0, _jsp_string17.length);
    
	rs.close();
	if(status.equals("APPROVED"))
		 {
		rs=stmt.executeQuery("select distinct(roomno) from roomallocation,room where roomallocation.roomID=room.roomID and roomallocation.requestID='"+requestID+"'");
	if(rs.next())
			 {
    out.write(_jsp_string18, 0, _jsp_string18.length);
    out.print((rs.getString(1)));
    out.write(_jsp_string6, 0, _jsp_string6.length);
    
			 }
	rs.close();
    out.write(_jsp_string19, 0, _jsp_string19.length);
    
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
int smonth=Integer.parseInt(startvalue[1]);smonth=smonth-1;
int sdate=Integer.parseInt(startvalue[2]);
int eyear=Integer.parseInt(endvalue[0]);
int emonth=Integer.parseInt(endvalue[1]);emonth=emonth-1;
int edate=Integer.parseInt(endvalue[2]);
Calendar c1 = Calendar.getInstance();
Calendar c2= Calendar.getInstance();
c1.set(syear, smonth , sdate);
c2.set(eyear,emonth,edate);
long difInDays = ((c2.getTime().getTime() - c1.getTime().getTime())/(1000*60*60*24));
//out.println("DIFF  "+difInDays);
int validrequest=0;
String availableRoomNumbers[]=availablerooms.split(",");
String availdates=null;
int finalRooms[]=new int[10];
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
						 {//out.println("  its there ");
							avail=0;
							break;
						 }
						 c1.add(Calendar.DATE,1);
						startdate=simpledataformat.format(c1.getTime()).toString();
				 }
				if(avail==1)
				 {//out.println("  ds avsdsddsail room  "+currentroomnumber);
					finalRooms[findex]=currentroomnumber;
					findex++;
				 }
				 rs.close();
				 
			 }
		 }
	else if(recurrencetype.equals("WEEKLY"))
		 {
    out.write(_jsp_string20, 0, _jsp_string20.length);
    out.print((weeklystring));
    out.write(_jsp_string21, 0, _jsp_string21.length);
    
		String weekdays[]=weeklystring.split("");
		int requestedweeks[]=new int[7];
		int requestedweeksindex=0;
		String datesofweeks[]=new String[200];
		int datesofweeksindex=0;
		Calendar c11= Calendar.getInstance();
//		out.println(temp);
//		out.println(difInDays);
		String startvalue1[]=temp.split("-");
		int syear11=Integer.parseInt(startvalue1[0]);
		int smonth11=Integer.parseInt(startvalue1[1]);smonth11=smonth11-1;
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
				 
    out.write(_jsp_string22, 0, _jsp_string22.length);
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
//		out.println("   available date    "+availdates);
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
			//out.println("MONTHLY");
    out.write(_jsp_string23, 0, _jsp_string23.length);
    out.print((dayofmonth));
    out.write(_jsp_string21, 0, _jsp_string21.length);
    
				int requesteddate=Integer.parseInt(dayofmonth);
				String startvalue2[]=temp.split("-");
				String endvalue2[]=temp2.split("-");
		int syear2=Integer.parseInt(startvalue2[0]);int eyear2=Integer.parseInt(endvalue2[0]);
		int smonth2=Integer.parseInt(startvalue2[1]);int emonth2=Integer.parseInt(endvalue2[1]);
		int sdate2=Integer.parseInt(startvalue2[2]);int edate2=Integer.parseInt(endvalue2[2]);
		smonth2=smonth2-1;emonth2=emonth2-1;
//		out.println(smonth2+"  "+emonth2);
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
					//out.println(simpledataformat.format(c21.getTime()).toString());
    out.write(_jsp_string24, 0, _jsp_string24.length);
    
					availdates=simpledataformat.format(c21.getTime()).toString();
					datesofmonths[k]=availdates;
					k++;
				 }
				 else
				 {//out.println(simpledataformat.format(c21.getTime()).toString());
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
				 {//out.println(" dat  "+datesofmonths[j]);
    
					 String sd=datesofmonths[j];
					 rs=stmt.executeQuery("select * from roomallocation where roomID="+currentroomnumber+" and (givenDate='"+sd+"' and (('"+starttime+"'>startTime and '"+starttime+"'<endTime) or ('"+endtime+"'>startTime and '"+endtime+"'<endTime) or (startTime='"+starttime+"' and endTime='"+endtime+"') or ('"+starttime+"'<=startTime and '"+endtime+"'>=endTime))) and allocationstatus='NOTCOMPLETED'");
				if(rs.next())
						 {//out.println("---caught--");
    
							avail=0;
							break;
						 }
				 }
				 if(avail==1)
				 {//out.println("---avila---");
    
					finalRooms[findex]=currentroomnumber;
					findex++;
				 }
			 }


		 }



if(status.equals("OPEN"))
		 {
    out.write(_jsp_string25, 0, _jsp_string25.length);
    
	 for(int i=0;i<findex;i++)
		 {
				 rs=stmt.executeQuery("select * from room where roomID="+finalRooms[i]+" and openstatus='OPEN'");
				 rs.next();
				 String roomid=rs.getString(1);
				 String roomno=rs.getString(2);
				 int size=rs.getInt(4);
				 String str=roomno+" ("+size+")";
				 
    out.write(_jsp_string26, 0, _jsp_string26.length);
    out.print((roomid));
    out.write(_jsp_string27, 0, _jsp_string27.length);
    out.print((str));
    out.write(_jsp_string28, 0, _jsp_string28.length);
    }
			
    out.write(_jsp_string29, 0, _jsp_string29.length);
    
if(findex>0)
			 {
    out.write(_jsp_string30, 0, _jsp_string30.length);
    }
else
{

    out.write(_jsp_string31, 0, _jsp_string31.length);
    }	
    out.write(_jsp_string32, 0, _jsp_string32.length);
    }
    out.write(_jsp_string33, 0, _jsp_string33.length);
    }
	else
		 {
			
    out.write(_jsp_string34, 0, _jsp_string34.length);
    
		 }
		 }
		 else{
			 
    out.write(_jsp_string35, 0, _jsp_string35.length);
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
    out.write(_jsp_string36, 0, _jsp_string36.length);
    }
	else
		 {
    out.write(_jsp_string37, 0, _jsp_string37.length);
    }
	 }
	 else if(requeststatus.equals("Approve"))
	 {
		 String roomno=null;
		 roomno=request.getParameter("availrooms");
		 if(roomno==null)
		 {
    out.write(_jsp_string38, 0, _jsp_string38.length);
    }
		 else
		 {
			String requestid=(String)session.getAttribute("REQUESTID");
			String userid=(String)session.getAttribute("USERID");
			session.removeAttribute("REQUESTID");
			String startdate1=(String)session.getAttribute("STDATE");session.removeAttribute("STDATE");
			String enddate1=(String)session.getAttribute("EDDATE");session.removeAttribute("EDDATE");
			String starttime1=(String)session.getAttribute("STTIME");session.removeAttribute("STTIME");
			String endtime1=(String)session.getAttribute("EDTIME");session.removeAttribute("EDTIME");
			String recurrencetype1=(String)session.getAttribute("RTYPE");session.removeAttribute("RTYOE");
			String dates=(String)session.getAttribute("DATESOFREQUEST");session.removeAttribute("DATESOFREQUEST");
			String startvalue[]=startdate1.split("-");
			String endvalue[]=enddate1.split("-");
			String approvalcomments=request.getParameter("approvalcomments");//out.println(approvalcomments);

			//out.println(startvalue[0]+"  "+startvalue[1]+"  "+startvalue[2]);
			int syear=Integer.parseInt(startvalue[0]);
			int smonth=Integer.parseInt(startvalue[1]);smonth=smonth-1;
			int sdate=Integer.parseInt(startvalue[2]);
			int eyear=Integer.parseInt(endvalue[0]);
			int emonth=Integer.parseInt(endvalue[1]);emonth=emonth-1;
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
			 
    out.write(_jsp_string39, 0, _jsp_string39.length);
    
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
				  
    out.write(_jsp_string39, 0, _jsp_string39.length);
    
			 }
			 else if(recurrencetype1.equals("MONTHLY"))
			 {
				 		
				// out.println("APPROVE MONTHLY");
				 String x=(String)session.getAttribute("DATESOFMONTH");
				 //out.println(x);

					if(x==null)
				 {				
				 
    out.write(_jsp_string40, 0, _jsp_string40.length);
    
					 }
				else{
				String alldates[]=x.split(",");

				for(int j=0;j<alldates.length;j++)
				 {
					stmt.executeUpdate("insert into roomallocation(requestID,roomID,givenDate,startTime,endTime,allocationstatus,lastUpdatedUser) values('"+requestid+"','"+roomno+"','"+alldates[j]+"','"+starttime1+"','"+endtime1+"','NOTCOMPLETED','"+userid+"')");
					//out.println(j+"  "+alldates[j]);
				 }
				 stmt.executeUpdate("update requestroom set requestStatus='APPROVED',approvalcomments='"+approvalcomments+"',lastUpdatedUser='"+userid+"' where requestID='"+requestid+"'");
				  
    out.write(_jsp_string39, 0, _jsp_string39.length);
    
			 }
			 }
		 }
	 }
    out.write(_jsp_string41, 0, _jsp_string41.length);
    
	 }
catch(Exception e)
{
	//out.println(e.toString());
	
    out.write(_jsp_string42, 0, _jsp_string42.length);
    out.println("INVALID OPERATION PLEASE REFRESH THIS PAGE ONCE");
    out.write(_jsp_string43, 0, _jsp_string43.length);
    
}
 
    out.write(_jsp_string44, 0, _jsp_string44.length);
  }

  private java.util.ArrayList _caucho_depends = new java.util.ArrayList();

  public java.util.ArrayList _caucho_getDependList()
  {
    return _caucho_depends;
  }

  public void _caucho_addDepend(com.caucho.vfs.PersistentDependency depend)
  {
    super._caucho_addDepend(depend);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
  }

  public boolean _caucho_isModified()
  {
    if (_caucho_isDead)
      return true;
    if (com.caucho.server.util.CauchoSystem.getVersionId() != 1541868491438029340L)
      return true;
    for (int i = _caucho_depends.size() - 1; i >= 0; i--) {
      com.caucho.vfs.Dependency depend;
      depend = (com.caucho.vfs.Dependency) _caucho_depends.get(i);
      if (depend.isModified())
        return true;
    }
    return false;
  }

  public long _caucho_lastModified()
  {
    return 0;
  }

  public void destroy()
  {
      _caucho_isDead = true;
      super.destroy();
    TagState tagState;
  }

  public void init(com.caucho.vfs.Path appDir)
    throws javax.servlet.ServletException
  {
    com.caucho.vfs.Path resinHome = com.caucho.server.util.CauchoSystem.getResinHome();
    com.caucho.vfs.MergePath mergePath = new com.caucho.vfs.MergePath();
    mergePath.addMergePath(appDir);
    mergePath.addMergePath(resinHome);
    com.caucho.loader.DynamicClassLoader loader;
    loader = (com.caucho.loader.DynamicClassLoader) getClass().getClassLoader();
    String resourcePath = loader.getResourcePathSpecificFirst();
    mergePath.addClassPath(resourcePath);
    com.caucho.vfs.Depend depend;
    depend = new com.caucho.vfs.Depend(appDir.lookup("individualRequest.jsp"), -8127592317558980775L, false);
    com.caucho.jsp.JavaPage.addDepend(_caucho_depends, depend);
  }

  final static class TagState {

    void release()
    {
    }
  }

  public java.util.HashMap<String,java.lang.reflect.Method> _caucho_getFunctionMap()
  {
    return _jsp_functionMap;
  }

  public void init(ServletConfig config)
  {
    try {
      com.caucho.server.webapp.WebApp webApp
        = (com.caucho.server.webapp.WebApp) config.getServletContext();
      super.init(config);
      _jsp_pageManager = webApp.getJspApplicationContext().getPageManager();
      com.caucho.jsp.TaglibManager manager = webApp.getJspApplicationContext().getTaglibManager();
      com.caucho.jsp.PageContextImpl pageContext = new com.caucho.jsp.PageContextImpl(webApp, this);
    } catch (Exception e) {
      throw com.caucho.config.ConfigException.create(e);
    }
  }

  private final static char []_jsp_string36;
  private final static char []_jsp_string8;
  private final static char []_jsp_string26;
  private final static char []_jsp_string24;
  private final static char []_jsp_string23;
  private final static char []_jsp_string22;
  private final static char []_jsp_string13;
  private final static char []_jsp_string15;
  private final static char []_jsp_string43;
  private final static char []_jsp_string35;
  private final static char []_jsp_string38;
  private final static char []_jsp_string18;
  private final static char []_jsp_string0;
  private final static char []_jsp_string44;
  private final static char []_jsp_string1;
  private final static char []_jsp_string9;
  private final static char []_jsp_string3;
  private final static char []_jsp_string17;
  private final static char []_jsp_string20;
  private final static char []_jsp_string30;
  private final static char []_jsp_string40;
  private final static char []_jsp_string32;
  private final static char []_jsp_string27;
  private final static char []_jsp_string11;
  private final static char []_jsp_string12;
  private final static char []_jsp_string4;
  private final static char []_jsp_string37;
  private final static char []_jsp_string16;
  private final static char []_jsp_string28;
  private final static char []_jsp_string14;
  private final static char []_jsp_string42;
  private final static char []_jsp_string10;
  private final static char []_jsp_string19;
  private final static char []_jsp_string39;
  private final static char []_jsp_string2;
  private final static char []_jsp_string25;
  private final static char []_jsp_string34;
  private final static char []_jsp_string33;
  private final static char []_jsp_string29;
  private final static char []_jsp_string5;
  private final static char []_jsp_string21;
  private final static char []_jsp_string41;
  private final static char []_jsp_string6;
  private final static char []_jsp_string7;
  private final static char []_jsp_string31;
  static {
    _jsp_string36 = "\r\n		<font size=4 face=\"Baskerville Old Face\" color=green>Thank you Status updated</font>\r\n		".toCharArray();
    _jsp_string8 = "</font></td><td><font size=4 face=\"Baskerville Old Face\" color=blue>End Time</font></td><td><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string26 = "\r\n			\r\n			<tr><td></td><td><input type=\"radio\" name=availrooms value=".toCharArray();
    _jsp_string24 = "<BR>".toCharArray();
    _jsp_string23 = "\r\n			<tr><td colspan=1><font size=4 face=\"Baskerville Old Face\" color=blue>Day Of Month</font></td><td colspan=4><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string22 = "<br>".toCharArray();
    _jsp_string13 = "</td>\r\n</tr>\r\n".toCharArray();
    _jsp_string15 = "</font></td></tr>\r\n<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Purpose</font></td><td colspan=6><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string43 = "</font>".toCharArray();
    _jsp_string35 = "<tr><td colspan=10><font color=red>".toCharArray();
    _jsp_string38 = "\r\n		<font size=4 face=\"Baskerville Old Face\" color=red>Please select Room number before Approve</font>\r\n		".toCharArray();
    _jsp_string18 = "\r\n<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Allocated Room</font></td><td colspan=4><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string0 = " \r\n\r\n\r\n\r\n\r\n\r\n<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">\r\n<HTML>\r\n <HEAD>\r\n  <TITLE>  ROOM ALLOCATION SYSTEM </TITLE>\r\n  <META NAME=\"Generator\" CONTENT=\"EditPlus\">\r\n  <META NAME=\"Author\" CONTENT=\"\">\r\n  <META NAME=\"Keywords\" CONTENT=\"\">\r\n  <META NAME=\"Description\" CONTENT=\"\">\r\n </HEAD>\r\n\r\n <BODY background=abc.jpg>\r\n <div align=\"right\"><font size=4 face=\"Baskerville Old Face\" color=brown><a href=\"approveRequests.jsp\">Back</a></font></div>\r\n <center>\r\n ".toCharArray();
    _jsp_string44 = "\r\n </center>\r\n </body>\r\n </html>".toCharArray();
    _jsp_string1 = "\r\n		<form method=\"post\" action=\"individualRequest.jsp\">\r\n <center>\r\n".toCharArray();
    _jsp_string9 = "\r\n<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Location</td><td><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string3 = "</font></td><td></td></tr><tr></tr>\r\n".toCharArray();
    _jsp_string17 = "</font></td></tr>\r\n\r\n".toCharArray();
    _jsp_string20 = "\r\n		<tr><td colspan=2><font size=4 face=\"Baskerville Old Face\" color=blue>Requested Weekdays (sunday to saturday)</font></td><td colspan=4><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string30 = "\r\n<tr><td></td><td><input type=\"submit\" name=\"requeststatus\"value=\"Approve\"></td>\r\n".toCharArray();
    _jsp_string40 = "\r\n					<font size=4 face=\"Baskerville Old Face\" color=RED>No VALID date is selected for this request. INVALID REQUEST. REJECT THE REQUEST</font>\r\n				".toCharArray();
    _jsp_string32 = "\r\n<td><input type=\"submit\" name=\"requeststatus\" value=\"Reject\"></td></tr>\r\n".toCharArray();
    _jsp_string27 = "><font size=4 face=\"Baskerville Old Face\" color=firebrick>".toCharArray();
    _jsp_string11 = "</font></td></tr>\r\n\r\n<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Title</td><td><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string12 = "</font></td>\r\n<td><font size=4 face=\"Baskerville Old Face\" color=blue>Status</td><td><font size=5 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string4 = "\r\n<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Start Date</td><td><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string37 = "\r\n		<font size=4 face=\"Baskerville Old Face\" color=red>Appologies, Their is a problem with database try again</font>\r\n		".toCharArray();
    _jsp_string16 = "</font></td></tr>\r\n<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Approval Comments</font></td><td colspan=4><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string28 = "</font></td></tr>\r\n		 ".toCharArray();
    _jsp_string14 = "\r\n<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Recurring Type</font></td><td colspan=4><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string42 = "<font size=4 face=\"Baskerville Old Face\" color=RED>".toCharArray();
    _jsp_string10 = "</font></td><td><font size=4 face=\"Baskerville Old Face\" color=blue>Capacity</font></td><td><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string19 = "\r\n	</table>".toCharArray();
    _jsp_string39 = "\r\n		<font size=4 face=\"Baskerville Old Face\" color=green>Thankyou. Request is added to Database.</font>\r\n		 ".toCharArray();
    _jsp_string2 = "\r\n<table border=0>\r\n<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Requested User</font></td><td><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string25 = "\r\n		 <tr><td colspan=1><font size=4 face=\"Baskerville Old Face\" color=blue>Available Rooms</font></td><td colspan=3><font size=4 face=\"Baskerville Old Face\" color=maroon>RoomNo (capacity)</td></tr>".toCharArray();
    _jsp_string34 = "<br><tr><td colspan=6><font size=5 face=\"Baskerville Old Face\" color=red>No existing rooms are available for this request.</font>\r\n			</td></tr>\r\n		<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Approval Comments</font></td><td colspan=5><textarea name=\"approvalcomments\" rows=4 cols=50 value=\"No Comments\">NO Commnets</textarea></td><td><font size=4 face=\"TimesNewRoman\" color=red>(*Maximum 250 characters)</font></td></tr>\r\n\r\n			<tr><td><input type=\"submit\" name=\"requeststatus\" value=\"Reject\"></td></tr>\r\n			</table>\r\n			</form>\r\n			".toCharArray();
    _jsp_string33 = "\r\n\r\n</table>\r\n</form>\r\n".toCharArray();
    _jsp_string29 = "\r\n<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Approval Comments</font></td><td colspan=5><textarea name=\"approvalcomments\" rows=4 cols=50 value=\"No Comments\">No Comments</textarea></td><td><font size=4 face=\"TimesNewRoman\" color=red>(*Maximum 250 characters)</font></td></tr>\r\n".toCharArray();
    _jsp_string5 = "</font></td><td><font size=4 face=\"Baskerville Old Face\" color=blue>End Date</font></td><td><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string21 = "</font></td></tr>".toCharArray();
    _jsp_string41 = "\r\n	 <br>\r\n	 <script>\r\ndocument.write(\"<input type='button' \" +\r\n\"onClick='window.print()' \" +\r\n\"class='printbutton' \" +\r\n\"value='Print This Page'/>\");\r\n</script>\r\n	 ".toCharArray();
    _jsp_string6 = "</font></td></tr>\r\n".toCharArray();
    _jsp_string7 = "\r\n<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Start Time</td><td><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string31 = "<tr><td colspan=5><font size=5 face=\"Baskerville Old Face\" color=red>No existing rooms are available for this request.</font>\r\n\r\n".toCharArray();
  }
}
