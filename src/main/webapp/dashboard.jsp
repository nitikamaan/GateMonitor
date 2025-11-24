<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Portal Dashboard</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>

<div class="container">

  <!-- Sidebar -->
  <aside class="sidebar">
    <h2>Student Portal</h2>
    <ul class="nav">
      <li><a href="#" class="active"> Dashboard</a></li>
      <li><a href="#"> Profile</a></li>
      <li><a href="#"> Results</a></li>
      <li><a href="#"> Attendance</a></li>
      <li><a href="updatepass.jsp">Update Password</a></li>
      <li><a href="#"> Messages</a></li>
      <li><a href="logout.jsp">Logout</a></li>
    </ul>
  </aside>

  <!-- Main Content -->
  <main class="main-content">

    <!-- Topbar -->
    <header class="topbar">
      <%
        String mob,pass;
        mob=(String) session.getAttribute("smob");
        pass=(String) session.getAttribute("spass");
        out.print("<h1>Welcome :"+mob+"</h1>");

      %>
      <%
       String url = "jdbc:mysql://localhost:3306/aimlb"; // Database name
               String user = "root";                           // MySQL username
               String password = "admin";                      // MySQL password
               try {
                   //  Load the MySQL Driver
                   Class.forName("com.mysql.cj.jdbc.Driver");

                   // Establish Connection
                   Connection conn = DriverManager.getConnection(url, user, password);

                   // Execute a query
                   Statement stmt = conn.createStatement();
                   ResultSet rs = stmt.executeQuery("SELECT * FROM student");

                   // Process the result set
                   while (rs.next()) {
                      if(rs.getString("mobile").equals(mob))
                      {
                        out.println(rs.getString("cgpa"));
                      }
                   }
               }
               catch (Exception e)
               {
                   out.println(e.getMessage());
               }
      %>
      <div class="student-info">
        <span>Roll No: 2400291530122</span>
        <span>Branch: CSE (AI & ML)</span>
      </div>
    </header>

    <!-- Dashboard Cards -->
    <section class="cards">
      <div class="card">
        <h3>Attendance</h3>
        <p>87%</p>
      </div>
      <div class="card">
        <h3>Assignments</h3>
        <p>5 Pending</p>
      </div>
      <div class="card">
        <h3>CGPA</h3>
        <p>8.75</p>
      </div>
      <div class="card">
        <h3>Upcoming Exam</h3>
        <p>MSE 2 - 15th Nov</p>
      </div>
    </section>

    <!-- Recent Activity -->
    <section class="activity">
      <h2>Recent Updates</h2>
      <ul>
        <li>✔ CA2 Marks Uploaded for Web Development</li>
        <li>🗓 Portal reopened for late admission students</li>
        <li>📢 New Notice: Hackathon Registration Open</li>
      </ul>
    </section>

  </main>
</div>

</body>
</html>