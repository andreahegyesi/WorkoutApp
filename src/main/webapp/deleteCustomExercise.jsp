<%@ page import="com.model.CustomExercise" %>
<%@ page import="com.model.ExerciseItem" %>
<%@ page import="com.repository.JpaCustomExerciseRepository" %>
<%@ page import="com.repository.JpaExerciseItemRepository" %>
<%@ page import="java.util.*" %>

<%@ page isErrorPage = "true" %>

<% String id = request.getParameter("id");
   JpaCustomExerciseRepository customExerciseRepo = new JpaCustomExerciseRepository();
   JpaExerciseItemRepository exerciseItemRepo = new JpaExerciseItemRepository();
   customExerciseRepo.deleteCustomExercise(Integer.parseInt(id));%>

  <meta http-equiv="Refresh" content="0; url='/WorkoutApp/showMyExercises.jsp" />

