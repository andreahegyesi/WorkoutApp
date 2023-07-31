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
   JpaExerciseItemRepository exerciseItemRepo = new JpaExerciseItemRepository();
   ExerciseItem exerciseItem = new ExerciseItem(customExercise, 4, 15);
   exerciseItemRepo.addExerciseItem(exerciseItem);
   JpaWorkoutPlanRepository workoutPlanRepo = new JpaWorkoutPlanRepository();
   workoutPlanRepo.addExerciseItemToWorkoutPlan(2,exerciseItem.getId());
   response.sendRedirect("showMyExercises.jsp");
   %>