/*
 * JSP generated by Resin-3.2.0 (built Wed, 06 Aug 2008 08:41:33 PDT)
 */

package _jsp;
import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

public class _nextcheckIndividualReports__jsp extends com.caucho.jsp.JavaPage
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
    
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomdatabase","root","crs");
		Statement stmt=con.createStatement();
		Statement stmt1=con.createStatement();
		ResultSet rs=null,rs2=null;
		String cc=null;cc=(String)session.getAttribute("USERID");//out.println(cc);
		if(cc==null)
	 {
			
    out.write(_jsp_string1, 0, _jsp_string1.length);
    
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

    out.write(_jsp_string2, 0, _jsp_string2.length);
    out.print((roomno));
    out.write(_jsp_string3, 0, _jsp_string3.length);
    out.println(monthstring+"-"+curyear);
    out.write(_jsp_string4, 0, _jsp_string4.length);
    
	String passingstring=roomid+"_"+startdate+"_"+enddate+"_"+curmonthdate;
//int alin=0;
	if(c1.after(startcal))
	{ 
		if(!c1.equals(startcal)){
	
    out.write(_jsp_string5, 0, _jsp_string5.length);
    out.print((passingstring+"_"+"PREVIOUS"));
    out.write(_jsp_string6, 0, _jsp_string6.length);
    }}
	if(c1.before(endcal))
	{
	
    out.write(_jsp_string7, 0, _jsp_string7.length);
    out.print((passingstring+"_"+"NEXT"));
    out.write(_jsp_string8, 0, _jsp_string8.length);
    }
    out.write(_jsp_string9, 0, _jsp_string9.length);
    
		
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
					
    out.write(_jsp_string10, 0, _jsp_string10.length);
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
							
								
    out.write(_jsp_string11, 0, _jsp_string11.length);
    
								String strToNextPage=null;
								strToNextPage=roomid+"&"+date10+"&"+getstr;
								
    out.write(_jsp_string12, 0, _jsp_string12.length);
    out.print((strToNextPage));
    out.write(_jsp_string13, 0, _jsp_string13.length);
    out.println(date);
    out.write(_jsp_string14, 0, _jsp_string14.length);
    //out.println("   "+findtitle);out.println(findstime);out.println("-"+findetime);
    out.write(_jsp_string15, 0, _jsp_string15.length);
    date++;
						}
						else
						{						
					
    out.write(_jsp_string16, 0, _jsp_string16.length);
    out.print((date));
    out.write(_jsp_string17, 0, _jsp_string17.length);
     date++;
						}
					}
					
    out.write(_jsp_string18, 0, _jsp_string18.length);
    for(int i1=0;date<=daysInMonth;i1++)
				{
    out.write(_jsp_string19, 0, _jsp_string19.length);
    
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
								
    out.write(_jsp_string11, 0, _jsp_string11.length);
    
								String strToNextPage=null;
								strToNextPage=roomid+"&"+date10+"&"+getstr;	
								
    out.write(_jsp_string12, 0, _jsp_string12.length);
    out.print((strToNextPage));
    out.write(_jsp_string13, 0, _jsp_string13.length);
    out.println(date);
    out.write(_jsp_string14, 0, _jsp_string14.length);
    //out.println("    "+findtitle);out.println(findstime);out.println("-"+findetime);
    out.write(_jsp_string15, 0, _jsp_string15.length);
    date++;							
						}
						else
						{						
					
    out.write(_jsp_string16, 0, _jsp_string16.length);
    out.print((date));
    out.write(_jsp_string17, 0, _jsp_string17.length);
     date++;
						}
				}
					}
    out.write(_jsp_string20, 0, _jsp_string20.length);
    }
			
		}
		else
		{		
		int initialloop=8-x;
		int date=1;
		
				for(int j=1;j<x;j++)
				{
					
    out.write(_jsp_string10, 0, _jsp_string10.length);
    }
					for(int k=1;k<=initialloop;k++)
					{
					
    out.write(_jsp_string16, 0, _jsp_string16.length);
    out.print((date));
    out.write(_jsp_string17, 0, _jsp_string17.length);
     date++;}
					
    out.write(_jsp_string18, 0, _jsp_string18.length);
    for(int i=0;date<=daysInMonth;i++)
				{
    out.write(_jsp_string19, 0, _jsp_string19.length);
    
				for(int p=1;p<=7;p++)
					{
						if(date<=daysInMonth){
    out.write(_jsp_string21, 0, _jsp_string21.length);
    out.print((date));
    out.write(_jsp_string22, 0, _jsp_string22.length);
    date++;}
					}
    out.write(_jsp_string20, 0, _jsp_string20.length);
    }
		}
		
    out.write(_jsp_string23, 0, _jsp_string23.length);
    
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

    out.write(_jsp_string24, 0, _jsp_string24.length);
    out.print((startdate));
    out.write(_jsp_string25, 0, _jsp_string25.length);
    out.print((enddate));
    out.write(_jsp_string26, 0, _jsp_string26.length);
    out.println(monthstring+"-"+curyear);
    out.write(_jsp_string27, 0, _jsp_string27.length);
    
	String passingstring=roomid+"_"+startdate+"_"+enddate+"_"+curmonthdate;
