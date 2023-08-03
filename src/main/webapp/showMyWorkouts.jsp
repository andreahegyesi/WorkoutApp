<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.repository.JpaWorkoutPlanRepository" %>
<%@ page import="com.repository.JpaCustomExerciseRepository" %>
<%@ page import="com.repository.JpaExerciseItemRepository" %>
<%@ page import="com.repository.WgerApiReader" %>
<%@ page import="com.model.WorkoutPlan" %>
<%@ page import="com.model.ExerciseItem" %>
<html>
 <head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>Workout Application</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  </head>
<body>
    <nav class="navbar navbar-expand-sm navbar-dark bg-primary" aria-label="Third navbar example">
        <div class="container-fluid">
          <a class="navbar-brand" href="#">
             <img src="/WorkoutApp/images/dumbbell.svg" alt="Bootstrap" width="30" height="24"> Workout App</a>

          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarsExample03">
            <ul class="navbar-nav me-auto mb-2 mb-sm-0">
              <li class="nav-item">
                <a class="nav-link" href="index.jsp">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="showExercises.jsp">Exercises</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="showMyExercises.jsp">My Exercises</a>
              </li>
    		  <li class="nav-item">
                <a class="nav-link active" href="showMyWorkouts.jsp">Workouts</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">More</a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="#">About</a></li>
                  <li><a class="dropdown-item" href="#">Another action</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

    <h1>Create your own workout plans!</h1>

     <form action="createNewWorkoutPlan.jsp">
         <div class="form-outline mb-4">
     <br/>
     <input type="submit" value="Create new workout plan" class="btn btn-primary btn-block"/>
     </form>

<br>
<br>
<% JpaWorkoutPlanRepository workoutPlanRepo = new JpaWorkoutPlanRepository();
      List<WorkoutPlan> workoutplans = workoutPlanRepo.getAllWorkoutPlans();
       if(workoutplans != null){
               for (WorkoutPlan workoutplan : workoutplans) { %>
<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-5 align-items-center justify-content-center">
  <div class="list-group">
    <a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
      <img src="/WorkoutApp/images/dumbbell.svg" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
      <div class="d-flex gap-2 w-100 justify-content-between">
        <div>
          <h6 class="mb-0"><%= workoutplan.getName() %></h6>
          <%JpaCustomExerciseRepository customExerciseRepo = new JpaCustomExerciseRepository();
          JpaExerciseItemRepository exerciseItemRepo = new JpaExerciseItemRepository();
          for(Integer exerciseItemId: workoutplan.getExerciseItems()){ %>
          <p class="mb-0 opacity-75"><%=exerciseItemRepo.findExerciseItemById(exerciseItemId).getCustomExercise().getName() + ": " +
                                       exerciseItemRepo.findExerciseItemById(exerciseItemId).getSet() + "x" +
                                       exerciseItemRepo.findExerciseItemById(exerciseItemId).getRepetition()%></p>
          <%}%>
        </div>
      </div>
   </div>
                        <% }
           }
           else{%>
              <p> No workout plans </p>
           <%}%>
</body>
</html>

