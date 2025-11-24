<%@ page import="java.sql.*" %>

<%
String url = "jdbc:mysql://localhost:3306/aimlb";      // Database name
        String user = "root";                           // MySQL username
        String password = "admin";                      // MySQL password
            // Load the MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish Connection
            Connection conn = DriverManager.getConnection(url, user, password);
%>