//int alin=0;
	if(c1.after(startcal))
	{ 
		if(!c1.equals(startcal)){
	
    out.write(_jsp_string5, 0, _jsp_string5.length);
    out.print((passingstring+"_"+"PREVIOUS"));
    out.write(_jsp_string28, 0, _jsp_string28.length);
    }}
	if(c1.before(endcal))
	{
	
    out.write(_jsp_string7, 0, _jsp_string7.length);
    out.print((passingstring+"_"+"NEXT"));
    out.write(_jsp_string8, 0, _jsp_string8.length);
    }
    out.write(_jsp_string9, 0, _jsp_string9.length);
    
		
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
					
    out.write(_jsp_string10, 0, _jsp_string10.length);
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
							
								
    out.write(_jsp_string11, 0, _jsp_string11.length);
    
								String strToNextPage=null;
								strToNextPage=roomid+"&"+date10+"&"+getstr;
								
    out.write(_jsp_string12, 0, _jsp_string12.length);
    out.print((strToNextPage));
    out.write(_jsp_string13, 0, _jsp_string13.length);
    out.println(date);
    out.write(_jsp_string14, 0, _jsp_string14.length);
    //out.println("   "+findtitle);out.println(findstime);out.println("-"+findetime);
    out.write(_jsp_string15, 0, _jsp_string15.length);
    date++;
						}
						else
						{						
					
    out.write(_jsp_string16, 0, _jsp_string16.length);
    out.print((date));
    out.write(_jsp_string17, 0, _jsp_string17.length);
     date++;
						}
					}
					
    out.write(_jsp_string18, 0, _jsp_string18.length);
    for(int i1=0;date<=daysInMonth;i1++)
				{
    out.write(_jsp_string19, 0, _jsp_string19.length);
    
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
								
    out.write(_jsp_string11, 0, _jsp_string11.length);
    
								String strToNextPage=null;
								strToNextPage=roomid+"&"+date10+"&"+getstr;	
								
    out.write(_jsp_string12, 0, _jsp_string12.length);
    out.print((strToNextPage));
    out.write(_jsp_string13, 0, _jsp_string13.length);
    out.println(date);
    out.write(_jsp_string14, 0, _jsp_string14.length);
    //out.println("    "+findtitle);out.println(findstime);out.println("-"+findetime);
    out.write(_jsp_string15, 0, _jsp_string15.length);
    date++;							
						}
						else
						{						
					
    out.write(_jsp_string16, 0, _jsp_string16.length);
    out.print((date));
    out.write(_jsp_string17, 0, _jsp_string17.length);
     date++;
						}
				}
					}
    out.write(_jsp_string20, 0, _jsp_string20.length);
    }
			
		}
		else
		{		
		int initialloop=8-x;
		int date=1;
		
				for(int j=1;j<x;j++)
				{
					
    out.write(_jsp_string10, 0, _jsp_string10.length);
    }
					for(int k=1;k<=initialloop;k++)
					{
					
    out.write(_jsp_string16, 0, _jsp_string16.length);
    out.print((date));
    out.write(_jsp_string17, 0, _jsp_string17.length);
     date++;}
					
    out.write(_jsp_string18, 0, _jsp_string18.length);
    for(int i=0;date<=daysInMonth;i++)
				{
    out.write(_jsp_string19, 0, _jsp_string19.length);
    
				for(int p=1;p<=7;p++)
					{
						if(date<=daysInMonth){
    out.write(_jsp_string21, 0, _jsp_string21.length);
    out.print((date));
    out.write(_jsp_string22, 0, _jsp_string22.length);
    date++;}
					}
    out.write(_jsp_string20, 0, _jsp_string20.length);
    }
		}
		
    out.write(_jsp_string23, 0, _jsp_string23.length);
    

