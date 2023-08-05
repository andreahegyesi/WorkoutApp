<%@ page import="com.model.ExerciseItem" %>
<%@ page import="com.model.WorkoutPlan" %>
<%@ page import="com.repository.JpaExerciseItemRepository" %>
<%@ page import="com.repository.JpaWorkoutPlanRepository" %>
<%@ page import="java.util.*" %>

<% String id = request.getParameter("id");
   String wid = request.getParameter("wid");
   JpaWorkoutPlanRepository workoutPlanRepo = new JpaWorkoutPlanRepository();
   workoutPlanRepo.deleteExerciseItemFromWorkoutPlan(3, Integer.parseInt(id));

   JpaExerciseItemRepository exerciseItemRepo = new JpaExerciseItemRepository();
   exerciseItemRepo.deleteExerciseItem(Integer.parseInt(id));

   response.sendRedirect("updateWorkoutPlan.jsp?id=" + wid);
%>