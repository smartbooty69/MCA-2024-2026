import java.io.*;

public class LifeCycleServlet extends HttpServlet {

    public LifeCycleServlet() {
        System.out.println("Servlet is being instantiated");
    }

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        System.out.println("Servlet is being instantiated");
    }

    public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Servlet is servicing a request.");

        PrintWriter out = resp.getWriter();
        out.println("Hello, World! This is the service() method.");
        out.close();
    }

    public void destroy() {
        System.out.println("Servlet is being destroyed");
    }
}