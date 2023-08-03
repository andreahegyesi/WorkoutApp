<%@ page import="com.model.ExerciseItem" %>
<%@ page import="com.model.WorkoutPlan" %>
<%@ page import="com.repository.JpaExerciseItemRepository" %>
<%@ page import="com.repository.JpaWorkoutPlanRepository" %>
<%@ page import="java.util.*" %>

<% String id = request.getParameter("id");
   JpaWorkoutPlanRepository workoutPlanRepo = new JpaWorkoutPlanRepository();
   workoutPlanRepo.deleteExerciseItemFromWorkoutPlan(3, Integer.parseInt(id));
%>

  <meta http-equiv="Refresh" content="0; url='/WorkoutApp/updateWorkoutPlan.jsp?id=3" />