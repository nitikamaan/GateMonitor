<%@ page import="java.sql.*, com.hostel.db.DBConnect" %>
<%
if(session.getAttribute("guard_id") == null && session.getAttribute("admin") == null){
    response.sendRedirect("guardLogin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Visitors Pending Exit</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/tableStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<header class="header">
    <h1>Visitors Pending Exit</h1>
    <a href="adminDashboard.jsp" class="logout-btn"><i class="fas fa-arrow-left"></i> Back</a>
</header>

<table>
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Student</th>
    <th>Entry</th>
</tr>

<%
Connection con = DBConnect.getConn();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM visitors WHERE exit_time IS NULL");

while(rs.next()){
%>
<tr>
    <td><%=rs.getInt("vid")%></td>
    <td><%=rs.getString("visitor_name")%></td>
    <td><%=rs.getString("student_name")%></td>
    <td><%=rs.getString("entry_time")%></td>
</tr>
<%
}
%>
</table>

</body>
</html>
