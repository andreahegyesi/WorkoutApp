
<%@ page import="com.model.Exercise" %>
<%@ page import="com.repository.JpaExerciseRepository" %>

<%
  String name = request.getParameter("name");

  Exercise exercise = new Exercise(name);

  JpaExerciseRepository exerciseRepo = new JpaExerciseRepository();

  exerciseRepo.addExercise(exercise);

%>

  <meta http-equiv="Refresh" content="0; url='/WorkoutApp" />