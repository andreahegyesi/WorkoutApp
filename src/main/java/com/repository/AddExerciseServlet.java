package com.repository;
import com.model.WgerExercise;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/addExercise")
public class AddExerciseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        JpaExerciseRepository repository = new JpaExerciseRepository();
        String name = req.getParameter("name");
        WgerExercise wgerExercise = new WgerExercise(name);
        repository.addExercise(wgerExercise);
        resp.getOutputStream().println("Added!");
    }
}