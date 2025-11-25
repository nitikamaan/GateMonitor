<%@ page import="java.sql.*, com.hostel.db.DBConnect" %>
<%
if(session.getAttribute("guard_id") == null){
    response.sendRedirect("guardLogin.jsp");
    return;
}

String msg = "";

if(request.getParameter("save") != null){

    String vname = request.getParameter("visitor_name");
    String phone = request.getParameter("phone");
    String sname = request.getParameter("student_name");
    String room = request.getParameter("room_no");
    int gid = (int) session.getAttribute("guard_id");

    Connection con = DBConnect.getConn();
    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO visitors(visitor_name, phone, student_name, room_no, guard_id) VALUES (?,?,?,?,?)"
    );

    ps.setString(1, vname);
    ps.setString(2, phone);
    ps.setString(3, sname);
    ps.setString(4, room);
    ps.setInt(5, gid);

    ps.executeUpdate();
    msg = "Visitor Added Successfully!";
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Visitor</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/dashboardForm.css">
</head>
<body>

<header class="header">
    <h1>ADD VISITOR</h1>
    <a href="guardDashboard.jsp" class="logout-btn"><i class="fas fa-arrow-left"></i> Back</a>
</header>

<div class="form-grid">
    <div class="card">
        <form method="post">

            <div class="input-group">
                <i class="fas fa-user"></i>
                <input type="text" name="visitor_name" placeholder="Visitor Name" required>
            </div>

            <div class="input-group">
                <i class="fas fa-phone"></i>
                <input type="text" name="phone" placeholder="Phone Number" required>
            </div>

            <div class="input-group">
                <i class="fas fa-user-graduate"></i>
                <input type="text" name="student_name" placeholder="Student Name" required>
            </div>

            <div class="input-group">
                <i class="fas fa-door-closed"></i>
                <input type="text" name="room_no" placeholder="Room Number" required>
            </div>

            <input type="submit" name="save" value="Add Visitor">
        </form>

        <% if(!msg.equals("")) { %>
            <p class="success"><%= msg %></p>
        <% } %>

    </div>
</div>

</body>
</html>
