/*
 * JSP generated by Resin-3.2.0 (built Wed, 06 Aug 2008 08:41:33 PDT)
 */

package _jsp;
import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;
import java.sql.*;

public class _ChangePassword__jsp extends com.caucho.jsp.JavaPage
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
String userid=null,buttonType=null;
userid=(String)session.getAttribute("USERID");
buttonType=request.getParameter("submitPassword");
//out.println(userid);
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomdatabase","root","crs");
		Statement stmt=con.createStatement();
if(buttonType==null)
	{

    out.write(_jsp_string1, 0, _jsp_string1.length);
    }
else
	{
	//out.println(request.getParameter("oldpassword"));
	//	out.println(request.getParameter("newpassword"));
	String oldpass=null,newpass=null;
	oldpass=request.getParameter("oldpassword");
	newpass=request.getParameter("newpassword");
	ResultSet rs=null;
	rs=stmt.executeQuery("select * from user where password='"+oldpass+"' and userID='"+userid+"' and IDStatus='ACTIVE'");
	if(rs.next())
		{
		rs.close();
		int i=stmt.executeUpdate("update user set password='"+newpass+"' where userID='"+userid+"'");
		if(i>0)
			{
    out.write(_jsp_string2, 0, _jsp_string2.length);
    
			}
		else
			{
    out.write(_jsp_string3, 0, _jsp_string3.length);
    
			}
		}
	else
		{
		
    out.write(_jsp_string4, 0, _jsp_string4.length);
    
		}
	}
}
catch(Exception e)
{
//	out.println(e.toString());
		
    out.write(_jsp_string5, 0, _jsp_string5.length);
    
}

    out.write(_jsp_string6, 0, _jsp_string6.length);
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
    depend = new com.caucho.vfs.Depend(appDir.lookup("ChangePassword.jsp"), -1522929415034669812L, false);
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

  private final static char []_jsp_string2;
  private final static char []_jsp_string3;
  private final static char []_jsp_string6;
  private final static char []_jsp_string4;
  private final static char []_jsp_string0;
  private final static char []_jsp_string1;
  private final static char []_jsp_string5;
  static {
    _jsp_string2 = "<center>\r\n			<font size=5 face=\"Baskerville Old Face\" color=green>Your Password has been Changed</font>".toCharArray();
    _jsp_string3 = "<center>\r\n			<font size=5 face=\"Baskerville Old Face\" color=red>Sorry Your Password is not changed. Please contact administrator or TRY AGAIN</font>".toCharArray();
    _jsp_string6 = "\r\n</body>\r\n</html>".toCharArray();
    _jsp_string4 = "<center><font size=5 face=\"Baskerville Old Face\" color=red>USERID AND PASSWORD ARE NOT MATCHING. TRY AGAIN</font>".toCharArray();
    _jsp_string0 = "\r\n\r\n<html>\r\n<head>  <TITLE>  ROOM ALLOCATION SYSTEM </TITLE>\r\n<script type=\"text/javascript\">\r\n  function formValidator(Form1){\r\n              var elem,helperMsg; \r\n	var oldpassword = document.getElementById('oldpassword');\r\n        var newpassword = document.getElementById('newpassword');\r\n		if(validPassword(oldpassword,\"PLEASE ENTER VALID OLD PASSWORD\"))\r\n	{\r\n			if(validPassword(newpassword,\"PLEASE ENTER VALID NEW PASSWORD\"))\r\n		{\r\n				return true;\r\n		}\r\n	}\r\n	return false;\r\n}\r\nfunction validPassword(elem,helperMsg)\r\n{\r\n	var alphaExp = /^[a-zA-Z0-9@._]+$/;\r\n        if(elem.value==\"\"||elem.value=='null' || elem.value.length<4 || elem.value.length>30)\r\n        {\r\n            alert('Please Enter data in The Required field (SHOULD NOT BE NULL, MINIMUM 4 AND MAXIMUM 30 CHARACTERS)'+' ONLY [a-zA-Z0-9@._] are Allowed');\r\n		elem.focus();\r\n		return false;\r\n	}\r\n	if(elem.value.match(alphaExp)){\r\n		return true;\r\n	}else{\r\n		alert(helperMsg);\r\n		elem.focus();\r\n		return false;\r\n	}\r\n}\r\n</script>\r\n</head>\r\n<body background=\"abc.jpg\" >\r\n".toCharArray();
    _jsp_string1 = "\r\n<center>\r\n <form name='form1' method=\"post\" onsubmit='return formValidator(this)' action=\"ChangePassword.jsp\">\r\n	   <fieldset>\r\n		<legend align=\"left\"><font size=4 face=\"Baskerville Old Face\" color=blue><b>Change Password</b></font></legend>\r\n	   <table border=0>\r\n	   <tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Old Password<font size=4 face=\"Baskerville Old Face\" color=red>*</font></font></td><td><input type=\"password\" name=\"oldpassword\" size=15 id=\"oldpassword\"></td></tr>\r\n	   <tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>New Password<font size=4 face=\"Baskerville Old Face\" color=red>*</font></font></td><td><input type=\"password\" name=\"newpassword\" size=15 id=\"newpassword\"></td></tr>\r\n	   </table>\r\n	   <input type=\"submit\" name=\"submitPassword\" value=\"submitPassword\">\r\n </form>\r\n </center>\r\n <div align=\"left\">(<font size=4 face=\"Baskerville Old Face\" color=red>*</font>)--<font size=4 face=\"Baskerville Old Face\" color=blue>Fields are mandatory</font>\r\n".toCharArray();
    _jsp_string5 = "<center><font size=5 face=\"Baskerville Old Face\" color=red>Sorry. Their is a problem with the database. Try again by login again or contact Administrator</font>".toCharArray();
  }
}