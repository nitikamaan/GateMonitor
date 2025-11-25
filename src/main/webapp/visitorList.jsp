<%@ page import="java.sql.*, com.hostel.db.DBConnect" %>
<%
if(session.getAttribute("guard_id") == null){
    response.sendRedirect("guardLogin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Visitor List</title>
    <link rel="stylesheet" href="css/tableStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<!-- Header Bar -->
<header class="header">
    <h1>Welcome, <%= session.getAttribute("guard_name") %></h1>
    <a href="guardDashboard.jsp" class="logout-btn"><i class="fas fa-arrow-left"></i> Back</a>
</header>

<h2>VISITORS LIST</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Phone</th>
        <th>Student</th>
        <th>Room</th>
        <th>Entry Time</th>
        <th>Exit Time</th>
        <th>Action</th>
    </tr>

<%
Connection con = DBConnect.getConn();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM visitors ORDER BY vid DESC");

while(rs.next()){
%>
    <tr>
        <td><%=rs.getInt("vid")%></td>
        <td><%=rs.getString("visitor_name")%></td>
        <td><%=rs.getString("phone")%></td>
        <td><%=rs.getString("student_name")%></td>
        <td><%=rs.getString("room_no")%></td>
        <td><%=rs.getString("entry_time")%></td>
        <td><%=rs.getString("exit_time")%></td>
        <td>
            <% if(rs.getString("exit_time") == null){ %>
                <a href="visitorList.jsp?exit=<%=rs.getInt("vid")%>">Mark Exit</a>
            <% } %>
        </td>
    </tr>
<%
}
%>
</table>

<%
if(request.getParameter("exit") != null){
    int id = Integer.parseInt(request.getParameter("exit"));
    PreparedStatement ps2 = con.prepareStatement(
        "UPDATE visitors SET exit_time=NOW() WHERE vid=?"
    );
    ps2.setInt(1,id);
    ps2.executeUpdate();
    response.sendRedirect("visitorList.jsp");
}
%>

</body>
</html>
