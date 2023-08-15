package com.repository;
import com.model.WgerExercise;
import com.model.CustomExercise;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/addCustomExercise")
public class AddExerciseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String id = req.getParameter("Execute");
        System.out.println(id);
        JpaWgerExerciseRepository repository = new JpaWgerExerciseRepository();
        WgerExercise exercise = repository.findWgerExerciseById(Integer.parseInt(id));
        CustomExercise customexercise = new CustomExercise(exercise.getId(), exercise.getName(), exercise.getCategory(), exercise.getDescription(), exercise.getMuscles(), exercise.getSecondaryMuscles(), exercise.getEquipment(), exercise.getImageSource());
        JpaCustomExerciseRepository customExerciseRepo = new JpaCustomExerciseRepository();
        customExerciseRepo.addCustomExercise(customexercise);

        resp.getOutputStream().println("Added!");
        System.out.println("Button clicked! Java code executed.");

        getServletContext().getRequestDispatcher("/showWgerExercises.jsp").forward(req, resp);
        //req.getSession().getat
    }
}