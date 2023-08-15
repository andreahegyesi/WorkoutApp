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
                <a class="nav-link" href="showWgerExercises.jsp">Exercises</a>
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
                  <li><a class="dropdown-item" href="showUsers.jsp">List of users</a></li>
                  <li><a class="dropdown-item" href="showExercises.jsp">List of exercises</a></li>
                  <li><a class="dropdown-item" href="about.jsp">About</a></li>
                </ul>
              </li>
             <% String user = "";
              if (request.getSession().getAttribute("user_id") != null) {
                     user = request.getSession().getAttribute("user").toString();   %>
                  <li class="nav-item">
                      <a class="nav-link" href="logout.jsp">Logout</a>
                  </li> <% } %>
            </ul>
          </div>

                       <span class="badge badge-secondary">
                            <%= user %>
                          </span>
          </div>
        </div>
      </nav>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

    <h1>Your workout plans:</h1>

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
               for (WorkoutPlan workoutPlan : workoutplans) { %>
<div class="card" style="width: 18rem;">
  <div class="card-body">
    <h5 class="card-title"><%= workoutPlan.getName() %></h5>
    <%JpaCustomExerciseRepository customExerciseRepo = new JpaCustomExerciseRepository();
      JpaExerciseItemRepository exerciseItemRepo = new JpaExerciseItemRepository();
      for(Integer exerciseItemId: workoutPlan.getExerciseItems()){ %>
    <p class="card-text"><%=exerciseItemRepo.findExerciseItemById(exerciseItemId).getCustomExercise().getName() + ": " +
                            exerciseItemRepo.findExerciseItemById(exerciseItemId).getSet() + "x" +
                            exerciseItemRepo.findExerciseItemById(exerciseItemId).getRepetition()%></p>
     <%}%>
    <a href=<%="updateWorkoutPlan.jsp?id=" + workoutPlan.getId() %> class="btn btn-sm btn-outline-secondary">View&Update</a>
    <a href=<%="deleteWorkoutPlan.jsp?id=" + workoutPlan.getId() %> class="btn btn-sm btn-outline-secondary">Delete</a>
  </div>
</div>
        <%}
        }else{%>
              <p> No workout plans </p>
           <%}%>
</body>
</html>

