<%@ page import="com.model.Category" %>
<%@ page import="com.model.Muscle" %>
<%@ page import="com.model.CustomExercise" %>
<%@ page import="com.model.User" %>
<%@ page import="com.repository.JpaCategoryRepository" %>
<%@ page import="com.repository.JpaUserRepository" %>
<%@ page import="com.repository.JpaMuscleRepository" %>
<%@ page import="com.repository.JpaCustomExerciseRepository" %>
<%@ page import="java.util.*" %>
<%@ page import= "java.util.stream.Collectors" %>

<%
  String id = request.getParameter("id");

  String name = request.getParameter("name");

  JpaCategoryRepository categoryRepository = new JpaCategoryRepository();
  Category category = categoryRepository.findCategoryByName(request.getParameter("category"));

  String description = request.getParameter("description");

  String[] muscles = request.getParameterValues("muscle");
  Integer muscleId;
  ArrayList <Integer> muscleArrayList = new ArrayList<Integer>();
    for(String muscle: muscles){
     muscleId = Integer.parseInt(muscle);
     muscleArrayList.add(muscleId);
    }

  String[] secondaryMuscles = request.getParameterValues("secondarymuscle");
  Integer secondaryMuscleId;
    ArrayList <Integer> secondaryMuscleArrayList = new ArrayList<Integer>();
      for(String muscle: secondaryMuscles){
       secondaryMuscleId = Integer.parseInt(muscle);
       secondaryMuscleArrayList.add(secondaryMuscleId);
       }

  String[] equipments = request.getParameterValues("equipment");
    Integer equipmentId;
      ArrayList <Integer> equipmentArrayList = new ArrayList<Integer>();
        for(String equipment: equipments){
         equipmentId = Integer.parseInt(equipment);
         equipmentArrayList.add(equipmentId);
      }

   String imageSource = request.getParameter("imagesource");

   JpaUserRepository userRepo = new JpaUserRepository();
   List <User> userList = new ArrayList<>();
   userList.add(userRepo.findUserById(Integer.parseInt(request.getSession().getAttribute("user_id").toString())));

  JpaCustomExerciseRepository customExerciseRepo = new JpaCustomExerciseRepository();
  customExerciseRepo.updateCustomExercise(Integer.parseInt(id), name, category, description, muscleArrayList,secondaryMuscleArrayList,equipmentArrayList, imageSource, userList);
%>

  <meta http-equiv="Refresh" content="0; url='/WorkoutApp/showMyExercises.jsp" />