<%@ page import="com.model.WorkoutPlan" %>
<%@ page import="com.repository.JpaWorkoutPlanRepository" %>
<%@ page import="java.util.*" %>

<% String id = request.getParameter("id");
   JpaWorkoutPlanRepository workoutPlanRepo = new JpaWorkoutPlanRepository();
   workoutPlanRepo.deleteWorkoutPlan(Integer.parseInt(id));
%>

  <meta http-equiv="Refresh" content="0; url='/WorkoutApp/showMyWorkouts.jsp" />