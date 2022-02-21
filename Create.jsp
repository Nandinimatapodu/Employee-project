<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%!
    
   	Connection conn;
    PreparedStatement statement;
    public void jspInit(){
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
        	conn = DriverManager.getConnection("jdbc:mysql://localhost/Emp","root","test");
        	statement = conn.prepareStatement("insert into account values (?,?,?,?);");
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
    
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    int age=Integer.parseInt(request.getParameter("age"));
    int sal = Integer.parseInt(request.getParameter("salary"));
    String designation=request.getParameter("designation");
	out.print(id);
	out.print(name);
    statement.setInt(1,id);
    statement.setString(2,name);
    statement.setInt(3,age);
    statement.setInt(4,salary);
    statement.setInt(5,designation);
    
    
    statement.executeUpdate();

    %>
    
    <h1>Added Successfully</h1>
  