//#########################################################################################################
	}
}
catch(Exception e)
{
	//out.println(e.toString());
	
    out.write(_jsp_string29, 0, _jsp_string29.length);
    

}

    out.write(_jsp_string30, 0, _jsp_string30.length);
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
    depend = new com.caucho.vfs.Depend(appDir.lookup("nextcheckIndividualReports.jsp"), -265220658003246628L, false);
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

  private final static char []_jsp_string21;
  private final static char []_jsp_string4;
  private final static char []_jsp_string23;
  private final static char []_jsp_string13;
  private final static char []_jsp_string17;
  private final static char []_jsp_string30;
  private final static char []_jsp_string22;
  private final static char []_jsp_string12;
  private final static char []_jsp_string11;
  private final static char []_jsp_string19;
  private final static char []_jsp_string28;
  private final static char []_jsp_string24;
  private final static char []_jsp_string18;
  private final static char []_jsp_string15;
  private final static char []_jsp_string14;
  private final static char []_jsp_string3;
  private final static char []_jsp_string27;
  private final static char []_jsp_string6;
  private final static char []_jsp_string10;
  private final static char []_jsp_string5;
  private final static char []_jsp_string29;
  private final static char []_jsp_string25;
  private final static char []_jsp_string7;
  private final static char []_jsp_string8;
  private final static char []_jsp_string26;
  private final static char []_jsp_string2;
  private final static char []_jsp_string0;
  private final static char []_jsp_string9;
  private final static char []_jsp_string1;
  private final static char []_jsp_string16;
  private final static char []_jsp_string20;
  static {
    _jsp_string21 = "\r\n				<td bgcolor=green align=\"center\">".toCharArray();
    _jsp_string4 = "</font><br>\r\n		<hr>\r\n		</center>\r\n		".toCharArray();
    _jsp_string23 = "\r\n		</table><br>\r\n		<div align=right><I><B><font size=5 face=\"TimesNewRoman\" color=RED>RED</font></b></i>--<font size=4 face=\"TimesNewRoman\" color=RED>Represents Partially Available</font><br>\r\n<I><B><font size=5 face=\"TimesNewRoman\" color=GREEN>GREEN</font></b></i>--<font size=4 face=\"TimesNewRoman\" color=GREEN>Represents Fully Available</font><br></div>\r\n		<script>\r\ndocument.write(\"<input type='button' \" +\r\n\"onClick='window.print()' \" +\r\n\"class='printbutton' \" +\r\n\"value='Print This Page'/>\");\r\n</script>\r\n".toCharArray();
    _jsp_string13 = "\">".toCharArray();
    _jsp_string17 = "</td>\r\n					".toCharArray();
    _jsp_string30 = "\r\n</body>\r\n</html>".toCharArray();
    _jsp_string22 = "</td>\r\n				".toCharArray();
    _jsp_string12 = "<a href=\"dateReport.jsp?".toCharArray();
    _jsp_string11 = "<td bgcolor=red align=\"center\">".toCharArray();
    _jsp_string19 = "\r\n				<tr>".toCharArray();
    _jsp_string28 = "\">PREVIOUS MONTH</a>\r\n	".toCharArray();
    _jsp_string24 = "\r\n<div align=\"left\"><font size=5 face=\"TimesNewRoman\" color=darkpink>All Rooms Details for a Particular month</font></div>\r\n<center>\r\n		<table><tr><td><font size=5 face=\"TimesNewRoman\" color=blue>Start Date</font></td><td><font size=4 face=\"TimesNewRoman\" color=green>".toCharArray();
    _jsp_string18 = "</tr>\r\n				".toCharArray();
    _jsp_string15 = "</td>\r\n								".toCharArray();
    _jsp_string14 = "</a><br>".toCharArray();
    _jsp_string3 = "</font>\r\n		<font size=5 face=\"TimesNewRoman\" color=blue>Current Month</font>&nbsp;&nbsp;&nbsp;<font size=4 face=\"TimesNewRoman\" color=green>".toCharArray();
    _jsp_string27 = "</font><br>\r\n		</center>\r\n		".toCharArray();
    _jsp_string6 = "\">PREVIOUS MONTH</a></div>\r\n	".toCharArray();
    _jsp_string10 = "<td></td>\r\n				".toCharArray();
    _jsp_string5 = "<div align=\"left\"><a href=\"nextcheckIndividualReports.jsp?".toCharArray();
    _jsp_string29 = "<font size=4 face=\"Baskerville Old Face\" color=red>Sorry Problem with the databse. TRY AGAIN AFTER SOME TIME. For other details contact Administrator</font><br>".toCharArray();
    _jsp_string25 = "</font></td><td></td><td></td><td><font size=5 face=\"TimesNewRoman\" color=blue>End Date</font></td><td><font size=4 face=\"TimesNewRoman\" color=green>".toCharArray();
    _jsp_string7 = "<div align=\"right\"><a href=\"nextcheckIndividualReports.jsp?".toCharArray();
    _jsp_string8 = "\">NEXT MONTH</a></div>\r\n	".toCharArray();
    _jsp_string26 = "</font></td></tr>\r\n		</table>\r\n		</center>\r\n		<center><font size=5 face=\"TimesNewRoman\" color=blue>RoomID</font>&nbsp;&nbsp;&nbsp;<font size=5 face=\"TimesNewRoman\" color=green>ALLROOMS</font>\r\n		<font size=5 face=\"TimesNewRoman\" color=blue>Current Month</font>&nbsp;&nbsp;&nbsp;<font size=4 face=\"TimesNewRoman\" color=green>".toCharArray();
    _jsp_string2 = "\r\n<div align=\"left\"><font size=5 face=\"TimesNewRoman\" color=darkpink><b><I>Room Details for a Particular month</I></b></font></div>\r\n		<center><font size=5 face=\"TimesNewRoman\" color=blue>RoomID</font>&nbsp;&nbsp;&nbsp;<font size=5 face=\"TimesNewRoman\" color=green>".toCharArray();
    _jsp_string0 = "<html>\r\n<head>  <TITLE>  ROOM ALLOCATION SYSTEM </TITLE></head>\r\n \r\n\r\n\r\n\r\n<body background=abc.jpg>\r\n".toCharArray();
    _jsp_string9 = "\r\n	<center>\r\n<table border=1 width=400 height=200 cellspacing=2 cellpadding=2>\r\n<tr><td align=\"center\"><font size=4 face=\"TimesNewRoman\" color=blue>SUN</font></td><td align=\"center\"><font size=4 face=\"TimesNewRoman\" color=blue>MON</font></td><td align=\"center\"><font size=4 face=\"TimesNewRoman\" color=blue>TUE</font></td><td align=\"center\"><font size=4 face=\"TimesNewRoman\" color=blue>WED</font></td><td align=\"center\"><font size=4 face=\"TimesNewRoman\" color=blue>THU</font></td><td align=\"center\"><font size=4 face=\"TimesNewRoman\" color=blue>FRI</font></td><td align=\"center\"><font size=4 face=\"TimesNewRoman\" color=blue>SAT</font></td></tr>\r\n".toCharArray();
    _jsp_string1 = "<div align=right><font size=4 face=\"TimesNewRoman\" color=blue><a href=\"MainPage.html\" target=\"_top\">Home</a></font>".toCharArray();
    _jsp_string16 = "<td bgcolor=green align=\"center\">".toCharArray();
    _jsp_string20 = "\r\n					</tr>		\r\n					".toCharArray();
  }
}
