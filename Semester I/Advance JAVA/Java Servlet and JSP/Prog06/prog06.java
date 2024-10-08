import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LifeCycleServlet extends HttpServlet {

    public LifeCycleServlet() {
        System.out.println("Servlet is being instantiated.");
    }

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        System.out.println("Servlet is being initialized.");
    }

    public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Servlet is servicing a request.");
        
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        out.println("<html><body>");
        out.println("<h1>Hello, World! This is the service() method in action.</h1>");
        out.println("</body></html>");
        
        out.close();
    }

    public void destroy() {
        System.out.println("Servlet is being destroyed.");
    }
}
