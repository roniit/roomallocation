<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<html>
<head>  <TITLE>  ROOM ALLOCATION SYSTEM </TITLE>
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
 function formValidator(form1)
 {
      
    var elem,helperMsg; 
	var userid = document.getElementById('userid');
    var name = document.getElementById('name');
	var password = document.getElementById('pass'); 
	var dept=document.getElementById('dept');
	var email=document.getElementById('email');
	var exnumber=document.getElementById('exnumber');
	var mobilenumber=document.getElementById('mobilenumber');
	var xx1=document.getElementById('report');
	var xx2=document.getElementById('request');
	var xx3=document.getElementById('approve');
	var xx4=document.getElementById('admin');

	 if(ValidID(userid, "Please Enter valid userID"))
     {
	   if(ValidID(password,"Please Enter valid Password"))
	   {
		   if(ValidName(name,"Please Enter valid Name"))
		   {
			   if(ValidID(dept,"Please Enter valid department"))
			   {
				   if(ValidEmail(email,"Plese Enter valid Email"))
				   {
					   if(ValidNumber(exnumber,"Please Enter Valid Phone Number"))
					   {
						   if(ValidNumber(mobilenumber,"Please Enter valid phone number"))
						   {
								return true;
						   }
					   }
				   }
			   }
		   }
	   }
	}	   
	return false;	   	   	   
}
function checkRadio(xx1,xx2,xx3,xx4)
{
   if((xx1.checked==true))
   {
		alert('everything is good');
		return true;
   }
   else
   {
		alert('Please select accessprivilage');
		return false;
   }
}

