/*
 * JSP generated by Resin-3.2.0 (built Wed, 06 Aug 2008 08:41:33 PDT)
 */

package _jsp;
import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;

public class _CancelRequests__jsp extends com.caucho.jsp.JavaPage
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
	  String buttonType=null;
	  buttonType=request.getQueryString();
	  Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomdatabase","root","crs");
		Statement stmt=con.createStatement();
	  if(buttonType==null)
	 {
		ResultSet rs=null;
		rs=stmt.executeQuery("select * from requestroom where requestID IN (select distinct(roomallocation.requestID) from roomallocation where allocationstatus='NOTCOMPLETED') order by requestID desc"); 
		if(rs.next())
	 {
			rs.previous();
		
    out.write(_jsp_string1, 0, _jsp_string1.length);
    
			while(rs.next())
		 {
			String id=null;
			id=rs.getString(1);
			
    out.write(_jsp_string2, 0, _jsp_string2.length);
    out.print((id));
    out.write(_jsp_string3, 0, _jsp_string3.length);
    out.print((id));
    out.write(_jsp_string4, 0, _jsp_string4.length);
    out.print((rs.getString(14)));
    out.write(_jsp_string5, 0, _jsp_string5.length);
    out.print((rs.getString(15)));
    out.write(_jsp_string5, 0, _jsp_string5.length);
    out.print((rs.getString(10)));
    out.write(_jsp_string5, 0, _jsp_string5.length);
    out.print((rs.getString(3)));
    out.write(_jsp_string5, 0, _jsp_string5.length);
    out.print((rs.getString(4)));
    out.write(_jsp_string6, 0, _jsp_string6.length);
    }
		 rs.close();
		 
    out.write(_jsp_string7, 0, _jsp_string7.length);
    }
  else
	 {
	  
    out.write(_jsp_string8, 0, _jsp_string8.length);
    
	 }
	 }
	 else
	 {
		 
		// out.println(buttonType);
		ResultSet rs=null;
		String status=null;
		rs=stmt.executeQuery("select * from requestroom,user,locationtable where (requestroom.userID=user.userID and locationtable.locationId=requestroom.location and requestID='"+buttonType+"') order by requestID asc");
		rs.next();

		
    out.write(_jsp_string9, 0, _jsp_string9.length);
     session.setAttribute("REQUESTID1",rs.getString(1));
		session.setMaxInactiveInterval(36000);
    out.write(_jsp_string10, 0, _jsp_string10.length);
    out.print((rs.getString(20)));
    out.write(_jsp_string11, 0, _jsp_string11.length);
    out.print((rs.getString(3)));
    out.write(_jsp_string12, 0, _jsp_string12.length);
    out.print((rs.getString(4)));
    out.write(_jsp_string13, 0, _jsp_string13.length);
    out.print((rs.getString(5)));
    out.write(_jsp_string14, 0, _jsp_string14.length);
    out.print((rs.getString(6)));
    out.write(_jsp_string15, 0, _jsp_string15.length);
    out.print((rs.getString(32)));
    out.write(_jsp_string16, 0, _jsp_string16.length);
    out.print((rs.getString(8)));
    out.write(_jsp_string17, 0, _jsp_string17.length);
    out.print((rs.getString(10)));
    out.write(_jsp_string18, 0, _jsp_string18.length);
    status=rs.getString(15);
    out.write(_jsp_string19, 0, _jsp_string19.length);
    out.print((status));
    out.write(_jsp_string20, 0, _jsp_string20.length);
    out.print((rs.getString(11)));
    out.write(_jsp_string21, 0, _jsp_string21.length);
    out.print((rs.getString(9)));
    out.write(_jsp_string22, 0, _jsp_string22.length);
    out.print((rs.getString(18)));
    out.write(_jsp_string23, 0, _jsp_string23.length);
    rs.close();
if(status.equals("APPROVED"))
		 {
	rs=stmt.executeQuery("select distinct(roomno) from roomallocation,room where roomallocation.roomID=room.roomID and roomallocation.requestID='"+buttonType+"'");
	if(rs.next())
			 {
    out.write(_jsp_string24, 0, _jsp_string24.length);
    out.print((rs.getString(1)));
    out.write(_jsp_string23, 0, _jsp_string23.length);
    
			 }
		 }

    out.write(_jsp_string25, 0, _jsp_string25.length);
    

	 }
 }
 catch(Exception e)
 {
	// out.println(e.toString());
			
    out.write(_jsp_string26, 0, _jsp_string26.length);
    
 }
  
  
    out.write(_jsp_string27, 0, _jsp_string27.length);
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
    depend = new com.caucho.vfs.Depend(appDir.lookup("CancelRequests.jsp"), 7931435320087895498L, false);
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

  private final static char []_jsp_string14;
  private final static char []_jsp_string4;
  private final static char []_jsp_string8;
  private final static char []_jsp_string7;
  private final static char []_jsp_string26;
  private final static char []_jsp_string3;
  private final static char []_jsp_string24;
  private final static char []_jsp_string19;
  private final static char []_jsp_string27;
  private final static char []_jsp_string18;
  private final static char []_jsp_string5;
  private final static char []_jsp_string10;
  private final static char []_jsp_string9;
  private final static char []_jsp_string22;
  private final static char []_jsp_string15;
  private final static char []_jsp_string6;
  private final static char []_jsp_string20;
  private final static char []_jsp_string25;
  private final static char []_jsp_string16;
  private final static char []_jsp_string0;
  private final static char []_jsp_string17;
  private final static char []_jsp_string11;
  private final static char []_jsp_string13;
  private final static char []_jsp_string1;
  private final static char []_jsp_string21;
  private final static char []_jsp_string2;
  private final static char []_jsp_string12;
  private final static char []_jsp_string23;
  static {
    _jsp_string14 = "</font></td><td><font size=4 face=\"Baskerville Old Face\" color=blue>End Time</font></td><td><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string4 = "</a></font></td>\r\n			<td align=center><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string8 = "<CENTER><font size=4 face=\"Baskerville Old Face\" color=blue>NO MORE ALLOCATIONS IN DATABASE</font>".toCharArray();
    _jsp_string7 = "</table></center>\r\n			</form>\r\n  \r\n  ".toCharArray();
    _jsp_string26 = "<center><font size=5 face=\"Baskerville Old Face\" color=red>Sorry Their is a problem with the database. Please try again by login again or contact Administrator</font>".toCharArray();
    _jsp_string3 = "\">".toCharArray();
    _jsp_string24 = "\r\n<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Allocated Room</font></td><td colspan=4><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string19 = "\r\n<td><font size=4 face=\"Baskerville Old Face\" color=blue>Status</td><td><font size=5 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string27 = "\r\n</body>\r\n</html>".toCharArray();
    _jsp_string18 = "</font></td>\r\n".toCharArray();
    _jsp_string5 = "</font></td>\r\n			<td align=center><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string10 = "\r\n<table border=0>\r\n<tr><td></td><td><font size=4 face=\"Baskerville Old Face\" color=blue>Requested User</font></td><td><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string9 = "\r\n		<form method=\"post\" action=\"afterCancellRequests.jsp\">\r\n <center>\r\n".toCharArray();
    _jsp_string22 = "</font></td></tr>\r\n<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Approval Comments</font></td><td colspan=4><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string15 = "</font></td></tr>\r\n\r\n<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Location</td><td><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string6 = "</font></td>\r\n\r\n		 ".toCharArray();
    _jsp_string20 = "</td>\r\n</tr>\r\n<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Request Type</font></td><td colspan=4><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string25 = "</table><input type=\"submit\" name=\"Cancel\" value=\"CancellRequest\">".toCharArray();
    _jsp_string16 = "</font></td><td><font size=4 face=\"Baskerville Old Face\" color=blue>Capacity</font></td><td><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string0 = " \r\n\r\n<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">\r\n<HTML>\r\n <HEAD>\r\n   <TITLE>  ROOM ALLOCATION SYSTEM </TITLE>\r\n  <META NAME=\"Generator\" CONTENT=\"EditPlus\">\r\n  <META NAME=\"Author\" CONTENT=\"\">\r\n  <META NAME=\"Keywords\" CONTENT=\"\">\r\n  <META NAME=\"Description\" CONTENT=\"\">\r\n </HEAD>\r\n\r\n <BODY background=abc.jpg>\r\n  ".toCharArray();
    _jsp_string17 = "</font></td></tr>\r\n\r\n<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Recurring Title</td><td><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string11 = "</font></td><td></td></tr><tr></tr>\r\n\r\n<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Start Date</td><td><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string13 = "</font></td></tr>\r\n\r\n<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Start Time</td><td><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string1 = "\r\n		<form method=\"post\" name=\"form1\" action=\"CancelRequests.jsp\">\r\n		<font size=5 face=\"Baskerville Old Face\" color=green><u>Select Cacellation Requests</font><br><br>\r\n		<center>\r\n	<table border=1>\r\n			<tr><td align=center><font size=4 face=\"Baskerville Old Face\" color=blue>RequestID</font></td><td align=center><font size=4 face=\"Baskerville Old Face\" color=blue>DateOfRequest</font></td><td align=center><font size=4 face=\"Baskerville Old Face\" color=blue>Status</font></td><td align=center><font size=4 face=\"Baskerville Old Face\" color=blue>Title</font></td><td align=center><font size=4 face=\"Baskerville Old Face\" color=blue>Start Date</font></td><td align=center><font size=4 face=\"Baskerville Old Face\" color=blue>End Date</font></td></tr>\r\n			".toCharArray();
    _jsp_string21 = "</font></td></tr>\r\n<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Purpose</font></td><td colspan=4><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string2 = "<tr>\r\n			<td align=center><font size=4 face=\"Baskerville Old Face\" color=green><a href=\"CancelRequests.jsp?".toCharArray();
    _jsp_string12 = "</font></td><td><font size=4 face=\"Baskerville Old Face\" color=blue>End Date</font></td><td><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string23 = "</font></td></tr>\r\n".toCharArray();
  }
}