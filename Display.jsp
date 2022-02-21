<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
    <%!
    
   	Connection conn;
    Statement statement;
    ResultSet resultSet;
    public void jspInit(){
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
        	conn = DriverManager.getConnection("jdbc:mysql://localhost/Emp","root","test");
        	statement = conn.createStatement();
        	resultSet = statement.executeQuery("Select * from Info;");
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
    
    
    
 <table>
 	<tr>
 		<th> ID </th>
 		<th> Name</th>
 		<th> Age </th>
  		<th> Salary</th>
                <th>Designation</th>
 	</tr>
 	 		<% while(resultSet.next()){ %>
 	
 		<tr> 
 			<td><%=resultSet.getInt(1) %></td> 
 			<td><%=resultSet.getString(2) %></td> 
 			<td><%=resultSet.getInt(3) %></td> 
 			<td><%=resultSet.getString(4) %></td> 
                         <td><%=resultSet.getDesignation(5) %></td>
 		</tr>
 		 	 		<% } %>

 </table>
    
    
    
    