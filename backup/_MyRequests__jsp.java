/*
 * JSP generated by Resin-3.2.0 (built Wed, 06 Aug 2008 08:41:33 PDT)
 */

package _jsp;
import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;

public class _MyRequests__jsp extends com.caucho.jsp.JavaPage
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
    
 String userid=null,username=null;
 userid=(String)session.getAttribute("USERID");
 username=(String)session.getAttribute("USERNAME");
  try{
		 Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomdatabase","root","crs");
		Statement stmt=con.createStatement();Statement stmt2=con.createStatement();
		ResultSet rs=null;
		rs=stmt.executeQuery("select * from requestroom,user where (user.userID=requestroom.userID and user.userID='"+userid+"') order by requestroom.requestTime desc");
		if(rs.next())
	  {
			rs.previous();
			
    out.write(_jsp_string1, 0, _jsp_string1.length);
    out.print((username));
    out.write(_jsp_string2, 0, _jsp_string2.length);
    
				while(rs.next())
		  {String requestID=rs.getString(1);
			String userrequested=rs.getString(2);
			String userupdated=rs.getString(17);
			String statchange=null;
			if(userrequested.equals(userupdated))
			  {
				statchange="None";
			  }
			  else
			  {
					  statchange=userupdated;
					ResultSet rsTemp=stmt2.executeQuery("select name from user where userID='"+userupdated+"'");
					rsTemp.next();
					statchange=rsTemp.getString(1);
			  }
				
    out.write(_jsp_string3, 0, _jsp_string3.length);
    out.print((requestID));
    out.write(_jsp_string4, 0, _jsp_string4.length);
    out.print((requestID));
    out.write(_jsp_string5, 0, _jsp_string5.length);
    out.print((rs.getString(14)));
    out.write(_jsp_string6, 0, _jsp_string6.length);
    out.print((rs.getString(15)));
    out.write(_jsp_string6, 0, _jsp_string6.length);
    out.print((rs.getString(10)));
    out.write(_jsp_string6, 0, _jsp_string6.length);
    out.print((rs.getString(8)));
    out.write(_jsp_string6, 0, _jsp_string6.length);
    out.print((rs.getString(11)));
    out.write(_jsp_string6, 0, _jsp_string6.length);
    out.print((statchange));
    out.write(_jsp_string7, 0, _jsp_string7.length);
    }

	  }
	  else
	  {
    out.write(_jsp_string8, 0, _jsp_string8.length);
    }
  }
  catch(Exception e)
  {
	 // out.println(e.toString());
	 
    out.write(_jsp_string9, 0, _jsp_string9.length);
    

  }

 
    out.write(_jsp_string10, 0, _jsp_string10.length);
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
    depend = new com.caucho.vfs.Depend(appDir.lookup("MyRequests.jsp"), 7635296505329292682L, false);
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

  private final static char []_jsp_string1;
  private final static char []_jsp_string4;
  private final static char []_jsp_string5;
  private final static char []_jsp_string7;
  private final static char []_jsp_string3;
  private final static char []_jsp_string0;
  private final static char []_jsp_string6;
  private final static char []_jsp_string10;
  private final static char []_jsp_string2;
  private final static char []_jsp_string9;
  private final static char []_jsp_string8;
  static {
    _jsp_string1 = "\r\n			<MARQUEE DIRECTION=LEFT> <font size=5 face=\"Baskerville Old Face\" color=red>Refersh the page to view Latest database Updates</font></marquee>\r\n			<center>\r\n			<div align=left><font size=5 face=\"Baskerville Old Face\" color=brown><I><u><b>".toCharArray();
    _jsp_string4 = "\">".toCharArray();
    _jsp_string5 = "</a></font></td><td><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string7 = "</font></td></tr>\r\n				".toCharArray();
    _jsp_string3 = "\r\n				<tr><td><font size=4 face=\"Baskerville Old Face\" color=green><a href=\"MyindividualRequest.jsp?".toCharArray();
    _jsp_string0 = " \r\n\r\n<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">\r\n<HTML>\r\n <HEAD>\r\n  <TITLE>  ROOM ALLOCATION SYSTEM </TITLE>\r\n  <META NAME=\"Generator\" CONTENT=\"EditPlus\">\r\n  <META NAME=\"Author\" CONTENT=\"\">\r\n  <META NAME=\"Keywords\" CONTENT=\"\">\r\n  <META NAME=\"Description\" CONTENT=\"\">\r\n </HEAD>\r\n\r\n <BODY background=abc.jpg>\r\n  ".toCharArray();
    _jsp_string6 = "</font></td><td><font size=4 face=\"Baskerville Old Face\" color=green>".toCharArray();
    _jsp_string10 = "\r\n </body>\r\n </html>".toCharArray();
    _jsp_string2 = "</b> entered requests.....</I></font></div><br>\r\n			<table border=1>\r\n			<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>RequestID</font></td><td><font size=4 face=\"Baskerville Old Face\" color=blue>DateOfRequest</font></td><td><font size=4 face=\"Baskerville Old Face\" color=blue>Status</font></td><td><font size=4 face=\"Baskerville Old Face\" color=blue>Title</font></td><td><font size=4 face=\"Baskerville Old Face\" color=blue>RequestedCapacity</font></td><td><font size=4 face=\"Baskerville Old Face\" color=blue>Request Type</font></td><td><font size=4 face=\"Baskerville Old Face\" color=blue>Status Updated by</font></td></tr>\r\n			".toCharArray();
    _jsp_string9 = "<font size=4 face=\"Baskerville Old Face\" color=red>Sorry Problem with database. TRY AGAIN AFTER SOME TIME. For other details contact Administrator</font><br>".toCharArray();
    _jsp_string8 = "\r\n		  <font size=4 face=\"Baskerville Old Face\" color=blue>No requests from you..!!!</font>\r\n		".toCharArray();
  }
}
