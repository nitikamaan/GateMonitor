<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Visitor Search</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/form.css">
</head>
<body>

<!-- Top Navbar -->
<div class="top-bar">
    <h2>Visitor Search Panel</h2>
    <a class="back-btn" href="guardDashboard.jsp"><i class="fas fa-arrow-left"></i> Back</a>
</div>

<div class="container">

    <!-- Results Table (Left) -->
    <div class="table-box">
        <h3>Search Results</h3>
        <table>
            <tr>
                <th>Visitor Name</th>
                <th>Date</th>
                <th>Mobile</th>
                <th>Student Name</th>
            </tr>

            <!-- Dynamic rows from JSP or servlet -->
        </table>
    </div>

    <!-- Search Form (Right, stacked inputs) -->
    <div class="search-box">
        <h3>Search Visitor</h3>
        <form action="SearchServlet" method="get">
            <label>Name:</label>
            <input type="text" name="name" placeholder="Enter visitor name">

            <label>Date:</label>
            <input type="date" name="date">

            <label>Mobile:</label>
            <input type="text" name="mobile" placeholder="Enter mobile number">
            <br><br>

            <button type="submit">Search</button>
        </form>
    </div>

</div>


</body>
</html>
