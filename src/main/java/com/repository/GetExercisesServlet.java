package com.repository;
import com.model.WgerExercise;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
@WebServlet("/exercises")
public class GetExercisesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        JpaWgerExerciseRepository repository = new JpaWgerExerciseRepository();
        List<WgerExercise> wgerExercises = repository.getAllExercises();
        resp.setContentType("text/html");
        resp.getWriter().println("<html>");
        resp.getWriter().println("<head><title>Exercise List From DO GET method</title></head>");
        resp.getWriter().println("<body>");
        resp.getWriter().println("<h1>Exercise List From DO GET method</h1>");
        resp.getWriter().println("<table border=\"1\">");
        resp.getWriter().println("<tr><th>ID</th><th>Name</th></tr>");
        for (WgerExercise wgerExercise : wgerExercises) {
            resp.getWriter().println("<tr>");
            resp.getWriter().println("<td>" + wgerExercise.getId() + "</td>");
            resp.getWriter().println("<td>" + wgerExercise.getName() + "</td>");
            resp.getWriter().println("</tr>");
        }
        resp.getWriter().println("</table>");
        resp.getWriter().println("</body>");
        resp.getWriter().println("</html>");
    }
}