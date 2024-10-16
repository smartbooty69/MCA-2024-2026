import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class SessionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        resp.setContentType("text/html");

        Cookie[] cookies = req.getCookies();
        String username = null;
        String email = null;

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
            out.println("<h2>Welcome back, " + username + "!</h2>");
            out.println("<p>Your email: " + email + "</p>");
        } else {
            out.println("<h2>Enter Your Details</h2>");
            out.println("<form action='SessionServlet' method='post'>");
            out.println("Name: <input type='text' name='username'><br>");
            out.println("Email: <input type='email' name='email'><br>");
            out.println("<input type='submit' value='Submit'>");
            out.println("</form>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String username = req.getParameter("username");
        String email = req.getParameter("email");

        Cookie userCookie = new Cookie("username", username);
        Cookie emailCookie = new Cookie("email", email);

        userCookie.setMaxAge(60 * 60 * 24); 
        emailCookie.setMaxAge(60 * 60 * 24); 

        resp.addCookie(userCookie);
        resp.addCookie(emailCookie);
        
        resp.sendRedirect("SessionServlet");
    }
}
