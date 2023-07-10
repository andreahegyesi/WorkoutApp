
<%@ page import="com.model.WgerExercise" %>
<%@ page import="com.repository.JpaWgerExerciseRepository" %>

<%
  String name = request.getParameter("name");

  Exercise exercise = new Exercise(name);

  JpaExerciseRepository exerciseRepo = new JpaExerciseRepository();

  exerciseRepo.addExercise(exercise);

%>

  <meta http-equiv="Refresh" content="0; url='/WorkoutApp" />