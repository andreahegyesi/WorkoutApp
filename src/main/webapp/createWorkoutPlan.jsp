<%@ page import="com.model.WorkoutPlan" %>
<%@ page import="com.repository.JpaWorkoutPlanRepository" %>
<%@ page import="com.model.User" %>
<%@ page import="com.repository.JpaUserRepository" %>
<%@ page import="java.util.*" %>
<%@ page import= "java.util.stream.Collectors" %>

<%
  String name = request.getParameter("name");
  List<Integer> exerciseItems = new ArrayList<>();

  JpaUserRepository userRepo = new JpaUserRepository();
  List <User> userList = new ArrayList<>();
  userList.add(userRepo.findUserById(Integer.parseInt(request.getSession().getAttribute("user_id").toString())));

  WorkoutPlan workoutPlan = new WorkoutPlan(name, exerciseItems, userList);
  JpaWorkoutPlanRepository workoutPlanRepo = new JpaWorkoutPlanRepository();
  workoutPlanRepo.addWorkoutPlan(workoutPlan);
  %>

    <meta http-equiv="Refresh" content="0; url='/WorkoutApp/showMyWorkouts.jsp" />