/*
 * JSP generated by Resin-3.2.0 (built Wed, 06 Aug 2008 08:41:33 PDT)
 */

package _jsp;
import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;
import java.sql.*;

public class _roomChanges__jsp extends com.caucho.jsp.JavaPage
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
    
    String buttonType=null;
	String subButtonType=null;
	String modifyButton=null;
	buttonType=request.getParameter("newButton");
	subButtonType=request.getParameter("roomIdsubmit");
	modifyButton=request.getParameter("modifySubmit");
	//out.println(subButtonType);
	try{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomdatabase","root","crs");
		Statement stmt=con.createStatement();
		Statement stmt1=con.createStatement();
		if(buttonType!=null)
		{
	if(buttonType.equals("ADD ROOM"))
       {
    out.write(_jsp_string1, 0, _jsp_string1.length);
    
		ResultSet rs=stmt.executeQuery("select * from locationtable order by locationName asc");
		String locationID=null,locationName=null;
		while(rs.next())
		   {
			locationID=rs.getString(1);
			locationName=rs.getString(2);
								if(locationName.equals("Electronic City"))
								{
    out.write(_jsp_string2, 0, _jsp_string2.length);
    out.print((locationID));
    out.write(_jsp_string3, 0, _jsp_string3.length);
    out.print((locationName));
    out.write(_jsp_string4, 0, _jsp_string4.length);
    }
								else{
    out.write(_jsp_string2, 0, _jsp_string2.length);
    out.print((locationID));
    out.write('>');
    out.print((locationName));
    out.write(_jsp_string4, 0, _jsp_string4.length);
    }
				} rs.close();
    out.write(_jsp_string5, 0, _jsp_string5.length);
    
	   }
		else if(buttonType.equals("UPDATE ROOM"))
		{
			ResultSet rs=null;
		rs=stmt.executeQuery("select * from room order by roomno asc");
		String roomId=null,roomNo=null;
			
    out.write(_jsp_string6, 0, _jsp_string6.length);
    while(rs.next())
			{
				roomId=rs.getString(1);
				roomNo=rs.getString(2);
				
    out.write(_jsp_string7, 0, _jsp_string7.length);
    out.print((roomId));
    out.write('>');
    out.println(roomNo);
    out.write(_jsp_string8, 0, _jsp_string8.length);
    }
    out.write(_jsp_string9, 0, _jsp_string9.length);
    
		}
		else if(buttonType.equals("ROOMS DETAILS"))
			{
			ResultSet rs=null;
			rs=stmt.executeQuery("select * from room,locationtable where room.location=locationtable.locationId order by roomno");
			if(rs.next()){
    out.write(_jsp_string10, 0, _jsp_string10.length);
    while(rs.next())
				{
				
    out.write(_jsp_string11, 0, _jsp_string11.length);
    out.println(rs.getString(2));
    out.write(_jsp_string12, 0, _jsp_string12.length);
    out.println(rs.getString(11));
    out.write(_jsp_string12, 0, _jsp_string12.length);
    out.println(rs.getString(4));
    out.write(_jsp_string12, 0, _jsp_string12.length);
    out.println(rs.getString(5));
    out.write(_jsp_string12, 0, _jsp_string12.length);
    out.println(rs.getString(6));
    out.write(_jsp_string12, 0, _jsp_string12.length);
    out.println(rs.getString(7));
    out.write(_jsp_string13, 0, _jsp_string13.length);
    }
			}
			else
				{
				out.println("NO ROOMS IN DATABASE");
				}
			}
	}
		
		if(subButtonType!=null)
		{
		ResultSet rs=null;
		rs=stmt.executeQuery("select * from room order by roomno asc");
		
		String roomId=null,roomNo=null;
		String givenID=request.getParameter("room");
		//out.println(givenID);
		
    out.write(_jsp_string14, 0, _jsp_string14.length);
    while(rs.next())
			{
				roomId=rs.getString(1);
				roomNo=rs.getString(2);
				if(givenID.equals(roomId)){
				
    out.write(_jsp_string7, 0, _jsp_string7.length);
    out.print((roomId));
    out.write(_jsp_string3, 0, _jsp_string3.length);
    out.println(roomNo);
    out.write(_jsp_string15, 0, _jsp_string15.length);
    }else{
					
    out.write(_jsp_string7, 0, _jsp_string7.length);
    out.print((roomId));
    out.write('>');
    out.println(roomNo);
    out.write(_jsp_string8, 0, _jsp_string8.length);
    			}
			}
    out.write(_jsp_string16, 0, _jsp_string16.length);
    
				rs.close();
			rs=stmt.executeQuery("select roomID,roomno,location,capacity,cost,floorno,openstatus,locationName from room,locationtable where room.location=locationtable.locationId and roomID='"+givenID+"'");
			if(rs.next()){
    out.write(_jsp_string17, 0, _jsp_string17.length);
    
	   String tableID=rs.getString(1);
			session.setAttribute("TABLEID",tableID);session.setMaxInactiveInterval(36000);
    out.write(_jsp_string18, 0, _jsp_string18.length);
    out.print((rs.getString(2)));
    out.write(_jsp_string19, 0, _jsp_string19.length);
    String loc=rs.getString(3);
			//out.println(loc);
			ResultSet rs1=null;
			rs1=stmt1.executeQuery("select * from locationtable order by locationName");
			while(rs1.next())
				{
				String tempLoc=rs1.getString(2);
				String locId=rs1.getString(1);
				boolean f=loc.equals(locId);
				if(!f)
					{
    out.write(_jsp_string20, 0, _jsp_string20.length);
    out.print((locId));
    out.write('>');
    out.print((tempLoc));
    out.write(_jsp_string21, 0, _jsp_string21.length);
    }
				else
					{
    out.write(_jsp_string20, 0, _jsp_string20.length);
    out.print((locId));
    out.write(_jsp_string3, 0, _jsp_string3.length);
    out.print((tempLoc));
    out.write(_jsp_string21, 0, _jsp_string21.length);
    }
				}
				
    out.write(_jsp_string22, 0, _jsp_string22.length);
    out.print((rs.getString(4)));
    out.write(_jsp_string23, 0, _jsp_string23.length);
    out.print((rs.getString(5)));
    out.write(_jsp_string24, 0, _jsp_string24.length);
    out.print((rs.getString(6)));
    out.write(_jsp_string25, 0, _jsp_string25.length);
    String stat=rs.getString(7);
								if(stat.equals("OPEN"))
									{
    out.write(_jsp_string26, 0, _jsp_string26.length);
    }
								else
									{
									
    out.write(_jsp_string27, 0, _jsp_string27.length);
    }
    out.write(_jsp_string28, 0, _jsp_string28.length);
    }
			else
			{
    out.write(_jsp_string29, 0, _jsp_string29.length);
    
			}}
			if(modifyButton!=null)
			{
				String roomno=null,locations=null,capacity=null,cost=null,floorno=null,address=null,openstatus=null,tableID=null;
				roomno=request.getParameter("roomno");
				locations=request.getParameter("locations");
				capacity=request.getParameter("capacity");
				cost=request.getParameter("cost");
				floorno=request.getParameter("floorno");
			//	address=request.getParameter("address");
				openstatus=request.getParameter("openstatus");
				tableID=(String)session.getAttribute("TABLEID");
				session.removeAttribute("TABLEID");
//				out.println(roomno);
				ResultSet rs=null;
			String guest=(String)session.getAttribute("USERID");
	//		out.println((String)session.getAttribute("USERID"));
			int re=0;
			re=stmt.executeUpdate("update room set roomno='"+roomno+"',location='"+locations+"',capacity='"+capacity+"',cost='"+cost+"',floorno='"+floorno+"',openstatus='"+openstatus+"',lastUpdatedUser='"+guest+"' where roomID='"+tableID+"'");
			if(re==1)
				{
		
    out.write(_jsp_string30, 0, _jsp_string30.length);
    }
		else
		{
			
    out.write(_jsp_string31, 0, _jsp_string31.length);
    
		}
	}
	}
	catch(Exception e)
	{
		 //out.println(e.toString());

    out.write(_jsp_string32, 0, _jsp_string32.length);
    

	}
		
    out.write(_jsp_string33, 0, _jsp_string33.length);
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
    depend = new com.caucho.vfs.Depend(appDir.lookup("roomChanges.jsp"), -9039503485379807630L, false);
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

  private final static char []_jsp_string18;
  private final static char []_jsp_string14;
  private final static char []_jsp_string27;
  private final static char []_jsp_string9;
  private final static char []_jsp_string17;
  private final static char []_jsp_string1;
  private final static char []_jsp_string10;
  private final static char []_jsp_string16;
  private final static char []_jsp_string7;
  private final static char []_jsp_string29;
  private final static char []_jsp_string32;
  private final static char []_jsp_string8;
  private final static char []_jsp_string15;
  private final static char []_jsp_string24;
  private final static char []_jsp_string25;
  private final static char []_jsp_string2;
  private final static char []_jsp_string13;
  private final static char []_jsp_string3;
  private final static char []_jsp_string33;
  private final static char []_jsp_string6;
  private final static char []_jsp_string22;
  private final static char []_jsp_string26;
  private final static char []_jsp_string4;
  private final static char []_jsp_string30;
  private final static char []_jsp_string19;
  private final static char []_jsp_string12;
  private final static char []_jsp_string11;
  private final static char []_jsp_string20;
  private final static char []_jsp_string0;
  private final static char []_jsp_string23;
  private final static char []_jsp_string31;
  private final static char []_jsp_string21;
  private final static char []_jsp_string28;
  private final static char []_jsp_string5;
  static {
    _jsp_string18 = "\r\n	   <tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Room Number<font size=4 face=\"Baskerville Old Face\" color=red>*</font></font></td><td><input type=\"text\" name=\"roomno\" size=15 value=".toCharArray();
    _jsp_string14 = "		\r\n		<form method=\"post\" action=\"roomChanges.jsp\">\r\n			<div align=left><font size=4 face=\"Baskerville Old Face\" color=blue>Select room			\r\n\r\n			<select name=\"room\">\r\n			<option value=\"ROOMID\">roomNo</option>\r\n			".toCharArray();
    _jsp_string27 = "\r\n									<option value=\"OPEN\">OPEN</option>\r\n									<option value=\"CLOSED\" selected>CLOSED</option>\r\n									<option value=\"status\">Status</option>\r\n									".toCharArray();
    _jsp_string9 = "\r\n			</select>\r\n			<input type=submit name=\"roomIdsubmit\" value=\"SubmitID\">\r\n			</form>\r\n			".toCharArray();
    _jsp_string17 = "\r\n		\r\n			<form name='form1' method=\"post\" onsubmit='return formValidator(this)' action=\"roomChanges.jsp\">\r\n			<center>\r\n	   <fieldset>\r\n		<legend align=\"left\"><font size=4 face=\"Baskerville Old Face\" color=blue><b>Modify Room Details</b></font></legend>\r\n	   <table border=0>\r\n	   ".toCharArray();
    _jsp_string1 = "\r\n	   <center>\r\n	   <form name='form1' method=\"post\" onsubmit='return formValidator(this)' action=\"addroom.jsp\">\r\n	   <fieldset>\r\n		<legend align=\"left\"><font size=4 face=\"Baskerville Old Face\" color=blue><b>Room Details</b></font></legend>\r\n	   <table border=0>\r\n	   <tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Room Number<font size=4 face=\"Baskerville Old Face\" color=red>*</font></font></td><td><input type=\"text\" name=\"roomno\" size=15 id=\"roomno\"></td></tr>\r\n	   <tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Location<font size=4 face=\"Baskerville Old Face\" color=red>*</font></font></td><td><select name=\"locations\" id=\"locations\">\r\n								<option value=\"locations\">Locations</option>\r\n						".toCharArray();
    _jsp_string10 = "\r\n			<table border=1><tr bgcolor=FireBrick align=center><td></td><td><font size=4 face=\"Baskerville Old Face\" color=black>Location</font></td><td><font size=4 face=\"Baskerville Old Face\" color=black>Capacity</font></td><td><font size=4 face=\"Baskerville Old Face\" color=black>Cost</font></td><td><font size=4 face=\"Baskerville Old Face\" color=black>Floorno</font></td><td><font size=4 face=\"Baskerville Old Face\" color=black>Status</font></td></tr>\r\n			".toCharArray();
    _jsp_string16 = "\r\n			</select>\r\n			<input type=submit name=\"roomIdsubmit\" value=\"submitID\">\r\n			</form>\r\n			".toCharArray();
    _jsp_string7 = "<option value=".toCharArray();
    _jsp_string29 = "\r\n				<font size=5 face=\"Baskerville Old Face\" color=red>Room not existed. Please select Valid ROOM NUMBER</font>			\r\n			".toCharArray();
    _jsp_string32 = "<font size=4 face=\"Baskerville Old Face\" color=red>Sorry Problem with the database. TRY AGAIN AFTER SOMETIME . For other details contact Administrator</font><br>".toCharArray();
    _jsp_string8 = "</option>\r\n			".toCharArray();
    _jsp_string15 = "</option>\r\n				".toCharArray();
    _jsp_string24 = " id=\"cost\"></td></tr>\r\n		<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Floor Number<font size=4 face=\"Baskerville Old Face\" color=red>*</font></font></td><td><input type=\"text\" name=\"floorno\" size=15 value=".toCharArray();
    _jsp_string25 = " id=\"floorno\"></td></tr>\r\n\r\n		\r\n		<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Open Status<font size=4 face=\"Baskerville Old Face\" color=red>*</font></font></td><td><select name=\"openstatus\" id=\"openstatus\">\r\n							\r\n							".toCharArray();
    _jsp_string2 = "\r\n								<option value=".toCharArray();
    _jsp_string13 = "</font></td></tr>\r\n				".toCharArray();
    _jsp_string3 = " selected>".toCharArray();
    _jsp_string33 = "\r\n		   \r\n</body>\r\n</html>\r\n\r\n\r\n".toCharArray();
    _jsp_string6 = "<form method=\"post\" action=\"roomChanges.jsp\">\r\n			<div align=left><font size=4 face=\"Baskerville Old Face\" color=blue>Select Room	Number		\r\n		\r\n			<select name=\"room\">\r\n			<option value=\"ROOMID\">roomNo</option>\r\n			".toCharArray();
    _jsp_string22 = "\r\n\r\n			\r\n\r\n								</select></td></tr>\r\n		<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Capacity<font size=4 face=\"Baskerville Old Face\" color=red>*</font></font></td><td><input type=\"text\" name=\"capacity\" size=15 value=".toCharArray();
    _jsp_string26 = "\r\n									<option value=\"OPEN\" selected>OPEN</option>\r\n									<option value=\"CLOSED\">CLOSED</option>\r\n									<option value=\"status\">Status</option>\r\n									".toCharArray();
    _jsp_string4 = "</option>\r\n								".toCharArray();
    _jsp_string30 = "<font size=4 face=\"Baskerville Old Face\" color=blue>Room details successfully modified in Database</font>		\r\n		".toCharArray();
    _jsp_string19 = " id=\"roomno\"></td></tr>\r\n	   <tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Location<font size=4 face=\"Baskerville Old Face\" color=red>*</font></font></td><td><select name=\"locations\" id=\"locations\">\r\n	   <option value=\"locations\">Locations</option>\r\n	   ".toCharArray();
    _jsp_string12 = "</font></td><td bgcolor=PowderBlue><font size=4 face=\"Baskerville Old Face\" color=black>".toCharArray();
    _jsp_string11 = "<tr align=center><td bgcolor=FireBrick><font size=4 face=\"Baskerville Old Face\" color=black>".toCharArray();
    _jsp_string20 = "\r\n					<option value=".toCharArray();
    _jsp_string0 = "\r\n<html>\r\n<head>  <TITLE>  ROOM ALLOCATION SYSTEM </TITLE>\r\n<script type=\"text/javascript\">\r\n  function formValidator(Form1){\r\n              var elem,helperMsg; \r\n	var roomno = document.getElementById('roomno');\r\n        var locations = document.getElementById('locations');\r\n	var capacity = document.getElementById('capacity'); \r\n	var cost=document.getElementById('cost');\r\n		var floorno=document.getElementById('floorno');\r\n			//var address=document.getElementById('address');\r\n				var openstatus=document.getElementById('openstatus');\r\n				var x=(Form1.locations.value);\r\n				if(validRoomno(roomno,\"please enter valid roomno\"))\r\n				{\r\n				if(validLocation(locations,\"Please select Location\"))\r\n				{\r\n				if(validNumber(capacity,\"Please Enter valid Data\"))\r\n				{\r\n				if(validNumber(cost,\"Please Enter valid data\"))\r\n				{\r\n				if(validNumber(floorno,\"Please Enter valid data\"))\r\n				{\r\n			//	if(validAddress(address,\"Please Enter valid address\"))\r\n			//	{\r\n				if(validStatus(openstatus,\"Please select status\"))\r\n				{\r\n				return true;\r\n				}\r\n				}\r\n				}\r\n				//}\r\n				}\r\n				}\r\n				}\r\n				return false;\r\n				}\r\n				function validStatus(elem,helperMsg)\r\n				{\r\n				if(elem.value=='status')\r\n				{\r\n				alert(helperMsg);\r\n				elem.focus();\r\n				return false;\r\n				}\r\n				return true;\r\n				}\r\n\r\n				function validLocation(elem,helperMsg)\r\n				{\r\n				if(elem.value=='locations')\r\n				{\r\n				alert(helperMsg);\r\n				elem.focus();\r\n				return false;\r\n				}\r\n				return true;\r\n				}\r\n				function validAddress(elem,helperMsg)\r\n				{\r\n				  if(elem.value==\"\"||elem.value=='null' || elem.value.length>150)\r\n				   {\r\n						// alert('Please Enter data in The Required field (SHOULD NOT BE NULL AND MAXIMUM 150 CHARACTERS)');\r\n						//elem.focus();\r\n						return true;\r\n					}\r\n					return true;\r\n					}\r\n\r\n				function validNumber(elem,helperMsg)\r\n				{\r\n				 var alphaExp = /^[0-9]+$/;\r\n        if(elem.value==\"\"||elem.value=='null' || elem.value.length>10)\r\n        {\r\n            alert('Please Enter data in The Required field (SHOULD NOT BE NULL AND MAXIMUM 9 CHARACTERS)');\r\n		elem.focus();\r\n		return false;\r\n	}\r\n	if(elem.value.match(alphaExp)){\r\n		return true;\r\n	}else{\r\n		alert(helperMsg);\r\n		elem.focus();\r\n		return false;\r\n	}\r\n	}\r\n				function validLocations(elem,helperMsg)\r\n			 {\r\n			 if(elem.value==-1)\r\n			 {\r\n			 alert(helperMsg);\r\n			 elem.focus();\r\n			 return false;\r\n			 }\r\n			 return true;\r\n			 }\r\n				function validRoomno(elem,helperMsg)\r\n				{\r\n				var alphaExp = /^[a-zA-Z0-9]+$/;\r\n        if(elem.value==\"\"||elem.value=='null' || elem.value.length>10)\r\n        {\r\n            alert('Please Enter data in The Required field (SHOULD NOT BE NULL AND MAXIMUM 10 CHARACTERS) and ONLY [a-zA-Z0-9] ARE ALLOWED');\r\n		elem.focus();\r\n		return false;\r\n	}\r\n	if(elem.value.match(alphaExp)){\r\n		return true;\r\n	}else{\r\n		alert(helperMsg);\r\n		elem.focus();\r\n		return false;\r\n	}\r\n	}\r\n				\r\n\r\n	</script>\r\n</head>\r\n<body background=abc.jpg>\r\n<div align=\"center\">\r\n<table cellpadding=5 cellspacing=5>\r\n<tr>\r\n<td>\r\n<form method=\"post\" action=\"roomChanges.jsp\">\r\n<input type=\"submit\" name=\"newButton\" value=\"ADD ROOM\">\r\n</form>\r\n</td>\r\n<td>\r\n<form method=\"post\" action=\"roomChanges.jsp\">\r\n<input type=\"submit\" name=\"newButton\" value=\"UPDATE ROOM\">\r\n</form>\r\n</td>\r\n<td>\r\n<form method=\"post\" action=\"roomChanges.jsp\">\r\n<input type=\"submit\" name=\"newButton\" value=\"ROOMS DETAILS\">\r\n</form>\r\n</td>\r\n</tr>\r\n</table>\r\n".toCharArray();
    _jsp_string23 = " id=\"capacity\"></td></tr>\r\n		<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Cost<font size=4 face=\"Baskerville Old Face\" color=red>*</font></font></td><td><input type=\"text\" name=\"cost\" size=15 value=".toCharArray();
    _jsp_string31 = "<font size=4 face=\"Baskerville Old Face\" color=blue>Modified details are not updated successfully. Their is problem with modified details.</font>".toCharArray();
    _jsp_string21 = "</option>\r\n					".toCharArray();
    _jsp_string28 = "									\r\n									</select></td></tr>\r\n		</table>\r\n		</fieldset>\r\n		<input type=\"submit\" name=\"modifySubmit\" value=\"Modify Details\">\r\n		</form>\r\n		(<font size=4 face=\"Baskerville Old Face\" color=red>*</font>)<font size=4 face=\"Baskerville Old Face\" color=blue>-- Fields are Mandatory </font>\r\n			".toCharArray();
    _jsp_string5 = "\r\n								\r\n								</select></td></tr>\r\n		<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Capacity<font size=4 face=\"Baskerville Old Face\" color=red>*</font></font></td><td><input type=\"text\" name=\"capacity\" size=15 id=\"capacity\"></td></tr>\r\n		<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Cost<font size=4 face=\"Baskerville Old Face\" color=red>*</font></font></td><td><input type=\"text\" name=\"cost\" size=15 id=\"cost\" value=1></td></tr>\r\n		<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Floor Number<font size=4 face=\"Baskerville Old Face\" color=red>*</font></font></td><td><input type=\"text\" name=\"floorno\" size=15 id=\"floorno\"></td></tr>\r\n		<tr><td><font size=4 face=\"Baskerville Old Face\" color=blue>Open Status<font size=4 face=\"Baskerville Old Face\" color=red>*</font></font></td><td><select name=\"openstatus\" id=\"openstatus\">\r\n									<option value=\"status\" selected>Status</option>\r\n									<option value=\"OPEN\">OPEN</option>\r\n									<option value=\"CLOSED\">CLOSED</option>\r\n									</select></td></tr>\r\n		</table>\r\n		</fieldset>\r\n		<input type=\"submit\" name=\"submit\" value=\"Submit Details\">\r\n		</form>\r\n		(<font size=4 face=\"Baskerville Old Face\" color=red>*</font>)--<font size=4 face=\"Baskerville Old Face\" color=blue>-- Fields are Mandatory</font>\r\n		".toCharArray();
  }
}
