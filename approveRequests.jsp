<%@ page language="java" contentType="text/html" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html">
    <title>Your page title</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
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
		String user=(String)session.getAttribute("USERID");
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
   
    var mydata = [ 
    <%  
    s1.executeQuery ("select * from requestroom,user where (requestroom.userID=user.userID and requestroom.userID<>'"+user+"') order by requestID desc");
    ResultSet rs1 = s1.getResultSet();
    while (rs1!=null && rs1.next()) 
    { 
		String requeststatus=null;
		requeststatus=rs1.getString("requestStatus");
		
		String loginid=null;
		loginid=rs1.getString(20);
					
		String dateofrequest=null;
		dateofrequest=rs1.getString(14);
					
		String title=null;
		title=rs1.getString(10);
		
		String capacity=null;
		capacity=rs1.getString(8);
		
		String requesttype=null;
		requesttype=rs1.getString(11);
														
		int requestID=0;
		requestID=rs1.getInt("requestID");
						
		%>{
       RequestID:<%=rs1.getInt("requestID")%>,
       RequestedUser:"<%=loginid%>",
       DateofRequest:"<%=dateofrequest%>",
		 Status:"<%=requeststatus%>",
		 Title:"<%=title%>",
		  RequestedCapacity:"<%=capacity%>",
		  RequestType:"<%=requesttype%>"},
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
    <%s3.executeQuery ("select count(distinct capacity) from requestroom,user where (requestroom.userID=user.userID and requestroom.userID<>'"+user+"') order by capacity asc");
   ResultSet rs10 = s3.getResultSet();
   rs10.next();
   int cap_count = Integer.parseInt( rs10.getString(1)); %>
    <%s2.executeQuery ("select distinct capacity from requestroom,user where (requestroom.userID=user.userID and requestroom.userID<>'"+user+"') order by capacity asc");
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
   
   <%s4.executeQuery ("select count(distinct recurringType) from requestroom,user where (requestroom.userID=user.userID and requestroom.userID<>'"+user+"') order by recurringType asc");
   ResultSet rs_req_type_count = s4.getResultSet();
   rs_req_type_count.next();
   int req_type_count = Integer.parseInt( rs_req_type_count.getString(1)); %>
    <%s5.executeQuery ("select distinct recurringType from requestroom,user where (requestroom.userID=user.userID and requestroom.userID<>'"+user+"') order by recurringType asc");
   ResultSet rs_req_type = s5.getResultSet();
   //rs11.next();
   p=0;
   String[] sample_req_type = new String[100];
   String test_req_type =":All;";
	while(rs_req_type.next())
	{
		sample_req_type[p] = rs_req_type.getString(1);
		 test_req_type += rs_req_type.getString(1);
		 test_req_type += ":";
		 test_req_type += sample_req_type[p];
		 if (p != req_type_count - 1)
			test_req_type += ";";
		p++;
   }
   %>
   
   <%s6.executeQuery ("select count(distinct requesttitle) from requestroom,user where (requestroom.userID=user.userID and requestroom.userID<>'"+user+"') order by requesttitle asc");
   ResultSet rs_title_count = s6.getResultSet();
   rs_title_count.next();
   int title_count = Integer.parseInt( rs_title_count.getString(1)); %>
    <%s7.executeQuery ("select distinct requesttitle from requestroom,user where (requestroom.userID=user.userID and requestroom.userID<>'"+user+"') order by requesttitle asc");
   ResultSet rs_title = s7.getResultSet();
   //rs11.next();
   p=0;
   String[] sample_title = new String[100];
   String test_title =":All;";
	while(rs_title.next())
	{
		sample_title[p] = rs_title.getString(1);
		 test_title += rs_title.getString(1);
		 test_title += ":";
		 test_title += sample_title[p];
		 if (p != title_count - 1)
			test_title += ";";
		p++;
   }
   %>
   
    <%s8.executeQuery ("select count(distinct requestStatus) from requestroom,user where (requestroom.userID=user.userID and requestroom.userID<>'"+user+"') order by requestStatus asc");
   ResultSet rs_status_count = s8.getResultSet();
   rs_status_count.next();
   int status_count = Integer.parseInt( rs_status_count.getString(1)); %>
    <%s9.executeQuery ("select distinct requestStatus from requestroom,user where (requestroom.userID=user.userID and requestroom.userID<>'"+user+"') order by requestStatus asc");
   ResultSet rs_status = s9.getResultSet();
   //rs11.next();
   p=0;
   String[] sample_status = new String[100];
   String test_status =":All;";
	while(rs_status.next())
	{
		sample_status[p] = rs_status.getString(1);
		 test_status += rs_status.getString(1);
		 test_status += ":";
		 test_status += sample_status[p];
		 if (p != status_count - 1)
			test_status += ";";
		p++;
   }
   %>
   
   <%s10.executeQuery ("select count(distinct loginID) from requestroom,user where (requestroom.userID=user.userID and requestroom.userID<>'"+user+"') order by loginID asc");
   ResultSet rs_user_count = s10.getResultSet();
   rs_user_count.next();
   int user_count = Integer.parseInt( rs_user_count.getString(1)); %>
    <%s11.executeQuery ("select distinct loginID from requestroom,user where (requestroom.userID=user.userID and requestroom.userID<>'"+user+"') order by loginID asc");
   ResultSet rs_user = s11.getResultSet();
   //rs11.next();
   p=0;
   String[] sample_user = new String[100];
   String test_user =":All;";
	while(rs_user.next())
	{
		sample_user[p] = rs_user.getString(1);
		 test_user += rs_user.getString(1);
		 test_user += ":";
		 test_user += sample_user[p];
		 if (p != user_count - 1)
			test_user += ";";
		p++;
   }
   %>
   
   <%s12.executeQuery ("select count(distinct requestID) from requestroom,user where (requestroom.userID=user.userID and requestroom.userID<>'"+user+"') order by requestID asc");
   ResultSet rs_request_id_count = s12.getResultSet();
   rs_request_id_count.next();
   int request_id_count = Integer.parseInt( rs_request_id_count.getString(1)); %>
    <%s13.executeQuery ("select distinct requestID from requestroom,user where (requestroom.userID=user.userID and requestroom.userID<>'"+user+"') order by requestID asc");
   ResultSet rs_request_id = s13.getResultSet();
   //rs11.next();
   p=0;
   String[] sample_request_id = new String[100];
   String test_request_id =":All;";
	while(rs_request_id.next())
	{
		sample_request_id[p] = rs_request_id.getString(1);
		 test_request_id += rs_request_id.getString(1);
		 test_request_id += ":";
		 test_request_id += sample_request_id[p];
		 if (p != request_id_count - 1)
			test_request_id += ";";
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
       colNames:['RequestID','Requested User', 'Date of Request', 'Status','Title','Requested Capacity','Request Type'],
       colModel:[
           {name:'RequestID',index:'RequestID',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_request_id%>"
			}, width:62,align:"right",editable:true,key: true, 
             formatter:'showlink', 
             formatoptions: { baseLinkUrl: 'individualRequest.jsp'}},
           {name:'RequestedUser',index:'RequestedUser',editable:true,formatter: 'select',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_user%>"
			},align:"right", width:110},
           {name:'DateofRequest',index:'DateofRequest',editable:true, width:110,sorttype:"int"},
           {name:'Status',index:'Status',editable:true,formatter: 'select',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_status%>"
			}, width:80, align:"right"},
           {name:'Title',index:'Title',editable:true,formatter: 'select',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_title%>"
			}, width:120, align:"right"},        
           {name:'RequestedCapacity',index:'RequestedCapacity',editable:true,
													formatter: 'select',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test%>"
			}, width:110,align:"right"},        
           {name:'RequestType',index:'RequestType',editable:true,formatter: 'select',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_req_type%>"
			},align:"right", width:70}
			           
       ],
        //colModel: [{ name: 'Site_Name', index: 'Site_Name', width: 130,editable: false, sortable: false,formatter: 'showlink', formatoptions: { baseLinkUrl: 'javascript:', showAction: "Link('", addParam: "');"} },
          //  { name: 'Details', index: 'Details', width: 400, editable: false, sortable: false }], value:":All;0.00:0.00;12:12.00;20:20.00;40:40.00;60:60.00;120:120.00"

       //http://172.16.82.84:8080/Roomtest/individualRequest.jsp?257
       sortname: 'RequestID',
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
</head>
<BODY background=abc.jpg>
<MARQUEE DIRECTION=LEFT> <font size=5 face="Baskerville Old Face" color=red>Refresh the page to view Latest Database Updates</font></marquee>
				<table id="list">
				</table>
		
				<div id="pager"></div>
				
</body>
</html>
