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

public class _loginCheckUp__jsp extends com.caucho.jsp.JavaPage
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
	String uid=request.getParameter("userid");
     String pass=request.getParameter("password");
				
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomdatabase","root","crs");
		Statement stmt=con.createStatement();
       String q="select * from user where loginID='"+uid+"' and password='"+pass+"' and IDStatus='ACTIVE'";
		ResultSet rs=stmt.executeQuery(q);
		if(rs.next())
	{
			String usertype=rs.getString(10);
			String presentuser=rs.getString(1);
			String presentusername=rs.getString(4);
			session.setAttribute("USERID",presentuser);
			session.setAttribute("USERNAME",presentusername);
			session.setMaxInactiveInterval(75000);
			rs.close();
		Calendar cal = Calendar.getInstance();
        int day = cal.get(Calendar.DATE);
        int month = cal.get(Calendar.MONTH) + 1;
        int year = cal.get(Calendar.YEAR);
		int hours=cal.get(Calendar.HOUR_OF_DAY);
		int minutes=cal.get(Calendar.MINUTE);
		String todaydate=null,nowtime=null;
		todaydate=year+"-"+month+"-"+day;
		nowtime=hours+":"+minutes;
		//out.println(nowtime);
		stmt.executeUpdate("update roomallocation set allocationstatus='COMPLETED' where givenDate<'"+todaydate+"' or (givenDate='"+todaydate+"' and endTime<'"+nowtime+"')");
			if(usertype.equals("SUPERUSER")){
    out.write(_jsp_string1, 0, _jsp_string1.length);
    pageContext.forward("admin.jsp");
    if (true) return;
    out.write(_jsp_string2, 0, _jsp_string2.length);
    
   }
      else if(usertype.equals("REQUEST")){
  
    out.write(_jsp_string3, 0, _jsp_string3.length);
    pageContext.forward("requester.jsp");
    if (true) return;
    out.write(_jsp_string4, 0, _jsp_string4.length);
     }
  else if(usertype.equals("APPROVE")){
    out.write(_jsp_string5, 0, _jsp_string5.length);
    pageContext.forward("approver.jsp");
    if (true) return;
    out.write(_jsp_string6, 0, _jsp_string6.length);
    
      }
   
   else
   {
    out.write(_jsp_string1, 0, _jsp_string1.length);
    pageContext.forward("login.html");
    if (true) return;
    out.write(_jsp_string1, 0, _jsp_string1.length);
    }
	}
	else
	{
    out.write(_jsp_string1, 0, _jsp_string1.length);
    pageContext.forward("login.html");
    if (true) return;
    out.write(_jsp_string1, 0, _jsp_string1.length);
    }
	rs.close();
	stmt.close();
	con.close();
}
catch(Exception e)
      {
       // out.println(e.toString());
	   
    out.write(_jsp_string7, 0, _jsp_string7.length);
    

      }
	 
     
    out.write(_jsp_string8, 0, _jsp_string8.length);
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
    depend = new com.caucho.vfs.Depend(appDir.lookup("loginCheckUp.jsp"), 8716647942076774055L, false);
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

  private final static char []_jsp_string4;
  private final static char []_jsp_string2;
  private final static char []_jsp_string0;
  private final static char []_jsp_string8;
  private final static char []_jsp_string3;
  private final static char []_jsp_string1;
  private final static char []_jsp_string6;
  private final static char []_jsp_string7;
  private final static char []_jsp_string5;
  static {
    _jsp_string4 = "        \r\n  ".toCharArray();
    _jsp_string2 = "\r\n  ".toCharArray();
    _jsp_string0 = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \r\n\"http://www.w3.org/TR/html4/loose.dtd\"> \r\n\r\n \r\n \r\n\r\n\r\n<HTML>\r\n<HEAD>\r\n     <TITLE>  ROOM ALLOCATION SYSTEM </TITLE>\r\n</HEAD>\r\n<body>\r\n".toCharArray();
    _jsp_string8 = "\r\n</body>\r\n\r\n</html>".toCharArray();
    _jsp_string3 = " \r\n    ".toCharArray();
    _jsp_string1 = "\r\n   ".toCharArray();
    _jsp_string6 = "        \r\n".toCharArray();
    _jsp_string7 = "<font size=4 face=\"Baskerville Old Face\" color=red>Sorry Problem with the database. For other details contact Administrator</font><br>".toCharArray();
    _jsp_string5 = "\r\n   \r\n   ".toCharArray();
  }
}
