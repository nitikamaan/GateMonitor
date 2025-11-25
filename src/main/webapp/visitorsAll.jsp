<%@ page import="java.sql.*, com.hostel.db.DBConnect" %>
<%
if(session.getAttribute("admin") == null){
    response.sendRedirect("adminLogin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>All Visitors Log</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/tableStyle.css">
</head>
<body>

<!-- Header with Back Button -->
<header class="header">
    <h1>All Visitors Log</h1>
    <a href="adminDashboard.jsp" class="logout-btn"><i class="fas fa-arrow-left"></i> Back</a>
</header>

<!-- Visitors Table -->
<table>
<tr>
    <th>ID</th>
    <th>Visitor</th>
    <th>Phone</th>
    <th>Student</th>
    <th>Room</th>
    <th>Entry</th>
    <th>Exit</th>
    <th>Guard</th>
</tr>

<%
Connection con = DBConnect.getConn();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(
  "SELECT v.*, g.name AS gname FROM visitors v JOIN guards g ON v.guard_id=g.gid ORDER BY vid DESC"
);

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
    <td><%=rs.getString("gname")%></td>
</tr>
<%
}
%>
</table>

</body>
</html>