function ValidNumber(elem,helperMsg)
{
    var alphaExp = /^[0-9]+$/;
	if(elem.value==""||elem.value=='null' || elem.value.length>12)
	{
		alert('Please Enter data in The Required field (SHOULD NOT BE NULL AND MAXIMUM 12 CHARACTERS)');
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
function ValidEmail(elem,helperMsg)
{
	var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	if(elem.value==""||elem.value=='null' || elem.value.length<10 || elem.value.length>30)
	{
		alert('Please Enter data in The Required field (SHOULD NOT BE NULL, MINIMUM 10 AND MAXIMUM 30 CHARACTERS)');
		elem.focus();
		return false;
	}
	if(elem.value.match(reg)) 
	{
		return true;
	}
	else
	{
		alert(helperMsg);
		elem.focus();
		return false;
	}
	return true;
}
function ValidName(elem,helperMsg)
{
	var alphaExp = /^[a-zA-Z]+$/;
	if(elem.value==""||elem.value=='null' || elem.value.length<4 || elem.value.length>25)
	{
		alert('Please Enter data in The Required field (SHOULD NOT BE NULL, MINIMUM 4 AND MAXIMUM 25 CHARACTERS)');
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
function ValidID(elem,helperMsg)
{
	var alphaExp = /^[a-zA-Z0-9@._]+$/;
	if(elem.value==""||elem.value=='null' || elem.value.length<4 || elem.value.length>30)
	{
		alert('Please Enter data in The Required field (SHOULD NOT BE NULL, MINIMUM 4 AND MAXIMUM 30 CHARACTERS)');
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
function Upload() {
    var fileUpload = document.getElementById("fileUpload");
    var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.csv|.txt)$/;
    if (regex.test(fileUpload.value.toLowerCase())) {
        if (typeof (FileReader) != "undefined") {
            var reader = new FileReader();
            reader.onload = function (e) {
                var table = document.createElement("table");
                var rows = e.target.result.split("\n");
                for (var i = 0; i < rows.length; i++) {
                    var row = table.insertRow(-1);
                    var cells = rows[i].split(",");
                    for (var j = 0; j < cells.length; j++) {
                       var cell = row.insertCell(-1);
                       cell.innerHTML = cells[j];
                    }
                }
                var dvCSV = document.getElementById("dvCSV");
                dvCSV.innerHTML = "";
                dvCSV.appendChild(table);
            }
            reader.readAsText(fileUpload.files[0]);
        } 
        else 
        {
            alert("This browser does not support HTML5.");
        }
    } 
    else 
    {
        alert("Please upload a valid CSV file.");
    }
}

</script>

<script type="text/javascript">
<% 
		String user_ID=request.getQueryString();
		
		String buttonType=null;
		String subButtonType=null;
		String modifyButton=null;
		
		
		buttonType=request.getParameter("newButton");
		subButtonType=request.getParameter("userIdsubmit");
		modifyButton=request.getParameter("modifySubmit");
		
		//String deleteicon = null;
		//deleteicon = request.getParameter("action");
		//out.println("Delete is:"+deleteicon);
		
		
		//out.println("YesYes:"+ roomID);
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
		Statement s16 = conn.createStatement();
		Statement s17 = conn.createStatement();
		Statement s18 = conn.createStatement();
		Statement s19 = conn.createStatement();
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
   s.executeQuery("select * from user order by userID asc");
   ResultSet rs = s.getResultSet();
   //System.out.println(user);
   //System.out.println("YOYYYYYYYYYYYYYYYYYYYYYYYY");
   
  
   
   //System.out.println (count + " rows were retrieved"); 
   %>
   
    var mydata = [ 
    <%  
    //s1.executeQuery ("select * from requestroom,user where (requestroom.userID=user.userID and requestroom.userID<>'"+user+"') order by requestID desc");
    s1.executeQuery("select * from user order by userID asc");
    ResultSet rs1 = s1.getResultSet();
    while (rs1!=null && rs1.next()) 
    { 
		String userID=null;
		userID=rs1.getString("userID");
		
		String name=null;
		name=rs1.getString("name");
					
		String department=null;
		department=rs1.getString("department");
					
		String email=null;
		email=rs1.getString("email");
		
		String extenNumber=null;
		extenNumber=rs1.getString("extenNumber");
		
		String mobileNumber=null;
		mobileNumber=rs1.getString("mobileNumber");
														
		String IDStatus=null;
		IDStatus=rs1.getString("IDStatus");
		
		String accessPrivilage=null;
		accessPrivilage=rs1.getString("accessPrivilage");
		
		
						
		%>{
       userID:"<%=userID%>",
       name:"<%=name%>",
       department:"<%=department%>",
		 email:"<%=email%>",
		 extenNumber:"<%=extenNumber%>",
		  mobileNumber:"<%=mobileNumber%>",
		  IDStatus:"<%=IDStatus%>",
		  AccessPrivilege:"<%=accessPrivilage%>",
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
   <%
   s3.executeQuery ("select count(distinct userID) from user order by userID asc");
   ResultSet rs10 = s3.getResultSet();
   rs10.next();
   int userID_count = Integer.parseInt(rs10.getString(1)); 
   %>
   <%
   s2.executeQuery ("select distinct userID from user order by userID asc");
   ResultSet rs11 = s2.getResultSet();
   //rs11.next();
   int p=0;
   String[] sample2 = new String[100];
   String test_userID =":All;";
	while(rs11.next())
	{
		sample2[p] = rs11.getString(1);
		 test_userID += rs11.getString(1);
		 test_userID += ":";
		 test_userID += sample2[p];
		 if (p != userID_count - 1)
			test_userID += ";";
		p++;
   }
   %>
   
   <%s4.executeQuery ("select count(distinct name) from user order by name asc");
   ResultSet rs_name_count = s4.getResultSet();
   rs_name_count.next();
   int name_count = Integer.parseInt( rs_name_count.getString(1)); %>
   <%s5.executeQuery ("select distinct name from user order by name asc");
   ResultSet rs_name = s5.getResultSet();
   //rs11.next();
   p=0;
   String[] sample_name = new String[100];
   String test_name =":All;";
	while(rs_name.next())
	{
		sample_name[p] = rs_name.getString(1);
		 test_name += rs_name.getString(1);
		 test_name += ":";
		 test_name += sample_name[p];
		 if (p != name_count - 1)
			test_name += ";";
		p++;
   }
   %>
   
   <%s6.executeQuery ("select count(distinct department) from user order by department asc");
   ResultSet rs_department_count = s6.getResultSet();
   rs_department_count.next();
   int department_count = Integer.parseInt( rs_department_count.getString(1)); %>
   <%s7.executeQuery ("select distinct department from user order by department asc");
   ResultSet rs_department = s7.getResultSet();
   //rs11.next();
   p=0;
   String[] sample_department = new String[100];
   String test_department =":All;";
	while(rs_department.next())
	{
		sample_department[p] = rs_department.getString(1);
		 test_department += rs_department.getString(1);
		 test_department += ":";
		 test_department += sample_department[p];
		 if (p != department_count - 1)
			test_department += ";";
		p++;
   }
   %>
   
   
   
   <%s10.executeQuery ("select count(distinct email) from user order by email asc");
   ResultSet rs_email_count = s10.getResultSet();
   rs_email_count.next();
   int email_count = Integer.parseInt( rs_email_count.getString(1)); %>
   <%s11.executeQuery ("select distinct email from user order by email asc");
   ResultSet rs_email = s11.getResultSet();
   //rs11.next();
   p=0;
   String[] sample_email = new String[100];
   String test_email =":All;";
	while(rs_email.next())
	{
		sample_email[p] = rs_email.getString(1);
		 test_email += rs_email.getString(1);
		 test_email += ":";
		 test_email += sample_email[p];
		 if (p != email_count - 1)
			test_email += ";";
		p++;
   }
   %>
   
   <%s12.executeQuery ("select count(distinct extenNumber) from user order by extenNumber asc");
   ResultSet rs_extenNumber_count = s12.getResultSet();
   rs_extenNumber_count.next();
   int extenNumber_count = Integer.parseInt( rs_extenNumber_count.getString(1)); %>
   <%s13.executeQuery ("select distinct extenNumber from user order by extenNumber asc");
   ResultSet rs_extenNumber = s13.getResultSet();
   //rs11.next();
   p=0;
   String[] sample_extenNumber = new String[100];
   String test_extenNumber =":All;";
	while(rs_extenNumber.next())
	{
		sample_extenNumber[p] = rs_extenNumber.getString(1);
		 test_extenNumber += rs_extenNumber.getString(1);
		 test_extenNumber += ":";
		 test_extenNumber += sample_extenNumber[p];
		 if (p != extenNumber_count - 1)
			test_extenNumber += ";";
		p++;
   }
   %>
   
   <%s14.executeQuery ("select count(distinct mobileNumber) from user order by mobileNumber asc");
   ResultSet rs_mobileNumber_count = s14.getResultSet();
   rs_mobileNumber_count.next();
   int mobileNumber_count = Integer.parseInt( rs_mobileNumber_count.getString(1)); %>
   <%s15.executeQuery ("select distinct mobileNumber from user order by mobileNumber asc");
   ResultSet rs_mobileNumber = s15.getResultSet();
   //rs11.next();
   p=0;
   String[] sample_mobileNumber = new String[100];
   String test_mobileNumber =":All;";
	while(rs_mobileNumber.next())
	{
		sample_mobileNumber[p] = rs_mobileNumber.getString(1);
		 test_mobileNumber += rs_mobileNumber.getString(1);
		 test_mobileNumber += ":";
		 test_mobileNumber += sample_mobileNumber[p];
		 if (p != mobileNumber_count - 1)
			test_mobileNumber += ";";
		p++;
   }
	%>
   <%
   s16.executeQuery ("select count(distinct IDStatus) from user order by IDStatus asc");
   ResultSet rs_IDStatus_count = s16.getResultSet();
   rs_IDStatus_count.next();
   int IDStatus_count = Integer.parseInt( rs_IDStatus_count.getString(1)); %>
   <%
   s17.executeQuery ("select distinct IDStatus from user order by IDStatus asc");
   ResultSet rs_IDStatus = s17.getResultSet();
   //rs11.next();
   p=0;
   String[] sample_IDStatus = new String[100];
   String test_IDStatus =":All;";
	while(rs_IDStatus.next())
	{
		sample_IDStatus[p] = rs_IDStatus.getString(1);
		 test_IDStatus += rs_IDStatus.getString(1);
		 test_IDStatus += ":";
		 test_IDStatus += sample_IDStatus[p];
		 if (p != IDStatus_count - 1)
			test_IDStatus += ";";
		p++;
   }
   %>
   <%
   s18.executeQuery ("select count(distinct accessPrivilage) from user order by accessPrivilage asc");
   ResultSet rs_accessPrivilage_count = s18.getResultSet();
   rs_accessPrivilage_count.next();
   int accessPrivilage_count = Integer.parseInt( rs_accessPrivilage_count.getString(1)); %>
   <%
   s19.executeQuery ("select distinct accessPrivilage from user order by accessPrivilage asc");
   ResultSet rs_accessPrivilage = s19.getResultSet();
   //rs11.next();
   p=0;
   String[] sample_accessPrivilage = new String[100];
   String test_accessPrivilage =":All;";
	while(rs_accessPrivilage.next())
	{
		sample_accessPrivilage[p] = rs_accessPrivilage.getString(1);
		 test_accessPrivilage += rs_accessPrivilage.getString(1);
		 test_accessPrivilage += ":";
		 test_accessPrivilage += sample_accessPrivilage[p];
		 if (p != accessPrivilage_count - 1)
			test_accessPrivilage += ";";
		p++;
   }
   
  
   
   %>
var k = "<%=user_ID%>";

var adduser = "<%=buttonType%>";
//var act;
	if(k == "null" && adduser == "null")
	{
    $(function () {
		$("#userlist").jqGrid({

    data: mydata,
    datatype: 'local',
    height:"auto",
    rowNum: "auto",
    rowList: [10,20,30],
       colNames:['User ID','Name', 'Department', 'Email ID','Extension No.','Mobile No.','ID Status','Access Privilege','Edit','Delete'],
       colModel:[
       
       {name:'userID',index:'userID',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_userID%>"
			}, width:200,align:"right",editable:true},
           {name:'name',index:'name',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_name%>"
			}, width:200,align:"right",editable:true},
           {name:'department',index:'department',editable:true,formatter: 'select',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_department%>"
			},align:"right", width:200},
           {name:'email',index:'email',editable:true,formatter: 'select',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_email%>"
			}, width:200,align:"right"},
           {name:'extenNumber',index:'extenNumber',editable:true,formatter: 'select',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_extenNumber%>"
			}, width:200, align:"right"},
			{name:'mobileNumber',index:'mobileNumber',editable:true,
													formatter: 'select',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_mobileNumber%>"
			}, width:200,align:"right"}, 
			{name:'IDStatus',index:'IDStatus',editable:true,formatter: 'select',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_IDStatus%>"
			}, width:200, align:"right"},
			 
            {name:'AccessPrivilege',index:'AccessPrivilege',editable:true,formatter: 'select',stype:'select',searchoptions:{sopt:['eq'],value:"<%=test_accessPrivilage%>"
			}, width:250, align:"right"},
           {name:'Edit',search:false,index:'loginID',width:100,sortable: false,formatter: editLink},
            {name:'Delete',search:false,index:'loginID',width:100,sortable: false,formatter: deleteLink},                   
       ],
        //colModel: [{ name: 'Site_Name', index: 'Site_Name', width: 130,editable: false, sortable: false,formatter: 'showlink', formatoptions: { baseLinkUrl: 'javascript:', showAction: "Link('", addParam: "');"} },
          //  { name: 'Details', index: 'Details', width: 400, editable: false, sortable: false }], value:":All;0.00:0.00;12:12.00;20:20.00;40:40.00;60:60.00;120:120.00"

       //http://172.16.82.84:8080/Roomtest/individualRequest.jsp?257
       sortname: 'name',
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
       caption: "User Details"
       
}).jqGrid('navGrid',
          { add:false, del:false, search:false, refresh:false});
          
$("#userlist").jqGrid('filterToolbar',
            {stringResult:true, searchOnEnter:true, defaultSearch:"cn"});          
});
}
function editLink(cellValue, options, rowdata, action)
{
	//alert("Yes Reached Here");
	//k = 1;
	return "<a href='<%=request.getContextPath()%>/userChanges.jsp?" + rowdata.userID +"' class='ui-icon ui-icon-pencil' ></a>";
}

function deleteLink(cellValue, options, rowdata, action)
{
	//alert("Yes Reached Here");
	//k = 1;
	return "<a href='<%=request.getContextPath()%>/userChanges.jsp?" + rowdata.userID + "&" + rowdata.name +"' class='ui-icon ui-icon-trash' ></a>";
}
</script>

</head>
<body background=abc.jpg>
<div align="center">
<table cellpadding=5 cellspacing=5>
	<tr>
		<td>
			<form method="post" action="userChanges.jsp">
			<input type="submit" name="newButton" value="ADD USER">
			
			</form>
		</td>
		
		
		
		<FORM  ENCTYPE="multipart/form-data" ACTION="upload_user.jsp" METHOD=POST>
		
		
                    
                    <td><INPUT NAME="file" TYPE="file"></td>
					<td colspan="2">
					<p align="right"><INPUT TYPE="submit"  VALUE="Upload File" ></p></td>
             
     </FORM>
		<FORM  ENCTYPE="multipart/form-data" ACTION="download.jsp" METHOD=POST>
			<td><p align="right"><INPUT TYPE="submit"  VALUE="Download Template File" ></p></td>
		</FORM>
	</tr>
</table>
<table id="userlist">
	
	</table>
<%
	if(user_ID != null)
	{
		
		//String k12 = "Test5";
		String[] sample23 = new String[100];
		sample23 = user_ID.split("&");
		if(sample23[0] != user_ID)
		{
				String useridnumber = null,testdelete=null;
				useridnumber = sample23[0];
				//testdelete = request.getParameter("deleteuser");
				//out.println(useridnumber);
				rs = null;
				boolean res,res2,resdelete;
				ResultSet res3 = null;
				String[] requestids = new String[100];
				int i=0,k=0;
				res3 = stmt.executeQuery("select * from requestroom where userID ='"+useridnumber+"'");
				while(res3.next())
				{
					requestids[i] = res3.getString(1);
					i++;
				}
				out.println(requestids[2]);
				for(k=0;k<i;k++)
				{
					resdelete = stmt.execute("delete from roomallocation where requestID ='"+requestids[k]+"'");
				}
				res2 = stmt.execute("delete from requestroom where userID ='"+useridnumber+"'");
				res=stmt.execute("delete from user where userID='"+useridnumber+"'");
				if(!res)
				{
					%>
					<font size=4 face="Baskerville Old Face" color=blue>User deleted successfully.</font>
					<%
				}
				%>
				<script>
				window.location.href = "<%=request.getContextPath()%>/userChanges.jsp";
				</script>
				<%
				//out.println(testdelete);
		}
		else
		{
		rs=null;
		rs=stmt.executeQuery("select * from user order by userID asc");
		String userId=null,loginId=null;
		String givenID = sample23[0];
		//if(request.getParameter("user")!=null)
		//{
			//givenID=request.getParameter("user");
			////out.println(givenID);
			
		//}
		//else
		//{
			//givenID=request.getParameter("user102");
			////out.println(givenID);
			
		//}
			//out.println(givenID);
		%>
		
			<form method="post" action="userChanges.jsp">
			<div align=left><font size=4 face="Baskerville Old Face" color=blue>Select user			
			<%buttonType="UPDATE USER";%>
			<select name="user">
			<option value="USERID">userID</option>
			<%
			while(rs.next())
			{
				userId=rs.getString(1);
				loginId=rs.getString(2);
				if(givenID.equals(userId))
				{
					%>
					<option value=<%=userId%> selected><%out.println(loginId);%>
					</option>
					<%
				}
				else
				{
					%>
					<option value=<%=userId%>><%out.println(loginId);%>
					</option>
					<%
				}
			}
			%>
			</select>
			<input type=submit name="userIdsubmit" value="submitID">
			</form>
			<%	
			rs.close();
			rs=stmt.executeQuery("select * from user where userID='"+givenID+"'");
			if(rs.next())
			{
			%>
			<center>

			<form method="post" name="form1" onsubmit='return formValidator(this)' action="userChanges.jsp">
			<fieldset>
			<legend align="left"><font size=4 face="Baskerville Old Face" color=blue><b>Modify User Details</b></font></legend>
		<table border=0>
		<%
		String tableID=rs.getString(1);
			session.setAttribute("TABLEID",tableID);session.setMaxInactiveInterval(36000);
					//	out.println(tableID);%>

		<tr>
		<td>
			<font size=4 face="Baskerville Old Face" color=blue>UserID<font size=4 face="Baskerville Old Face" color=red>*</font></font>
		</td>
		<td>
			<input type="text" name="userid" size=15 value=<%=rs.getString(2)%> id="userid">
		</td>
		</tr>
		<tr>
		<td>
			<font size=4 face="Baskerville Old Face" color=blue>Password<font size=4 face="Baskerville Old Face" color=red>*</font></font>
		</td>
		<td>
			<input type="text" name="pass" size=15 value=<%=rs.getString(3)%> id="pass">
		</td>
		</tr>
		<tr>
		<td>
			<font size=4 face="Baskerville Old Face" color=blue>Name<font size=4 face="Baskerville Old Face" color=red>*</font></font>
		</td>
		<td>
			<input type="text" name="name" size=15 value=<%=rs.getString(4)%> id="name">
		</td>
		</tr>
		<tr>
		<td>
			<font size=4 face="Baskerville Old Face" color=blue>Department<font size=4 face="Baskerville Old Face" color=red>*</font></font>
		</td>
		<td>
		<input type="text" name="dept" size=15 value=<%=rs.getString(6)%> id="dept">
		</td>
		</tr>
		<tr>
		<td>
			<font size=4 face="Baskerville Old Face" color=blue>Email<font size=4 face="Baskerville Old Face" color=red>*</font></font>
		</td>
		<td>
			<input type="text" name="email" size=15 value=<%=rs.getString(5)%> id="email">
		</td>
		</tr>
		<tr>
		<td>
			<font size=4 face="Baskerville Old Face" color=blue>Extension Number<font size=4 face="Baskerville Old Face" color=red>*</font></font>
		</td>
		<td>
			<input type="text" name="exnumber" size=15 value=<%=rs.getString(7)%> id="exnumber">
		</td>
		</tr>
		<tr>
		<td>
			<font size=4 face="Baskerville Old Face" color=blue>Mobile Number<font size=4 face="Baskerville Old Face" color=red>*</font></font>
		</td>
		<td>
			<input type="text" name="mobilenumber" size=15 value=<%=rs.getString(8)%> id="mobilenumber">
		</td>
		</tr>
		<tr>
		<td>
			<font size=4 face="Baskerville Old Face" color=blue>ID Status<font size=4 face="Baskerville Old Face" color=red>*</font></font>
		</td>
		<td>
		<select name="idstatus" id="idstatus">
		<%
				String status=rs.getString(9);
				if(status.equals("ACTIVE"))
		{
			%>
			<option value="ACTIVE" selected>ACTIVE</option>
			<option value="DISABLE">DISABLE</option>
			<%
		}
				else
			{%>
					<option value="DISABLE" selected>DISABLE</option>
					<option value="ACTIVE">ACTIVE</option>
					<%}%>
		</select></td></tr>
		</table>
		</fieldset>
		<%
		String acces=rs.getString(10);%>
	    <fieldset>
		<legend align="left"><font size=4 face="Baskerville Old Face" color=blue><b>Modify Access Privilage</b></font></legend>
		<table>
		<tr>
		<%
		if(acces.equals("REPORT"))
		{
			%>
			<td>
			<input type="radio" name="accessprivilage" value="REPORT" checked>
			</td>
			<td>
			<font size=4 face="Baskerville Old Face" color=blue>REPORT</font>
			</td>
			</tr>
			<td>
				<input type="radio" name="accessprivilage" value="REQUEST">
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>REQUEST</font>
			</td>
			</tr>
			<td>
				<input type="radio" name="accessprivilage" value="APPROVE">
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>APPROVE</font>
			</td>
			</tr>
			<td>
				<input type="radio" name="accessprivilage" value="SUPERUSER">
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>SYSTEM ADMINISTRATOR</font>
			</td>
			</tr>
			<%
		}
		else if(acces.equals("REQUEST"))
		{
			%>
			<td>
				<input type="radio" name="accessprivilage" value="REPORT">
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>REPORT</font>
			</td>
			</tr>
			<td>
				<input type="radio" name="accessprivilage" value="REQUEST" checked>
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>REQUEST</font>
			</td>
			</tr>
			<td>
				<input type="radio" name="accessprivilage" value="APPROVE">
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>APPROVE</font>
			</td>
			</tr>
			<td>
				<input type="radio" name="accessprivilage" value="SUPERUSER">
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>SYSTEM ADMINISTRATOR</font>
			</td>
			</tr>
			<%
		}
		else if(acces.equals("APPROVE"))
		{
			%>
			<td>
				<input type="radio" name="accessprivilage" value="REPORT">
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>REPORT</font>
			</td>
			</tr>
			<td>
				<input type="radio" name="accessprivilage" value="REQUEST">
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>REQUEST</font>
			</td>
			</tr>
			<td>
				<input type="radio" name="accessprivilage" value="APPROVE" checked>
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>APPROVE</font>
			</td>
			</tr>
			<td>
				<input type="radio" name="accessprivilage" value="SUPERUSER">
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>SYSTEM ADMINISTRATOR</font>
			</td>
			</tr>
			<%
		}
		else
		{
			%>
			<td>
				<input type="radio" name="accessprivilage" value="REPORT">
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>REPORT</font>
			</td>
			</tr>
			<td>
				<input type="radio" name="accessprivilage" value="REQUEST">
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>REQUEST</font>
			</td>
			</tr>
			<td>
				<input type="radio" name="accessprivilage" value="APPROVE">
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>APPROVE</font>
			</td>
			</tr>
			<td>
				<input type="radio" name="accessprivilage" value="SUPERUSER" checked>
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>SYSTEM ADMINISTRATOR</font>
			</td>
			</tr>
			<%
		}
		%>
		</table>
		</fieldset>
		<input type="submit" name="modifySubmit" value="ModifyDetails">
		</form>
		(<font size=4 face="Baskerville Old Face" color=red>*</font>)--<font size=4 face="Baskerville Old Face" color=blue>Fields are Mandatory</font>
		<%
		}
		else
		{
			%>
			<font size=5 face="Baskerville Old Face" color=red>User not existed. Please select Valid USERID</font>
			<%
		}
		}
	}
	
	else if(modifyButton != null)
	{
			String tableID=null,userid=null,pass=null,name=null,email=null,dept=null,exnumber=null,mobilenumber=null,idstatus=null;
			
			tableID=(String)session.getAttribute("TABLEID");
			session.removeAttribute("TABLEID");
			userid=request.getParameter("userid");
			pass=request.getParameter("pass");
			name=request.getParameter("name");
			email=request.getParameter("email");
			dept=request.getParameter("dept");
			exnumber=request.getParameter("exnumber");
			mobilenumber=request.getParameter("mobilenumber");
			idstatus=request.getParameter("idstatus");
			String userstatus=null;
			userstatus=request.getParameter("accessprivilage");		
			rs=null;
			String guest=(String)session.getAttribute("USERID");
			//out.println(userstatus);
			int re=0;
			//out.println(tableID);
			re=stmt.executeUpdate("update user set  loginID='"+userid+"',password='"+pass+"',name='"+name+"',email='"+email+"',department='"+dept+"',extenNumber='"+exnumber+"',mobileNumber='"+mobilenumber+"',IDStatus='"+idstatus+"',accessPrivilage='"+userstatus+"',lastUpdatedUser='"+guest+"' where userID='"+tableID+"'");
			if(re==1)
			{
				%>
				
					<font size=4 face="Baskerville Old Face" color=blue>User details successfully modified in Database</font>		
				<%
			}
			else
			{
				%>
					<font size=4 face="Baskerville Old Face" color=blue>Modified details are not updated successfully. Their is problem with modified details.LoginId or email is already used(Please choose another one.</font>
				<%
			}
			%>
			<script>
			location.reload();
			</script>
			<%
			//ResultSet rs=null;
		
	}
	else if(buttonType != null)
	{
		%>
			
			<form method="post" name="form1" onsubmit='return formValidator(this)' action="adduser.jsp">
			<fieldset>
			<legend align="left"><font size=4 face="Baskerville Old Face" color=blue><b>User Details</b></font></legend>
			<table border=0>
			<tr>
			   <td>
					<font size=4 face="Baskerville Old Face" color=blue>UserID<font size=4 face="Baskerville Old Face" color=red>*</font></font>
			   </td>
			   <td>
					<input type="text" name="userid" size=15 id="userid">
			   </td>
			</tr>
			<tr>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>Password<font size=4 face="Baskerville Old Face" color=red>*</font></font>
			</td>
			<td>
				<input type="password" name="pass" size=15 id="pass">
			</td>
			</tr>
			<tr>
			   <td>
					<font size=4 face="Baskerville Old Face" color=blue>Name<font size=4 face="Baskerville Old Face" color=red>*</font></font>
			   </td>
			   <td>
					<input type="text" name="name" size=15 id="name">
			   </td>
			</tr>
			<tr>
			   <td>
					<font size=4 face="Baskerville Old Face" color=blue>Department<font size=4 face="Baskerville Old Face" color=red>*</font></font>
			   </td>
			   <td>
					<input type="text" name="dept" size=15 id="dept">
			   </td>
			</tr>
			<tr>
			   <td>
					<font size=4 face="Baskerville Old Face" color=blue>Email<font size=4 face="Baskerville Old Face" color=red>*</font></font>
			   </td>
			   <td>
					<input type="text" name="email" size=15 id="email">
			   </td>
			</tr>
			<tr>
			   <td>
					<font size=4 face="Baskerville Old Face" color=blue>Extension Number<font size=4 face="Baskerville Old Face" color=red>*</font></font>
			   </td>
			   <td>
					<input type="text" name="exnumber" size=15 id="exnumber">
			   </td>
			</tr>
			<tr>
			   <td>
					<font size=4 face="Baskerville Old Face" color=blue>Mobile Number<font size=4 face="Baskerville Old Face" color=red>*</font></font>
			   </td>
			   <td>
					<input type="text" name="mobilenumber" size=15 id="mobilenumber">
			   </td>
			</tr>
			</table>
			</fieldset>
			<fieldset>
			<legend align="left"><font size=4 face="Baskerville Old Face" color=blue><b>Access Privilage</b></font></legend>
			<table>
			<tr>
				<td>
					<input type="radio" name="accessprivilage" value="REPORT">
				</td>
				<td>
					<font size=4 face="Baskerville Old Face" color=blue>REPORT</font>
				</td>
			</tr>
			<td>
				<input type="radio" name="accessprivilage" value="REQUEST">
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>REQUEST</font>
			</td>
			</tr>
			<td>
				<input type="radio" name="accessprivilage" value="APPROVE">
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>APPROVE</font>
			</td>
			</tr>
			<td>
				<input type="radio" name="accessprivilage" value="SUPERUSER">
			</td>
			<td>
				<font size=4 face="Baskerville Old Face" color=blue>SYSTEM ADMINISTRATOR</font>
			</td>
			</tr>
			</table>
			</fieldset>
			<input type="submit" name="adduser" value="Submit Details">
			</form>
			</center>
			<div align="left">(<font size=4 face="Baskerville Old Face" color=red>*</font>)--<font size=4 face="Baskerville Old Face" color=blue>Fields are mandatory</font>
			<%
	}
//	out.println(buttonType);
//	out.println(subButtonType);
	
	
	
	
	%>
		   
</body>
</html>
