

<%@page contentType="text/html" pageEncoding="UTF-8"
import="java.sql.Connection"
    import="java.sql.DriverManager"
    import="java.sql.ResultSet"
    import="java.sql.Statement"
    import="java.sql.SQLException"
%>

<%
    Connection conex=null;
    Statement sql=null;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        conex=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/pasarelabd1","root","1234");
        sql=conex.createStatement();
       
    }catch(Exception e){
       
    }
    
    %>