<%@ page import="com.model.CustomExercise" %>
<%@ page import="com.repository.JpaCustomExerciseRepository" %>

<%
  String name = request.getParameter("name");


  Exercise exercise = new Exercise(name);

  JpaCustomExerciseRepository customExerciseRepo = new JpaCustomExerciseRepository();

  customExerciseRepo.addCustomExercise(exercise);

%>

  <meta http-equiv="Refresh" content="0; url='/WorkoutApp" />