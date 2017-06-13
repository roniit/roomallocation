<%@ page import="java.sql.*"%>
<html>
<head>  
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
<script>
    var k=0;
    </script>
<script type="text/javascript">
function formValidator(Form1)
{
	  
	var elem,helperMsg; 
	var roomno = document.getElementById('roomno');
	var locations = document.getElementById('locations');
	var capacity = document.getElementById('capacity'); 
	var cost=document.getElementById('cost');
	var floorno=document.getElementById('floorno');
	//var address=document.getElementById('address');
	var openstatus=document.getElementById('openstatus');
	var x=(Form1.locations.value);
	if(validRoomno(roomno,"please enter valid roomno"))
	{
		if(validLocation(locations,"Please select Location"))
		{
			if(validNumber(capacity,"Please Enter valid Data"))
			{
				if(validNumber(cost,"Please Enter valid data"))
				{
					if(validNumber(floorno,"Please Enter valid data"))
					{
						//	if(validAddress(address,"Please Enter valid address"))
						
						if(validStatus(openstatus,"Please select status"))
						{
							return true;
						}
					}
				}
				
			}
		}
	}
	return false;
}
function validStatus(elem,helperMsg)
{
	if(elem.value=='status')
	{
		alert(helperMsg);
		elem.focus();
		return false;
	}
	return true;
}

function validLocation(elem,helperMsg)
{
	if(elem.value=='locations')
	{
		alert(helperMsg);
		elem.focus();
		return false;
	}
	return true;
}
function validAddress(elem,helperMsg)
{
	if(elem.value==""||elem.value=='null' || elem.value.length>150)
	{
		// alert('Please Enter data in The Required field (SHOULD NOT BE NULL AND MAXIMUM 150 CHARACTERS)');
		//elem.focus();
		return true;
	}
	return true;
}

function validNumber(elem,helperMsg)
{
	var alphaExp = /^[0-9]+$/;
	if(elem.value==""||elem.value=='null' || elem.value.length>10)
	{
		alert('Please Enter data in The Required field (SHOULD NOT BE NULL AND MAXIMUM 9 CHARACTERS)');
		elem.focus();
		return false;
	}
	if(elem.value.match(alphaExp))
	{
		return true;
	}
	else
	{
		alert(helperMsg);
		elem.focus();
		return false;
	}
}
function validLocations(elem,helperMsg)
{
	if(elem.value==-1)
	{
		alert(helperMsg);
		elem.focus();
		return false;
	}
	return true;
}
function validRoomno(elem,helperMsg)
{
	var alphaExp = /^[a-zA-Z0-9]+$/;
	if(elem.value==""||elem.value=='null' || elem.value.length>10)
	{
		alert('Please Enter data in The Required field (SHOULD NOT BE NULL AND MAXIMUM 10 CHARACTERS) and ONLY [a-zA-Z0-9] ARE ALLOWED');
		elem.focus();
		return false;
	}
	if(elem.value.match(alphaExp))
	{
		return true;
	}
	else
	{
		alert(helperMsg);
		elem.focus();
		return false;
	}
}
function confirmdel(k)
{
	//var roomid_no = k;
	//alert(roomid_no);
	var r = confirm("Are you Sure you want to delete this Room ?");
	if(r==false)
	{
		return false;
	}
	else
	{
		return true;
	}
}				

</script>

