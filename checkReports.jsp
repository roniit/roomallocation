<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
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
  function testroom()
  {
		//alert("Yo");
		document.getElementById("testform").submit();  
  }
  </script>
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
		Statement s23 = conn.createStatement();
		Statement stmt = conn.createStatement();
		String user=(String)session.getAttribute("USERID");
		
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
    s1.executeQuery ("select * from room order by roomno asc");
    ResultSet rs1 = s1.getResultSet();
    while (rs1!=null && rs1.next()) 
    { 
		String roomno=null;
		roomno=rs1.getString("roomno");
		
		String location=null;
		location=rs1.getString("location");
		s23.executeQuery ("select locationName from locationtable where locationId = '"+location+"' order by locationName asc");
		ResultSet rs_location23 = s23.getResultSet();
		rs_location23.next();
		location = 	rs_location23.getString(1);		
		
		String capacity=null;
		capacity=rs1.getString("capacity");
					
		String floorno=null;
		floorno=rs1.getString("floorno");
		
					
		%>{
       roomno:"<%=roomno%>",
       location:"<%=location%>",
       capacity:"<%=capacity%>",
		 floorno:"<%=floorno%>"},
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
    <%s3.executeQuery ("select count(distinct roomno) from room order by roomno asc");
   ResultSet rs10 = s3.getResultSet();
   rs10.next();
   int cap_count = Integer.parseInt( rs10.getString(1)); %>
    <%s2.executeQuery ("select distinct roomno from room order by roomno asc");
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
   //select count(distinct locationName) from room,locationtable where room.location=locationtable.locationId order by locationName
   <%s4.executeQuery ("select count(distinct locationName) from room,locationtable where room.location=locationtable.locationId order by locationName asc");
   ResultSet rs_location_count = s4.getResultSet();
   rs_location_count.next();
   int location_count = Integer.parseInt( rs_location_count.getString(1)); %>
    <%s5.executeQuery ("select distinct locationName from room,locationtable where room.location=locationtable.locationId order by locationName asc");
   ResultSet rs_location = s5.getResultSet();
   //rs11.next();
   p=0;
   String[] sample_location = new String[100];
   String test_location =":All;";
	while(rs_location.next())
	{
		sample_location[p] = rs_location.getString(1);
		 test_location += rs_location.getString(1);
		 test_location += ":";
		 test_location += sample_location[p];
		 if (p != location_count - 1)
			test_location += ";";
		p++;
   }
   %>
   
   <%s6.executeQuery ("select count(distinct capacity) from room order by capacity asc");
   ResultSet rs_capacity_count = s6.getResultSet();
   rs_capacity_count.next();
   int capacity_count = Integer.parseInt( rs_capacity_count.getString(1)); %>
    <%s7.executeQuery ("select distinct capacity from room order by capacity asc");
   ResultSet rs_capacity = s7.getResultSet();
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
   
    <%s8.executeQuery ("select count(distinct floorno) from room order by floorno asc");
   ResultSet rs_floorno_count = s8.getResultSet();
   rs_floorno_count.next();
   int floorno_count = Integer.parseInt( rs_floorno_count.getString(1)); %>
    <%s9.executeQuery ("select distinct floorno from room order by floorno asc");
   ResultSet rs_floorno = s9.getResultSet();
   //rs11.next();
   p=0;
   String[] sample_floorno = new String[100];
   String test_floorno =":All;";
	while(rs_floorno.next())
	{
		sample_floorno[p] = rs_floorno.getString(1);
		 test_floorno += rs_floorno.getString(1);
		 test_floorno += ":";
		 test_floorno += sample_floorno[p];
		 if (p != floorno_count - 1)
			test_floorno += ";";
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
       colNames:['Room No','Location', 'Capacity', 'Floor No'],
       colModel:[
           {name:'roomno',index:'roomno',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test%>"},key: true, 
             formatter:'showlink', 
             formatoptions: { baseLinkUrl: 'checkIndividualReportsFinal.jsp'}
			, width:150,align:"center",editable:true},
           {name:'location',index:'location',editable:true,formatter: 'select',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_location%>"
			},align:"right", width:200},
           {name:'capacity',index:'capacity',editable:true,formatter: 'select',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_capacity%>"
			}, width:150,sorttype:"int", align:"right"},
           {name:'floorno',index:'floorno',editable:true,formatter: 'select',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_floorno%>"
			}, width:150, align:"right"}
                        
                 
       ],
        //colModel: [{ name: 'Site_Name', index: 'Site_Name', width: 130,editable: false, sortable: false,formatter: 'showlink', formatoptions: { baseLinkUrl: 'javascript:', showAction: "Link('", addParam: "');"} },
          //  { name: 'Details', index: 'Details', width: 400, editable: false, sortable: false }], value:":All;0.00:0.00;12:12.00;20:20.00;40:40.00;60:60.00;120:120.00"

       //http://172.16.82.84:8080/Roomtest/individualRequest.jsp?257
       sortname: 'RequestID',
       //pager: "#pager",
       viewrecords: true,
       width: "auto",
       height: "auto",
       ignoreCase: true,
       
       //stringResult: true, 
       //searchOnEnter: true,
       //searching: {
       //     defaultSearch: "cn"
        //},
       caption: "Room Status"
       
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
 
 <center>
 <table id="list">
</table>

</body>
</html>
