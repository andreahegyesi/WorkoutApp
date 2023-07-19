<%@ page import="com.model.WgerExercise" %>
<%@ page import="com.model.CustomExercise" %>
<%@ page import="com.repository.JpaWgerExerciseRepository" %>
<%@ page import="com.repository.JpaCustomExerciseRepository" %>

<% String id = request.getParameter("id");
   JpaWgerExerciseRepository repository = new JpaWgerExerciseRepository();
   WgerExercise exercise = repository.findWgerExerciseById(Integer.parseInt(id));
   CustomExercise customexercise = new CustomExercise(exercise.getName(), exercise.getCategory(), exercise.getDescription(), exercise.getMuscles(), exercise.getSecondaryMuscles(), exercise.getEquipment(), exercise.getImageSource());
   JpaCustomExerciseRepository customExerciseRepo = new JpaCustomExerciseRepository();
   customExerciseRepo.addCustomExercise(customexercise);
   response.sendRedirect("showMyExercises.jsp");
   %>

