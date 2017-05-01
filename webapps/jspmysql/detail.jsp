<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%
	String id = request.getParameter("id");
	String ip = "140.120.57.34:3306";
	String user = "jspuser";
	String pwd = "jspuser";
	String db = "jspdb";
	String driver = "com.mysql.jdbc.Driver";
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	try{
		String url = "jdbc:mysql://" + ip + "/" + db + "?useUnicode=true&characterEncoding=utf-8";
		Class.forName(driver).newInstance();
		con = DriverManager.getConnection(url,user,pwd);
		//out.println(con);
		stmt = con.createStatement();
		String sql = "select * from newtable where id ="+id;
		rs = stmt.executeQuery(sql);
	}catch(Exception ex){
		out.println(ex);
	}
	
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>

	</head>
	<body>
		<div class="navbar-fixed">
			<nav>
				<div class="nav-wrapper">
					<center>
						<h style="font-size:25px;font-weight:bold;">英雄聯盟</h>
					</center>
				</div>
			</nav>
		</div>
		<div class="row">
		
		<%
		if (rs != null){
			while(rs.next()){	
				String name = rs.getString("name");
				String description = rs.getString("description");
				String photo = rs.getString("photo");
		%>
			<div class="card">
				<div class="card-image" style="padding:2vh;">
					<img src="<%=photo%>" style="width:17vh;height:19vh;">
				</div>
				<div class="card-content">
					<h style="font-size:20px;font-weight:bold;"><%=name%></h>
					<p><%=description%></p>
				</div>
			</div>
		<%}}%>
		
		</div>
	</body>
</html>