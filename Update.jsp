<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%!
    
   	Connection conn;
    PreparedStatement statement;
    public void jspInit(){
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
        	conn = DriverManager.getConnection("jdbc:mysql://localhost/Emp","root","text");
        	statement = conn.prepareStatement("update account set salary=? where id=?;");
    	}catch(SQLException e){
    		System.out.print("SQL exception");
    	}catch(ClassNotFoundException ec){
    		System.out.print("Class not found");
    	}
    }
    
    public void jspDestroy() throws SQLException{
    	statement.close();
		conn.close();
    	
    }
    
    %>
    
    
    <%
    
    int idUpdate = Integer.parseInt(request.getParameter("id"));
    int salaryUpdate = Integer.parseInt(request.getParameter("salary"));
	out.print(idUpdate);
    statement.setInt(1,salaryUpdate);
    statement.setInt(2,idUpdate);
    
    
    statement.executeUpdate();

    %>
    
    <h1>Update Successfull</h1>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
		<h1>Update Successfull</h1>
</body>
</html>