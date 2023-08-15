<%@ page import="com.model.Category" %>
<%@ page import="com.model.Muscle" %>
<%@ page import="com.model.CustomExercise" %>
<%@ page import="com.model.ExerciseItem" %>
<%@ page import="com.model.WorkoutPlan" %>
<%@ page import="com.repository.JpaCategoryRepository" %>
<%@ page import="com.repository.JpaMuscleRepository" %>
<%@ page import="com.repository.JpaCustomExerciseRepository" %>
<%@ page import="com.repository.JpaExerciseItemRepository" %>
<%@ page import="com.repository.JpaWorkoutPlanRepository" %>
<%@ page import="java.util.*" %>
<%@ page import= "java.util.stream.Collectors" %>

<% String id = request.getParameter("id");

   JpaCustomExerciseRepository customRepository = new JpaCustomExerciseRepository();
   CustomExercise customExercise = customRepository.findCustomExerciseById(Integer.parseInt(id));

   JpaWorkoutPlanRepository workoutPlanRepo = new JpaWorkoutPlanRepository();
   int workoutPlanId = Integer.parseInt(request.getParameter("workoutplanId"));

   int set = Integer.parseInt(request.getParameter("set"));
   int repetition = Integer.parseInt(request.getParameter("repetition"));


   JpaExerciseItemRepository exerciseItemRepo = new JpaExerciseItemRepository();
   ExerciseItem exerciseItem = new ExerciseItem(customExercise, set, repetition);
   exerciseItemRepo.addExerciseItem(exerciseItem);

   workoutPlanRepo.addExerciseItemToWorkoutPlan(workoutPlanId,exerciseItem.getId());

   response.sendRedirect("showMyWorkouts.jsp");
   %>