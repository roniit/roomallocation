/*
 * JSP generated by Resin-3.2.0 (built Wed, 06 Aug 2008 08:41:33 PDT)
 */

package _jsp;
import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;
import java.sql.*;

public class _addroom__jsp extends com.caucho.jsp.JavaPage
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
	String roomno1=null;
	String locations1=null;
	String capacity1=null;
	String cost1=null;
	String floorno1=null;
	String address1=null;
	String openstatus1=null;
	roomno1=request.getParameter("roomno");
	locations1=request.getParameter("locations");
	capacity1=request.getParameter("capacity");
	cost1=request.getParameter("cost");
	floorno1=request.getParameter("floorno");
//	address1=request.getParameter("address");
	openstatus1=request.getParameter("openstatus");
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomdatabase","root","crs");
		Statement stmt=con.createStatement();
		ResultSet rs=null;
		String presentID=null;
		presentID = (String)session.getAttribute("USERID");
		
		rs=stmt.executeQuery("select * from room where roomno='"+roomno1+"'");
//		out.println(roomno1+"  "+locations1+"  "+cost1+"  "+floorno1+"  "+address1+"  "+openstatus1);
		if(roomno1==null || locations1.equals("locations") || cost1==null || floorno1==null || openstatus1.equals("status"))
	{
			
    out.write(_jsp_string1, 0, _jsp_string1.length);
    }
			else{
		if(!rs.next())
	{
		int i=0;
		i=stmt.executeUpdate("insert into room(roomno,location,capacity,cost,floorno,openstatus,lastUpdatedUser) values('"+roomno1+"','"+locations1+"',"+capacity1+","+cost1+","+floorno1+",'"+openstatus1+"','"+presentID+"')");
		stmt.close();
		con.close();
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
//out.println(e.toString());

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
    depend = new com.caucho.vfs.Depend(appDir.lookup("addroom.jsp"), -4110919211065146775L, false);
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
  private final static char []_jsp_string3;
  private final static char []_jsp_string6;
  private final static char []_jsp_string0;
  private final static char []_jsp_string5;
  private final static char []_jsp_string4;
  private final static char []_jsp_string2;
  static {
    _jsp_string1 = "<font size=4 face=\"Baskerville Old Face\" color=red>Sorry No field is null. Please Enter valid data in each and every feild</font><br>\r\n	".toCharArray();
    _jsp_string3 = "<font size=4 face=\"Baskerville Old Face\" color=red>Sorry Room Details are not added to Database. Please Check the input values and try again or Contact Administrator</font><br>".toCharArray();
    _jsp_string6 = "\r\n</body>\r\n</html>".toCharArray();
    _jsp_string0 = "\r\n\r\n<html>\r\n<head><TITLE> ROOMALLOCATION SYSTEM - ADD ROOMS </TITLE>\r\n</head>\r\n<body background=\"abc.jpg\" >\r\n".toCharArray();
    _jsp_string5 = "<font size=4 face=\"Baskerville Old Face\" color=red>Please Check the input data again.Each and every field should not exceed maximum and length and should not be Null. (OR) ENABLE JAVASCRIPT OPTION IN YOUR BROWSER. For other details contact Administrator</font><br>".toCharArray();
    _jsp_string4 = "			<font size=4 face=\"Baskerville Old Face\" color=red>RoomNumber is already existed. Choose another RoomNumber and try again</font>\r\n".toCharArray();
    _jsp_string2 = "	<br>\r\n<font size=4 face=\"Baskerville Old Face\" color=green> \r\nRoom details are successfully added to database\r\n</font>".toCharArray();
  }
}
