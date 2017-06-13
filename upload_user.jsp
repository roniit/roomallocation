<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<html>
<%
	String contentType = request.getContentType();
	//out.println(contentType);
	if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
 	DataInputStream in = new DataInputStream(request.getInputStream());
	int formDataLength = request.getContentLength();
	byte dataBytes[] = new byte[formDataLength];
	int byteRead = 0;
	int totalBytesRead = 0;
		
	while (totalBytesRead < formDataLength) {
	byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
	totalBytesRead += byteRead;
	}
	String file = new String(dataBytes);
	String saveFile = file.substring(file.indexOf("filename=\"") + 10);
	System.out.println("saveFile=" + saveFile);
	saveFile = saveFile.substring(saveFile.lastIndexOf("\\")+ 1,saveFile.indexOf("\""));
	System.out.println("saveFile" + saveFile);
	saveFile = file.substring(file.indexOf("filename=\"") + 10);
		saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
		saveFile = saveFile.substring(saveFile.lastIndexOf("\\")+ 1,saveFile.indexOf("\""));
		int lastIndex = contentType.lastIndexOf("=");
		String boundary = contentType.substring(lastIndex + 1,contentType.length());
		int pos;
		
		pos = file.indexOf("filename=\"");
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		int boundaryLocation = file.indexOf(boundary, pos) - 4;
		int startPos = ((file.substring(0, pos)).getBytes()).length;
		int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

		FileOutputStream fileOut = new FileOutputStream(saveFile);
		fileOut.write(dataBytes, startPos, (endPos - startPos));
		%>
		<b>File 	<% out.println(saveFile); %> has been uploaded and inserted into Database.</b>
		<%
		Connection con=null;
	    Statement pst=null;
	    Statement pst1=null;
        String line = null;
        String[] userfile = new String[100];
        int k=0;
        
	    String value=null;
        try{
			StringBuilder contents = new StringBuilder();
			BufferedReader input =  new BufferedReader(new FileReader(saveFile));
			while (( line = input.readLine()) != null){
			contents.append(line);
			userfile[k] = line;
			k++;
			}
			 Class.forName("com.mysql.jdbc.Driver");
			//con=DriverManager.getConnection("jdbc:mysql://172.16.82.84/application?user=root&password=root"); 
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/roomdatabase","root","123");
		
			pst=con.createStatement();
            pst1=con.createStatement();
            
			value = contents.toString();
			String[] sample = new String[100];
			//out.println(value);
			
			//sample = value.split(",");
			//out.println(yoyo[0]);
			//out.println(userfile[0]);
			//out.println(k);
			//out.println(sample.length);
			ResultSet rs=null;
			rs=pst1.executeQuery("select count(*) from user");
			rs.next();
			//int val1 = Integer.parseInt(rs.getString(1));	
			//out.println(val1);
			//String kkk = rs.getString(1);
			//out.println(rs.getString(1));
			String qwerty = rs.getString(1);
			//out.println(qwerty);
			int val2 = Integer.parseInt(qwerty);	
			val2++;
			qwerty = Integer.toString(val2);
			for(int i=0;i<sample.length/12;i++)
			{
				//String[] sample2 = new String[5];
				//sample2 = sample[i].split(",");
				//int val = pst.executeUpdate("insert into user(userID,loginID,password,name,email,department,extenNumber,mobileNumber,IDStatus,accessPrivilage,lastUpdatedTime,lastUpdatedUser) values('"+sample[0+i*12]+"','"+sample[1+i*12]+"','"+sample[2+i*12]+"','"+sample[3+i*12]+"','"+sample[4+i*12]+"','"+sample[5+i*12]+"','"+sample[6+i*12]+"','"+sample[7+i*12]+"','"+sample[8+i*12]+"','"+sample[9+i*12]+"','"+sample[10+i*12]+"','"+sample[11+i*12]+"' )");
           
			}
			for(int i=0;i<k;i++)
			{
				String[] sample2 = new String[100];
				sample2 = userfile[i].split(",");
				int s = 12;
				int val = pst.executeUpdate("insert into user(userID,loginID,password,name,email,department,extenNumber,mobileNumber,IDStatus,accessPrivilage) values('"+qwerty+"','"+sample2[0]+"','"+sample2[1]+"','"+sample2[2]+"','"+sample2[3]+"','"+sample2[4]+"','"+sample2[5]+"','"+sample2[6]+"','"+sample2[7]+"','"+sample2[8]+"' )");
				//s++;
				//out.println(s);
				//val1++;
				//int val2 = Integer.parseInt(kkk);	
				//val2++;
				//kkk = Integer.toString(val2);
				
				//val1++;
				val2 = Integer.parseInt(qwerty);	
				val2++;
				qwerty = Integer.toString(val2);
			}
			%>
			<script>
			window.location.href = "<%=request.getContextPath()%>/userChanges.jsp";
			</script>
			<%
			//out.println(sample2);
			//System.out.println("Value:"+value);
           }
	catch(Exception e)
		{}
		}
	%>
</html>


