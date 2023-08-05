<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.repository.JpaCategoryRepository" %>
<%@ page import="com.repository.JpaWorkoutPlanRepository" %>
<%@ page import="com.repository.JpaExerciseItemRepository" %>
<%@ page import="com.model.Category" %>
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
                <a class="nav-link" href="showMyWorkouts.jsp">Workouts</a>
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

<h1>Choose workout plan. Add number of sets and repetitions.</h1>
<% String id = request.getParameter("id"); %>
<form action="addCustomExerciseToWorkoutPlan.jsp">

  <input type="hidden" class="form-control" name="id" value=<%=id%> >
  <div class="form-group w-50">
    <label for="exampleFormControlSelect1">Workout Plan</label>
    <select class="form-control" name = "workoutplan" id="exampleFormControlSelect1">
       <% JpaWorkoutPlanRepository workoutplanRepo = new JpaWorkoutPlanRepository();
       List<WorkoutPlan> workoutPlans = workoutplanRepo.getAllWorkoutPlans();
       for (WorkoutPlan workoutPlan : workoutPlans) { %>
            <option><%=workoutPlan.getName() %></option>
        <%}%>
    </select>
  </div>

    <div class="form-group w-50"">
      <label for="exampleFormControlTextarea1">Set</label>
      <input type="number"textarea class="form-control" name="set" id="exampleFormControlTextarea1" rows="1"></textarea>
    </div>

    <div class="form-group w-50"">
      <label for="exampleFormControlTextarea1">Repetition</label>
      <input type="number" textarea class="form-control" name="repetition" id="exampleFormControlTextarea1" rows="1"></textarea>
    </div>

  <br>
   <button type="submit" class="btn btn-primary">Add to my workout plan</button>
</form>

</body>
</html>
