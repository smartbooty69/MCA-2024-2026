<!DOCTYPE html>
<html>
<head>
    <title>Handle Form</title>
</head>
<body>

    <h2>Form Submission Result</h2>

    <%
        String method = request.getMethod();
        String username = request.getParameter("username");

        if (method.equalsIgnoreCase("GET")) {
            out.println("You submitted using GET: " + username);
        } else if (method.equalsIgnoreCase("POST")) {
            out.println("You submitted using POST: " + username);
        } else {
            out.println("Unknown request method.");
        }
    %>

</body>
</html>

