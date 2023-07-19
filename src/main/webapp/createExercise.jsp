<%@ page import="com.model.Category" %>
<%@ page import="com.model.Muscle" %>
<%@ page import="com.model.CustomExercise" %>
<%@ page import="com.repository.JpaCategoryRepository" %>
<%@ page import="com.repository.JpaMuscleRepository" %>
<%@ page import="com.repository.JpaCustomExerciseRepository" %>
<%@ page import="java.util.*" %>
<%@ page import= "java.util.stream.Collectors" %>

<%
  String name = request.getParameter("name");

  JpaCategoryRepository categoryRepository = new JpaCategoryRepository();
  Category category = categoryRepository.findCategoryByName(request.getParameter("category"));

  String description = request.getParameter("description");

  String[] muscles = request.getParameterValues("muscle");
  ArrayList<Integer> muscleArrayList = Arrays.stream(muscles)
            .map(Integer::parseInt)
            .collect(Collectors.toCollection(ArrayList::new));
  out.println(muscles.length);
  out.println(muscleArrayList);

  String[] secondaryMuscles = request.getParameterValues("secondarymuscle");
  ArrayList<Integer> secondaryMuscleArrayList = Arrays.stream(secondaryMuscles)
          .map(Integer::parseInt)
          .collect(Collectors.toCollection(ArrayList::new));
  out.println(secondaryMuscles.length);
  out.println(secondaryMuscleArrayList);

  String[] equipment = request.getParameterValues("equipment");
  ArrayList<Integer> equipmentArrayList = Arrays.stream(equipment)
          .map(Integer::parseInt)
          .collect(Collectors.toCollection(ArrayList::new));
  out.println(equipment.length);
  out.println(equipmentArrayList);

  CustomExercise customExercise = new CustomExercise(name,category,description,muscleArrayList,secondaryMuscleArrayList,equipmentArrayList, "UNDEFINED");
  JpaCustomExerciseRepository customExerciseRepo = new JpaCustomExerciseRepository();
  customExerciseRepo.addCustomExercise(customExercise);
%>
