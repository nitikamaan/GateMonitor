<%@ page import="java.sql.*, com.hostel.db.DBConnect" %>

<%
String msg = "";
if(request.getParameter("login") != null){
    String u = request.getParameter("username");
    String p = request.getParameter("password");

    Connection con = DBConnect.getConn();
    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM guards WHERE username=? AND password=? AND status='active'"
    );
    ps.setString(1, u);
    ps.setString(2, p);

    ResultSet rs = ps.executeQuery();
    if(rs.next()){
        session.setAttribute("guard_id", rs.getInt("gid"));
        session.setAttribute("guard_name", rs.getString("name"));
        response.sendRedirect("guardDashboard.jsp");
        return;
    } else {
        msg = "Invalid login!";
    }
}
%>

<link rel="stylesheet" href="css/login.css">

<div class="card">
    <h2>Guard Login</h2>

    <form method="post">
        <input type="text" name="username" placeholder="Username" required><br>
        <input type="password" name="password" placeholder="Password" required><br>

        <input type="submit" name="login" value="Login">
    </form>

    <% if(!msg.equals("")){ %>
        <p class="error"><%= msg %></p>
    <% } %>
</div>
