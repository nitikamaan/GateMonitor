<%
if(session.getAttribute("admin") == null){
    response.sendRedirect("adminLogin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Dashboard CSS -->
    <link rel="stylesheet" href="css/adminDashboard.css">
</head>
<body>

    <header class="header">
        <h1>Welcome, <%= session.getAttribute("admin") %></h1>
        <a href="logout.jsp" class="logout-btn">Logout <i class="fas fa-sign-out-alt"></i></a>
    </header>


    <div class="dashboard-grid">
        <a href="addGuard.jsp" class="dashboard-card">
            <i class="fas fa-user-plus"></i>
            <span>Add Guard</span>
        </a>
        <a href="guardList.jsp" class="dashboard-card">
            <i class="fas fa-users"></i>
            <span>View Guards</span>
        </a>
        <a href="visitorsAll.jsp" class="dashboard-card">
            <i class="fas fa-book"></i>
            <span>All Visitors Log</span>
        </a>
        <a href="searchVisitor.jsp" class="dashboard-card">
            <i class="fas fa-search"></i>
            <span>Search Visitor</span>
        </a>
        <a href="pendingVisitors.jsp" class="dashboard-card">
            <i class="fas fa-clock"></i>
            <span>Pending Exit Visitors</span>
        </a>
    </div>
</body>
</html>
