<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Form</title>
</head>
<body>

<%-- Check if the form is submitted --%>
<%
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    boolean isSubmitted = (name != null && age != null);
%>

<%-- Display the form if not submitted --%>
<% if (!isSubmitted) { %>
    <h2>Enter Your Details</h2>
    <form action="userForm.jsp" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>
        <label for="age">Age:</label>
        <input type="number" id="age" name="age" required><br><br>
        <input type="submit" value="Submit">
    </form>
<% } else { %>
    <h2>Submitted Information</h2>
    <p><strong>Name:</strong> <%= name %></p>
    <p><strong>Age:</strong> <%= age %></p>

    <%-- Display the current date and time --%>
    <p><strong>Current Date and Time:</strong> <%= new Date() %></p>

    <%-- Option to go back to the form --%>
    <form action="userForm.jsp" method="get">
        <input type="submit" value="Go Back">
    </form>
<% } %>

</body>
</html>
