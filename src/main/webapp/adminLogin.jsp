<%@ page import="java.sql.*, com.hostel.db.DBConnect" %>
<%
String msg = "";

if(request.getParameter("login") != null){
    String u = request.getParameter("username");
    String p = request.getParameter("password");

    Connection con = DBConnect.getConn();
    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM admin WHERE username=? AND password=?"
    );
    ps.setString(1, u);
    ps.setString(2, p);

    ResultSet rs = ps.executeQuery();
    if(rs.next()){
        session.setAttribute("admin", u);
        response.sendRedirect("adminDashboard.jsp");
        return;
    } else {
        msg = "Invalid Admin Credentials!";
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>

    <!-- Google Font used in style.css -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">

    <!-- Link to the shared style.css -->
    <link rel="stylesheet" href="css/login.css">
</head>
<body>

    <div class="card">
        <h2>Admin Login</h2>

        <form method="post">
            <input type="text" name="username" placeholder="Username" required><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <input type="submit" name="login" value="Login">
        </form>

        <% if(!msg.equals("")){ %>
            <p class="error"><%= msg %></p>
        <% } %>
    </div>

</body>
</html>