<script type="text/javascript">
<% 
		String roomID=request.getQueryString();
		String buttonType=null;
		String modifyButton=null;
		buttonType=request.getParameter("newButton");
		modifyButton=request.getParameter("modifySubmit");
		//String deleteicon = null;
		//deleteicon = request.getParameter("action");
		
		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomdatabase","root","123");
		Statement s  = conn.createStatement();
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
		Statement s14 = conn.createStatement();
		Statement s15 = conn.createStatement();
		Statement stmt=conn.createStatement();
		Statement stmt1=conn.createStatement();
		String temp2;
		String temp;
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
   
   
	   //s.executeQuery ("select * from requestroom,user where (requestroom.userID=user.userID and requestroom.userID<>'"+user+"') order by requestID desc");
   s.executeQuery("select * from room,locationtable where room.location=locationtable.locationId order by roomno");
   ResultSet rs = s.getResultSet();
   //System.out.println(user);
   
  
   
   //System.out.println (count + " rows were retrieved"); 
   %>
   
    var mydata = [ 
    <%  
    //s1.executeQuery ("select * from requestroom,user where (requestroom.userID=user.userID and requestroom.userID<>'"+user+"') order by requestID desc");
    s1.executeQuery("select * from room,locationtable where room.location=locationtable.locationId order by roomno");
    ResultSet rs1 = s1.getResultSet();
    while (rs1!=null && rs1.next()) 
    { 
		String roomno=null;
		roomno=rs1.getString("roomno");
		
		String location=null;
		location=rs1.getString("locationName");
					
		String capacity=null;
		capacity=rs1.getString("capacity");
					
		String cost=null;
		cost=rs1.getString("cost");
		
		String floorno=null;
		floorno=rs1.getString("floorno");
		
		String openstatus=null;
		openstatus=rs1.getString("openstatus");
														
						
		%>{
       RoomNo:"<%=roomno%>",
       Location:"<%=location%>",
       Capacity:"<%=capacity%>",
		 Cost:"<%=cost%>",
		 Floorno:"<%=floorno%>",
		  Status:"<%=openstatus%>"
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
    <%s3.executeQuery ("select count(distinct roomno) from room,locationtable where room.location=locationtable.locationId order by roomno");
   ResultSet rs10 = s3.getResultSet();
   rs10.next();
   int room_count = Integer.parseInt( rs10.getString(1)); %>
    <%s2.executeQuery ("select distinct roomno from room,locationtable where room.location=locationtable.locationId order by roomno");
   ResultSet rs11 = s2.getResultSet();
   //rs11.next();
   int p=0;
   String[] sample2 = new String[100];
   String test_room =":All;";
	while(rs11.next())
	{
		sample2[p] = rs11.getString(1);
		 test_room += rs11.getString(1);
		 test_room += ":";
		 test_room += sample2[p];
		 if (p != room_count - 1)
			test_room += ";";
		p++;
   }
   %>
   
   <%s4.executeQuery ("select count(distinct locationName) from room,locationtable where room.location=locationtable.locationId order by locationName");
   ResultSet rs_location_count = s4.getResultSet();
   rs_location_count.next();
   int location_count = Integer.parseInt( rs_location_count.getString(1)); %>
   <%s5.executeQuery ("select distinct locationName from room,locationtable where room.location=locationtable.locationId order by locationName");
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
   
   <%s6.executeQuery ("select count(distinct capacity) from room,locationtable where room.location=locationtable.locationId order by capacity");
   ResultSet rs_capacity_count = s6.getResultSet();
   rs_capacity_count.next();
   int capacity_count = Integer.parseInt( rs_capacity_count.getString(1)); %>
   <%s7.executeQuery ("select distinct capacity from room,locationtable where room.location=locationtable.locationId order by capacity");
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
   
   
   
   <%s10.executeQuery ("select count(distinct cost) from room,locationtable where room.location=locationtable.locationId order by cost");
   ResultSet rs_cost_count = s10.getResultSet();
   rs_cost_count.next();
   int cost_count = Integer.parseInt( rs_cost_count.getString(1)); %>
   <%s11.executeQuery ("select distinct cost from room,locationtable where room.location=locationtable.locationId order by cost");
   ResultSet rs_cost = s11.getResultSet();
   //rs11.next();
   p=0;
   String[] sample_cost = new String[100];
   String test_cost =":All;";
	while(rs_cost.next())
	{
		sample_cost[p] = rs_cost.getString(1);
		 test_cost += rs_cost.getString(1);
		 test_cost += ":";
		 test_cost += sample_cost[p];
		 if (p != cost_count - 1)
			test_cost += ";";
		p++;
   }
   %>
   
   <%s12.executeQuery ("select count(distinct floorno) from room,locationtable where room.location=locationtable.locationId order by floorno");
   ResultSet rs_floorno_count = s12.getResultSet();
   rs_floorno_count.next();
   int floorno_count = Integer.parseInt( rs_floorno_count.getString(1)); %>
   <%s13.executeQuery ("select distinct floorno from room,locationtable where room.location=locationtable.locationId order by floorno");
   ResultSet rs_floorno = s13.getResultSet();
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
   
   <%s14.executeQuery ("select count(distinct openstatus) from room,locationtable where room.location=locationtable.locationId order by openstatus");
   ResultSet rs_openstatus_count = s14.getResultSet();
   rs_openstatus_count.next();
   int openstatus_count = Integer.parseInt( rs_openstatus_count.getString(1)); %>
   <%s15.executeQuery ("select distinct openstatus from room,locationtable where room.location=locationtable.locationId order by openstatus");
   ResultSet rs_openstatus = s15.getResultSet();
   //rs11.next();
   p=0;
   String[] sample_openstatus = new String[100];
   String test_openstatus =":All;";
	while(rs_openstatus.next())
	{
		sample_openstatus[p] = rs_openstatus.getString(1);
		 test_openstatus += rs_openstatus.getString(1);
		 test_openstatus += ":";
		 test_openstatus += sample_openstatus[p];
		 if (p != openstatus_count - 1)
			test_openstatus += ";";
		p++;
   }


   %>
var k = "<%=roomID%>";
var act;
var addroom = "<%=buttonType%>";
//String[] testorama = new String[100];
var testorama = k.split("&");
if(testorama[0] != k)
{
	act = "delete";
}
else
{
	act = "edit";
}	
	
   if((k == "null" || act == "delete") && addroom == "null")
   {
    $(function () {
		$("#roomlist").jqGrid({

    data: mydata,
    datatype: 'local',
    height:"auto",
    rowNum: "auto",
    rowList: [10,20,30],
       colNames:['Room No','Location', 'Capacity', 'Cost','Floorno','Status','Edit','Delete'],
       colModel:[
           {name:'RoomNo',index:'RoomNo',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_room%>"
			}, width:50,align:"right",editable:true},
           {name:'Location',index:'Location',editable:true,formatter: 'select',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_location%>"
			},align:"right", width:100},
           {name:'Capacity',index:'Capacity',editable:true,formatter: 'select',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_capacity%>"
			}, width:40,sorttype:"int",align:"right"},
           {name:'Cost',index:'Cost',editable:true,formatter: 'select',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_cost%>"
			}, width:40, align:"right"},
			{name:'Floorno',index:'Floorno',editable:true,
													formatter: 'select',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_floorno%>"
			}, width:40,align:"right"}, 
			{name:'Status',index:'Status',editable:true,formatter: 'select',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_openstatus%>"
			}, width:60, align:"right"},
			 
           {name:'Edit',search:false,index:'roomno',width:30,sortable: false,formatter: editLink},
            {name:'Delete',search:false,index:'roomno',width:30,sortable: false,formatter: deleteLink},                   
       ],
        //colModel: [{ name: 'Site_Name', index: 'Site_Name', width: 130,editable: false, sortable: false,formatter: 'showlink', formatoptions: { baseLinkUrl: 'javascript:', showAction: "Link('", addParam: "');"} },
          //  { name: 'Details', index: 'Details', width: 400, editable: false, sortable: false }], value:":All;0.00:0.00;12:12.00;20:20.00;40:40.00;60:60.00;120:120.00"

       //http://172.16.82.84:8080/Roomtest/individualRequest.jsp?257
       sortname: 'RoomNo',
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
       caption: "Room Details"
       
}).jqGrid('navGrid',
          { add:false, del:false, search:false, refresh:false});
          
