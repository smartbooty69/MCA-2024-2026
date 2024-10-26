<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Session Management with Cookies</title>
</head>
<body>

<%
    String username = null;
    String email = null;

    Cookie[] cookies = request.getCookies();

    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("username".equals(cookie.getName())) {
                username = cookie.getValue();
            }
            if ("email".equals(cookie.getName())) {
                email = cookie.getValue();
            }
        }
    }

    if (username != null && email != null) {
%>
        <h2>Welcome back, <%= username %>!</h2>
        <p>Your email: <%= email %></p>
<%
    } else {
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            username = request.getParameter("username");
            email = request.getParameter("email");

            if (username != null && email != null) {
                Cookie userCookie = new Cookie("username", username);
                Cookie emailCookie = new Cookie("email", email);

                userCookie.setMaxAge(60 * 60 * 24);
                emailCookie.setMaxAge(60 * 60 * 24);

                response.addCookie(userCookie);
                response.addCookie(emailCookie);

                response.sendRedirect("session.jsp");
            }
        } else {
%>
        <h2>Enter Your Details</h2>
        <form action="session.jsp" method="post">
            Name: <input type="text" name="username" required><br><br>
            Email: <input type="email" name="email" required><br><br>
            <input type="submit" value="Submit">
        </form>
<%
        }
    }
%>

</body>
</html>
