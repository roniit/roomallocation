<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>  ROOM ALLOCATION SYSTEM </TITLE>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/themes/redmond/jquery-ui.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.14.1/css/ui.jqgrid.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/jquery-ui.min.js"></script>
    <script type="text/javascript" src="http://www.ok-soft-gmbh.com/jqGrid/jquery.jqGrid-3.8.2/js/i18n/grid.locale-en.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.14.1/jquery.jqgrid.min.js"></script>
    <style type="text/css">
        .ui-jqgrid tr.jqgrow td {
            word-wrap: break-word; /* IE 5.5+ CSS3 see http://www.w3.org/TR/css3-text/#text-wrap */
            white-space: pre-wrap; /* CSS3 */
            white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
            white-space: -pre-wrap; /* Opera 4-6 */
            white-space: -o-pre-wrap; /* Opera 7 */
            overflow: hidden;
            height: auto;
            vertical-align: middle;
            padding-top: 3px;
            padding-bottom: 3px
        }
    </style>

    <script type="text/javascript">
    //<![CDATA[
  
    
    
   <% 
   Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomdatabase","root","123");
		
		
		Statement s = conn.createStatement();
		Statement s1 = conn.createStatement();
		Statement s2 = conn.createStatement();
		Statement s3 = conn.createStatement();
		Statement s4 = conn.createStatement();
		Statement s5 = conn.createStatement();
		Statement s6 = conn.createStatement();
		Statement s7 = conn.createStatement();
		Statement s8 = conn.createStatement();
		Statement s9 = conn.createStatement();
		Statement s10 = conn.createStatement();
		Statement s11 = conn.createStatement();
		Statement s12 = conn.createStatement();
		Statement s13 = conn.createStatement();
		Statement s21 = conn.createStatement();
		Statement stmt = conn.createStatement();
		Statement stmt2 = conn.createStatement();
		String user=(String)session.getAttribute("USERID");
		 String userid=null,username=null;
		 userid=(String)session.getAttribute("USERID");
		 username=(String)session.getAttribute("USERNAME");
		  
		
		//String user="9";
		//String getValue = request.getParameter("action");
		//out.println(user);
		//if(getValue.equals("comboSID"))
		//{
			//s2.executeQuery ("select distinct capacity from requestroom,user where (requestroom.userID=user.userID and requestroom.userID<>'"+user+"') order by requestID desc"); //returns 2D array
			//ResultSet rs5 = s2.getResultSet();
			//StringBuffer strBuf = new StringBuffer();
			//strBuf.append("<select>");
			//while(rs5.next())
			//{
				//strBuf.append("<option>");
				//strBuf.append(rs5.getString(1));
				//strBuf.append("</option>");
			//}
			//strBuf.append("</select>");
			//out.println(strBuf);
		//}
   s.executeQuery ("select * from requestroom,user where (requestroom.userID=user.userID and requestroom.userID<>'"+user+"') order by requestID desc");
   ResultSet rs = s.getResultSet();
   System.out.println(user);
   System.out.println("YOYYYYYYYYYYYYYYYYYYYYYYYY");
   
   int count = 0;
   while (rs.next())
   {
       int idVal = rs.getInt("userID");
       String nameVal = rs.getString("loginID");
       String catVal = rs.getString("capacity");
       System.out.println (
               "id = " + idVal
               + ", name = " + nameVal
               + ", category = " + catVal);
       ++count;
   }
   
   //System.out.println (count + " rows were retrieved"); 
   %>
   <% 
		
   
   %>
    var mydata = [ 
    <%  
    s1.executeQuery ("select * from requestroom,user where (user.userID=requestroom.userID and user.userID='"+userid+"') order by requestroom.requestTime desc");
    ResultSet rs1 = s1.getResultSet();
    String[]  names = new String[100];
    int name_count= 0;			
    while (rs1!=null && rs1.next()) 
    { 
		String requestID=null;
		requestID=rs1.getString("requestID");
		
		String requestTime=null;
		requestTime=rs1.getString("requestTime");
					
		String requestStatus=null;
		requestStatus=rs1.getString("requestStatus");
					
		String requesttitle=null;
		requesttitle=rs1.getString("requesttitle");
		
		String capacity=null;
		capacity=rs1.getString("capacity");
		
		String recurringType=null;
		recurringType=rs1.getString("recurringType");
		
		
		String statchange=null;
		String userrequested = null;
		String userupdated = null;
		
		userrequested=rs1.getString(2);
		userupdated=rs1.getString(17);
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
		String lastUpdatedUser=null;
		lastUpdatedUser=statchange;
		names[name_count] = statchange;
		name_count++;
		%>{
       requestID:"<%=requestID%>",
       requestTime:"<%=requestTime%>",
       requestStatus:"<%=requestStatus%>",
		 requesttitle:"<%=requesttitle%>",
		  capacity:"<%=capacity%>",
		  recurringType:"<%=recurringType%>",
		  lastUpdatedUser:"<%=lastUpdatedUser%>",
		 },
		<%
     } 
     %>
    ];
    
    <% 
    rs.close();
		s.close();
		%>
      //var mydata = [
        //{id:"1",invdate:"2010-05-24",name:"test",note:"note",tax:"10.00",total:"2111.00"} ,
        //{id:"2",invdate:"2010-05-25",name:"test2",note:"note2",tax:"20.00",total:"320.00"},
        //{id:"3",invdate:"2007-09-01",name:"test3",note:"note3",tax:"30.00",total:"430.00"},
        //{id:"4",invdate:"2007-10-04",name:"blah",note:"stuff",tax:"10.00",total:"210.00"},
        
    //];
    <%int tmp = 2;%>
    <%s3.executeQuery ("select count(distinct requestID) from requestroom,user where (user.userID=requestroom.userID and user.userID='"+userid+"') order by requestroom.requestTime desc");
   ResultSet rs10 = s3.getResultSet();
   rs10.next();
   int cap_count = Integer.parseInt( rs10.getString(1)); %>
    <%s2.executeQuery ("select distinct requestID from requestroom,user where (user.userID=requestroom.userID and user.userID='"+userid+"') order by requestroom.requestTime desc");
   ResultSet rs11 = s2.getResultSet();
   //rs11.next();
   int p=0;
   String[] sample2 = new String[100];
   String test =":All;";
	while(rs11.next())
	{
		sample2[p] = rs11.getString(1);
		 test += rs11.getString(1);
		 test += ":";
		 test += sample2[p];
		 if (p != cap_count - 1)
			test += ";";
		p++;
   }
   %>
   
   <%s4.executeQuery ("select count(distinct requestTime) from requestroom,user where (user.userID=requestroom.userID and user.userID='"+userid+"') order by requestroom.requestTime desc");
   ResultSet rs_requestTime_count = s4.getResultSet();
   rs_requestTime_count.next();
   int requestTime_count = Integer.parseInt( rs_requestTime_count.getString(1)); %>
    <%s5.executeQuery ("select distinct requestTime from requestroom,user where (user.userID=requestroom.userID and user.userID='"+userid+"') order by requestroom.requestTime desc");
   ResultSet rs_requestTime = s5.getResultSet();
   //rs11.next();
   p=0;
   String[] sample_requestTime = new String[100];
   String test_requestTime =":All;";
	while(rs_requestTime.next())
	{
		sample_requestTime[p] = rs_requestTime.getString(1);
		 test_requestTime += rs_requestTime.getString(1);
		 test_requestTime += ":";
		 test_requestTime += sample_requestTime[p];
		 if (p != requestTime_count - 1)
			test_requestTime += ";";
		p++;
   }
   %>
   
   <%s6.executeQuery ("select count(distinct requestStatus) from requestroom,user where (user.userID=requestroom.userID and user.userID='"+userid+"') order by requestroom.requestStatus asc");
   ResultSet rs_requestStatus_count = s6.getResultSet();
   rs_requestStatus_count.next();
   int requestStatus_count = Integer.parseInt( rs_requestStatus_count.getString(1)); %>
    <%s7.executeQuery ("select distinct requestStatus from requestroom,user where (user.userID=requestroom.userID and user.userID='"+userid+"') order by requestroom.requestStatus asc");
   ResultSet rs_requestStatus = s7.getResultSet();
   //rs11.next();
   p=0;
   String[] sample_requestStatus = new String[100];
   String test_requestStatus =":All;";
	while(rs_requestStatus.next())
	{
		sample_requestStatus[p] = rs_requestStatus.getString(1);
		 test_requestStatus += rs_requestStatus.getString(1);
		 test_requestStatus += ":";
		 test_requestStatus += sample_requestStatus[p];
		 if (p != requestStatus_count - 1)
			test_requestStatus += ";";
		p++;
   }
   %>
   
    <%s8.executeQuery ("select count(distinct requesttitle) from requestroom,user where (user.userID=requestroom.userID and user.userID='"+userid+"') order by requestroom.requesttitle asc");
   ResultSet rs_requesttitle_count = s8.getResultSet();
   rs_requesttitle_count.next();
   int requesttitle_count = Integer.parseInt( rs_requesttitle_count.getString(1)); %>
    <%s9.executeQuery ("select distinct requesttitle from requestroom,user where (user.userID=requestroom.userID and user.userID='"+userid+"') order by requestroom.requesttitle asc");
   ResultSet rs_requesttitle = s9.getResultSet();
   //rs11.next();
   p=0;
   String[] sample_requesttitle = new String[100];
   String test_requesttitle =":All;";
	while(rs_requesttitle.next())
	{
		sample_requesttitle[p] = rs_requesttitle.getString(1);
		 test_requesttitle += rs_requesttitle.getString(1);
		 test_requesttitle += ":";
		 test_requesttitle += sample_requesttitle[p];
		 if (p != requesttitle_count - 1)
			test_requesttitle += ";";
		p++;
   }
   %>
   
  <%s10.executeQuery ("select count(distinct capacity) from requestroom,user where (user.userID=requestroom.userID and user.userID='"+userid+"') order by requestroom.capacity asc");
   ResultSet rs_capacity_count = s10.getResultSet();
   rs_capacity_count.next();
   int capacity_count = Integer.parseInt( rs_capacity_count.getString(1)); %>
    <%s11.executeQuery ("select distinct capacity from requestroom,user where (user.userID=requestroom.userID and user.userID='"+userid+"') order by requestroom.capacity asc");
   ResultSet rs_capacity = s11.getResultSet();
   //rs11.next();
   p=0;
   String[] sample_capacity = new String[100];
   String test_capacity =":All;";
	while(rs_capacity.next())
	{
		sample_capacity[p] = rs_capacity.getString(1);
		 test_capacity += rs_capacity.getString(1);
		 test_capacity += ":";
		 test_capacity += sample_capacity[p];
		 if (p != capacity_count - 1)
			test_capacity += ";";
		p++;
   }
   %>
   
   <%s12.executeQuery ("select count(distinct recurringType) from requestroom,user where (user.userID=requestroom.userID and user.userID='"+userid+"') order by requestroom.recurringType asc");
   ResultSet rs_recurringType_count = s12.getResultSet();
   rs_recurringType_count.next();
   int recurringType_count = Integer.parseInt( rs_recurringType_count.getString(1)); %>
    <%s13.executeQuery ("select distinct recurringType from requestroom,user where (user.userID=requestroom.userID and user.userID='"+userid+"') order by requestroom.recurringType asc");
   ResultSet rs_recurringType = s13.getResultSet();
   //rs11.next();
   p=0;
   String[] sample_recurringType = new String[100];
   String test_recurringType =":All;";
	while(rs_recurringType.next())
	{
		sample_recurringType[p] = rs_recurringType.getString(1);
		 test_recurringType += rs_recurringType.getString(1);
		 test_recurringType += ":";
		 test_recurringType += sample_recurringType[p];
		 if (p != recurringType_count - 1)
			test_recurringType += ";";
		p++;
   }
   %>
   
   
   
    $(function () {
		$("#list").jqGrid({

    data: mydata,
    datatype: 'local',
    height:"auto",
    rowNum: "auto",
    rowList: [10,20,30],
       colNames:['Request ID','Date Of Request', 'Status', 'Title','Requested Capacity','Request Type','Status Updated by'],
       colModel:[
           {name:'requestID',index:'requestID',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test%>"},key: true, 
             formatter:'showlink', 
             formatoptions: { baseLinkUrl: 'MyindividualRequest.jsp'}
			, width:80,align:"center",editable:true},
           {name:'requestTime',index:'requestTime',editable:true,align:"right", width:110},
           {name:'requestStatus',index:'requestStatus',editable:true,formatter: 'select',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_requestStatus%>"
			}, width:120, align:"right"},
           {name:'requesttitle',index:'requesttitle',editable:true,formatter: 'select',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_requesttitle%>"
			}, width:120, align:"right"},
            {name:'capacity',index:'capacity',editable:true,formatter: 'select',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_capacity%>"
			}, width:120, align:"right"},            
            {name:'recurringType',index:'recurringType',editable:true,formatter: 'select',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_recurringType%>"
			}, width:120, align:"right"},
			{name:'lastUpdatedUser',index:'lastUpdatedUser',editable:true, width:120, align:"right"}     
       ],
        //colModel: [{ name: 'Site_Name', index: 'Site_Name', width: 130,editable: false, sortable: false,formatter: 'showlink', formatoptions: { baseLinkUrl: 'javascript:', showAction: "Link('", addParam: "');"} },
          //  { name: 'Details', index: 'Details', width: 400, editable: false, sortable: false }], value:":All;0.00:0.00;12:12.00;20:20.00;40:40.00;60:60.00;120:120.00"

       //http://172.16.82.84:8080/Roomtest/individualRequest.jsp?257
       sortname: 'requestID',
       //pager: "#pager",
       viewrecords: true,
       autowidth: true,
       height: "auto",
       ignoreCase: true,
       
       //stringResult: true, 
       //searchOnEnter: true,
       //searching: {
       //     defaultSearch: "cn"
        //},
       caption: "Room Requests"
       
}).jqGrid('navGrid',
          { add:false, del:false, search:false, refresh:false});
          
$("#list").jqGrid('filterToolbar',
            {stringResult:true, searchOnEnter:true, defaultSearch:"cn"});          
});


 </script>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">
 </HEAD>

 <BODY background=abc.jpg>
 

<table id="list">
</table>
 </body>
 </html>
