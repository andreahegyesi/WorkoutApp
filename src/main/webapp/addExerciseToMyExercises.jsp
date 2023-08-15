<%@ page import="com.model.WgerExercise" %>
<%@ page import="com.model.CustomExercise" %>
<%@ page import="com.model.User" %>
<%@ page import="com.repository.JpaWgerExerciseRepository" %>
<%@ page import="com.repository.JpaCustomExerciseRepository" %>
<%@ page import="com.repository.JpaUserRepository" %>
<%@ page import="java.util.*" %>

<% String id = request.getParameter("id");
   JpaWgerExerciseRepository repository = new JpaWgerExerciseRepository();
   WgerExercise exercise = repository.findWgerExerciseById(Integer.parseInt(id));
   JpaUserRepository userRepo = new JpaUserRepository();
   List <User> userList = new ArrayList<>();
   userList.add(userRepo.findUserById(Integer.parseInt(request.getSession().getAttribute("user_id").toString())));
   CustomExercise customexercise = new CustomExercise(exercise.getName(), exercise.getCategory(), exercise.getDescription(), exercise.getMuscles(), exercise.getSecondaryMuscles(), exercise.getEquipment(), exercise.getImageSource(), userList);
   JpaCustomExerciseRepository customExerciseRepo = new JpaCustomExerciseRepository();
   customExerciseRepo.addCustomExercise(customexercise);
   response.sendRedirect("showMyExercises.jsp");
   %>

