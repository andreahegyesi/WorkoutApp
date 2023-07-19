<%@ page import="com.model.CustomExercise" %>
<%@ page import="com.repository.JpaCustomExerciseRepository" %>
<%@ page import="java.util.*" %>

<% String id = request.getParameter("id");
   JpaCustomExerciseRepository repository = new JpaCustomExerciseRepository();
   repository.deleteCustomExercise(Integer.parseInt(id));
%>

  <meta http-equiv="Refresh" content="0; url='/WorkoutApp/showMyExercises.jsp" />