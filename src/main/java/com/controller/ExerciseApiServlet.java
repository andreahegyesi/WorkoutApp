package com.controller;

import com.google.gson.Gson;
import com.repository.JpaExerciseRepository;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ExercisesApi", urlPatterns = "/getExercisesApi")
public class ExerciseApiServlet extends HttpServlet {

    private final Gson gson = new Gson();
    private final JpaExerciseRepository exerciseRepository = new JpaExerciseRepository();
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response) throws IOException {

        var exercisesList = exerciseRepository.getAllExercises();
        String jsonOutput =  gson.toJson(exercisesList);

        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.print(jsonOutput);
        out.flush();
    }
}