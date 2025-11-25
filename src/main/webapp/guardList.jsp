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
    <title>All Guards</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/tableStyle.css">
</head>
<body>

<!-- Header with Back button -->
<header class="header">
    <h1>All Guards</h1>
    <a href="adminDashboard.jsp" class="logout-btn"><i class="fas fa-arrow-left"></i> Back</a>
</header>

<!-- Guards Table -->
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Username</th>
        <th>Status</th>
        <th>Actions</th>
    </tr>

    <%
    Connection con = DBConnect.getConn();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM guards");

    while(rs.next()){
    %>
    <tr>
        <td><%=rs.getInt("gid")%></td>
        <td><%=rs.getString("name")%></td>
        <td><%=rs.getString("username")%></td>
        <td><%=rs.getString("status")%></td>
        <td>
            <a href="guardList.jsp?block=<%=rs.getInt("gid")%>">Block</a> |
            <a href="guardList.jsp?unblock=<%=rs.getInt("gid")%>">Unblock</a> |
            <a href="guardList.jsp?delete=<%=rs.getInt("gid")%>">Delete</a>
        </td>
    </tr>
    <%
    }
    %>
</table>

<%
if(request.getParameter("block") != null){
    int id = Integer.parseInt(request.getParameter("block"));
    PreparedStatement ps = con.prepareStatement("UPDATE guards SET status='blocked' WHERE gid=?");
    ps.setInt(1,id);
    ps.executeUpdate();
    response.sendRedirect("guardList.jsp");
}

if(request.getParameter("unblock") != null){
    int id = Integer.parseInt(request.getParameter("unblock"));
    PreparedStatement ps = con.prepareStatement("UPDATE guards SET status='active' WHERE gid=?");
    ps.setInt(1,id);
    ps.executeUpdate();
    response.sendRedirect("guardList.jsp");
}

if(request.getParameter("delete") != null){
    int id = Integer.parseInt(request.getParameter("delete"));
    PreparedStatement ps = con.prepareStatement("DELETE FROM guards WHERE gid=?");
    ps.setInt(1,id);
    ps.executeUpdate();
    response.sendRedirect("guardList.jsp");
}
%>

</body>
</html>
