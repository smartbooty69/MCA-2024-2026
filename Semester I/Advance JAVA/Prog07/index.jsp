<!DOCTYPE html>
<html>
<head>
    <title>GET and POST Example</title>
</head>
<body>

    <h2>Submit your Name</h2>

    <h3>Form for GET request:</h3>
    <form action="HandleForm.jsp" method="GET">
        <label for="username">Enter your name:</label>
        <input type="text" id="username" name="username" required>
        <input type="submit" value="Submit using GET">
    </form>

    <hr>

    <h3>Form for POST request:</h3>
    <form action="HandleForm.jsp" method="POST">
        <label for="username">Enter your name:</label>
        <input type="text" id="username" name="username" required>
        <input type="submit" value="Submit using POST">
    </form>

</body>
</html>