$("#roomlist").jqGrid('filterToolbar',
            {stringResult:true, searchOnEnter:true, defaultSearch:"cn"});          
});
}
function editLink(cellValue, options, rowdata, action)
{
	//alert("Yes Reached Here");
	//k = 1;
	return "<a href='<%=request.getContextPath()%>/roomChanges.jsp?" + rowdata.RoomNo +"' class='ui-icon ui-icon-pencil' ></a>";
}

function deleteLink(cellValue, options, rowdata, action)
{
	//alert("Yes Reached Here");
	//k = 1;
	return "<a href='<%=request.getContextPath()%>/roomChanges.jsp?" + rowdata.RoomNo + "&" + rowdata.Floorno +"' class='ui-icon ui-icon-trash' ></a>";
}
</script>
</head>
<body background=abc.png>
<div align="center">
<table cellpadding=5 cellspacing=5>
	<tr>
		<td>
		<form method="post" action="roomChanges.jsp">
			<input type="submit" name="newButton" value="ADD ROOM">
		</form>
		</td>
		
	</tr>
	
		
		
</table>
	
	<table id="roomlist">
	
	</table>
	<%
	if(roomID != null)
	{
		
		//String k12 = "Test5";
		String[] sample23 = new String[100];
		sample23 = roomID.split("&");
		if(sample23[0] != roomID)
		{
				String roomidnumber = null,testdelete=null; 
				roomidnumber = sample23[0];
				//roomidnumber = request.getParameter("room101");
				//testdelete = request.getParameter("deleteroom");
				//out.println(roomidnumber);
				rs = null;
				boolean res,res2;
				res2 = stmt.execute("delete from roomallocation where roomID = (select roomID from room where roomno='"+roomidnumber+"')");
				res=stmt.execute("delete from room where roomno='"+roomidnumber+"'");
				if(!res)
				{
					%>
					<font size=4 face="Baskerville Old Face" color=blue>Room <%=roomidnumber%> deleted successfully.</font>
					<%
				}
				%>
				<script>
				function qwerty()
				{
					//alert("Yes Reached Here");
					//k = 1;
					return "<a href='<%=request.getContextPath()%>/roomChanges.jsp'></a>";
				}
				//qwerty();
				window.location.href = "<%=request.getContextPath()%>/roomChanges.jsp";
				//location.reload();
				
				</script>
				<%
		}
		else
		{
			
			rs=null;
			rs=stmt.executeQuery("select * from room order by roomno asc");
			
			String roomId=null,roomNo=null;
			String givenID;
			//if(request.getParameter("room")!=null)
			//{
				//givenID=request.getParameter("room");
				////out.println(givenID);
				
			//}
			//else
			//{
				//givenID=request.getParameter("room102");
				////out.println(givenID);
				
			//}
			//out.println(givenID);
			
			//rs.close();
			rs=stmt.executeQuery("select roomID,roomno,location,capacity,cost,floorno,openstatus,locationName from room,locationtable where room.location=locationtable.locationId and roomno='"+roomID+"'");
			if(rs.next())
			{
				%>
				<form name='form1' method="post" onsubmit='return formValidator(this)' action="roomChanges.jsp">
				<center>
				<fieldset>
				<legend align="left"><font size=4 face="Baskerville Old Face" color=blue><b>Modify Room Details</b></font></legend>
				<table border=0>
				<%
				String tableID=rs.getString(1);
				session.setAttribute("TABLEID",tableID);
				session.setMaxInactiveInterval(36000);
				%>
				<tr>
					<td>
						<font size=4 face="Baskerville Old Face" color=blue>Room Number<font size=4 face="Baskerville Old Face" color=red>*</font></font>
					</td>
					
					<td>
						<input type="text" name="roomno" size=15 value=<%=rs.getString(2)%> id="roomno">
					</td>
				</tr>
				<tr>
					<td>
						<font size=4 face="Baskerville Old Face" color=blue>Location<font size=4 face="Baskerville Old Face" color=red>*</font></font>
					</td>
					
					<td>
						<select name="locations" id="locations">
							<option value="locations">Locations</option>
							<%
							String loc=rs.getString(3);
							//out.println(loc);
							rs1=null;
							rs1=stmt1.executeQuery("select * from locationtable order by locationName");
							while(rs1.next())
							{
								String tempLoc=rs1.getString(2);
								String locId=rs1.getString(1);
								boolean f=loc.equals(locId);
								if(!f)
								{
									%>
									<option value=<%=locId%>><%=tempLoc%></option>
									<%
								}
								else
								{
									%>
									<option value=<%=locId%> selected><%=tempLoc%></option>
									<%
								}
							}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<font size=4 face="Baskerville Old Face" color=blue>Capacity<font size=4 face="Baskerville Old Face" color=red>*</font></font>
					</td>
					
					<td>
						<input type="text" name="capacity" size=15 value=<%=rs.getString(4)%> id="capacity">
					</td>
				</tr>
				<tr>
					<td>
						<font size=4 face="Baskerville Old Face" color=blue>Cost<font size=4 face="Baskerville Old Face" color=red>*</font></font>
					</td>
					<td>
						<input type="text" name="cost" size=15 value=<%=rs.getString(5)%> id="cost">
					</td>
				</tr>
				<tr>
					<td>
						<font size=4 face="Baskerville Old Face" color=blue>Floor Number<font size=4 face="Baskerville Old Face" color=red>*</font></font>
					</td>
					<td>
						<input type="text" name="floorno" size=15 value=<%=rs.getString(6)%> id="floorno">
					</td>
				</tr>

				
				<tr>
					<td>
						<font size=4 face="Baskerville Old Face" color=blue>Open Status<font size=4 face="Baskerville Old Face" color=red>*</font></font>
					</td>
					<td>
						<select name="openstatus" id="openstatus">		
							<%
								String stat=rs.getString(7);
								if(stat.equals("OPEN"))
								{
									%>
									<option value="OPEN" selected>OPEN</option>
									<option value="CLOSED">CLOSED</option>
									<option value="status">Status</option>
									<%
								}
								else
								{
									%>
									<option value="OPEN">OPEN</option>
									<option value="CLOSED" selected>CLOSED</option>
									<option value="status">Status</option>
									<%
								}
							%>									
						</select>
					</td>
				</tr>
				</table>
				</fieldset>
				<input type="submit" name="modifySubmit" value="Modify Details">
				</form>
				(<font size=4 face="Baskerville Old Face" color=red>*</font>)<font size=4 face="Baskerville Old Face" color=blue>-- Fields are Mandatory </font>
				<%
			}
			else
			{
				%>
				<font size=5 face="Baskerville Old Face" color=red>Room not existed. Please select Valid ROOM NUMBER</font>			
				<%
			}
		}
		
			
	}
	if(modifyButton != null)
	{
			String roomno=null,locations=null,capacity=null,cost=null,floorno=null,address=null,openstatus=null,tableID=null;
				roomno=request.getParameter("roomno");
				locations=request.getParameter("locations");
				capacity=request.getParameter("capacity");
				cost=request.getParameter("cost");
				floorno=request.getParameter("floorno");
				//address=request.getParameter("address");
				openstatus=request.getParameter("openstatus");
				tableID=(String)session.getAttribute("TABLEID");
				session.removeAttribute("TABLEID");
				//out.println(roomno);
				rs=null;
				String guest=(String)session.getAttribute("USERID");
				//out.println((String)session.getAttribute("USERID"));
				//out.println(tableID);
				int re=0;
				re=stmt.executeUpdate("update room set roomno='"+roomno+"',location='"+locations+"',capacity='"+capacity+"',cost='"+cost+"',floorno='"+floorno+"',openstatus='"+openstatus+"',lastUpdatedUser='"+guest+"' where roomID='"+tableID+"'");
				if(re==1)
				{
					%>
					<font size=4 face="Baskerville Old Face" color=blue>Room details successfully modified in Database</font>		
					<%
				}
				else
				{
					%>
					<font size=4 face="Baskerville Old Face" color=blue>Modified details are not updated successfully. Their is problem with modified details.</font>
					<%
				}
				%>
				<script>
				window.location.href = "<%=request.getContextPath()%>/roomChanges.jsp";
				//location.reload();
				</script>
				<%
	}
	if(buttonType != null)
	{
	%>
				<center>
				<form name='form1' method="post" onsubmit='return formValidator(this)' action="addroom.jsp">
				<fieldset>
					<legend align="left"><font size=4 face="Baskerville Old Face" color=blue><b>Room Details</b></font></legend>
					<table border=0>
					<tr>
						<td>
							<font size=4 face="Baskerville Old Face" color=blue>Room Number<font size=4 face="Baskerville Old Face" color=red>*</font></font>
						</td>
						
						<td>
							<input type="text" name="roomno" size=15 id="roomno">
						</td>
					</tr>
					
					<tr>
						<td>
							<font size=4 face="Baskerville Old Face" color=blue>Location<font size=4 face="Baskerville Old Face" color=red>*</font></font>
						</td>
						
						<td>
							<select name="locations" id="locations">
								<option value="locations">Locations</option>
								<%
									rs=stmt.executeQuery("select * from locationtable order by locationName asc");
									String locationID=null,locationName=null;
									while(rs.next())
									{
										locationID=rs.getString(1);
										locationName=rs.getString(2);
										if(locationName.equals("Electronic City"))
										{
											%>
											<option value=<%=locationID%> selected><%=locationName%></option>
											<%
										}
										else
										{
											%>
											<option value=<%=locationID%>><%=locationName%></option>
											<%
										}
									} 
									rs.close();
								%>				
							</select>
						</td>
					</tr>
					
					<tr>
						<td>
							<font size=4 face="Baskerville Old Face" color=blue>Capacity<font size=4 face="Baskerville Old Face" color=red>*</font></font>
						</td>
						
						<td>
							<input type="text" name="capacity" size=15 id="capacity">
						</td>
					</tr>
					
					<tr>
						<td>
							<font size=4 face="Baskerville Old Face" color=blue>Cost<font size=4 face="Baskerville Old Face" color=red>*</font></font>
						</td>
						
						<td>
							<input type="text" name="cost" size=15 id="cost" value=1>
						</td>
					</tr>
					
					<tr>
						<td>
							<font size=4 face="Baskerville Old Face" color=blue>Floor Number<font size=4 face="Baskerville Old Face" color=red>*</font></font>
						</td>
						
						<td>
							<input type="text" name="floorno" size=15 id="floorno">
						</td>
					</tr>
					
					<tr>
						<td>
							<font size=4 face="Baskerville Old Face" color=blue>Open Status<font size=4 face="Baskerville Old Face" color=red>*</font></font>
						</td>
						
						<td>
							<select name="openstatus" id="openstatus">
								<option value="status" selected>Status</option>
								<option value="OPEN">OPEN</option>
								<option value="CLOSED">CLOSED</option>
							</select>
						</td>
					</tr>
					</table>
				</fieldset>
				<input type="submit" name="submit" value="Submit Details">
				</form>
				(<font size=4 face="Baskerville Old Face" color=red>*</font>)--<font size=4 face="Baskerville Old Face" color=blue>-- Fields are Mandatory</font>
				<%
	}
	
	%>
</body>
</html>


