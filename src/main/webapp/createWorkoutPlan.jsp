<%@ page import="com.model.WorkoutPlan" %>
<%@ page import="com.repository.JpaWorkoutPlanRepository" %>
<%@ page import="java.util.*" %>
<%@ page import= "java.util.stream.Collectors" %>

<%
  String name = request.getParameter("name");
  List<Integer> exerciseItems = new ArrayList<>();
  WorkoutPlan workoutPlan = new WorkoutPlan(name, exerciseItems);
  JpaWorkoutPlanRepository workoutPlanRepo = new JpaWorkoutPlanRepository();
  workoutPlanRepo.addWorkoutPlan(workoutPlan);
  %>

    <meta http-equiv="Refresh" content="0; url='/WorkoutApp/showMyWorkouts.jsp" />