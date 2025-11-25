<%@ page import="java.sql.*, com.hostel.db.DBConnect" %>
<%
if(session.getAttribute("admin") == null){
    response.sendRedirect("adminLogin.jsp");
    return;
}

String msg = "";

if(request.getParameter("add") != null){
    String name = request.getParameter("name");
    String username = request.getParameter("username");
    String pass = request.getParameter("password");

    Connection con = DBConnect.getConn();
    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO guards(name, username, password, status) VALUES(?,?,?, 'active')"
    );
    ps.setString(1, name);
    ps.setString(2, username);
    ps.setString(3, pass);
    ps.executeUpdate();
    msg = "Guard Added Successfully!";
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Guard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/dashboardForm.css">
</head>
<body>
    <header class="header">
        <h1>Add Guard</h1>
        <a href="adminDashboard.jsp" class="logout-btn"><i class="fas fa-arrow-left"></i> Back</a>
    </header>

    <div class="form-grid">
        <div class="card">
            <form method="post">
                <div class="input-group">
                    <i class="fas fa-user"></i>
                    <input type="text" name="name" placeholder="Guard Name" required>
                </div>

                <div class="input-group">
                    <i class="fas fa-id-badge"></i>
                    <input type="text" name="username" placeholder="Username" required>
                </div>

                <div class="input-group">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="password" placeholder="Password" required>
                </div>

                <input type="submit" name="add" value="Add Guard">
            </form>

            <% if(!msg.equals("")){ %>
                <p class="success"><%= msg %></p>
            <% } %>
        </div>
    </div>
</body>
</html>
