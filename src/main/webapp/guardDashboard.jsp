<%
if(session.getAttribute("guard_id") == null){
    response.sendRedirect("guardLogin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Guard Dashboard</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Shared Dashboard CSS -->
    <link rel="stylesheet" href="css/adminDashboard.css">
</head>
<body>
    <!-- Header -->
    <header class="header">
        <h1>Welcome, <%= session.getAttribute("guard_name") %></h1>
        <a href="logout.jsp" class="logout-btn">Logout <i class="fas fa-sign-out-alt"></i></a>
    </header>

    <!-- Dashboard Grid -->
    <div class="dashboard-grid">
        <a href="addVisitor.jsp" class="dashboard-card">
            <i class="fas fa-user-plus"></i>
            <span>Add Visitor Entry</span>
        </a>
        <a href="visitorList.jsp" class="dashboard-card">
            <i class="fas fa-users"></i>
            <span>View Visitors</span>
        </a>
        <a href="pendingVisitors.jsp" class="dashboard-card">
            <i class="fas fa-clock"></i>
            <span>Pending Exit Visitors</span>
        </a>
        <a href="searchVisitor.jsp" class="dashboard-card">
            <i class="fas fa-search"></i>
            <span>Search Visitor</span>
        </a>
    </div>
</body>
</html>
