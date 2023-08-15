<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.repository.JpaWorkoutPlanRepository" %>
<%@ page import="com.repository.JpaCustomExerciseRepository" %>
<%@ page import="com.repository.JpaExerciseItemRepository" %>
<%@ page import="com.repository.WgerApiReader" %>
<%@ page import="com.model.WorkoutPlan" %>
<%@ page import="com.model.ExerciseItem" %>
<% String id = request.getParameter("id");
   JpaWorkoutPlanRepository workoutPlanRepo = new JpaWorkoutPlanRepository();
   WorkoutPlan workoutPlan = workoutPlanRepo.findWorkoutPlanById(Integer.parseInt(id));
%>
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

<div class="album py-2 bg-body-tertiary">
    <div class="container">
    <div class="px-4 py-2 my-2 text-center">
    <img class="d-block mx-auto mb-4" src="/WorkoutApp/images/dumbbell.svg" alt="" width="72" height="57">
    <h1 class="display-5 fw-bold text-body-emphasis"><%= workoutPlan.getName()%></h1>
    </div>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <% JpaExerciseItemRepository exerciseItemRepo = new JpaExerciseItemRepository();
            List<Integer> exerciseItems = workoutPlan.getExerciseItems();
            if(exerciseItems != null){
               for(Integer exerciseItemId: exerciseItems){%>
                    <div class="col">
                    <div class="card">
                    <%if (exerciseItemRepo.findExerciseItemById(exerciseItemId).getCustomExercise().getImageSource().equals("UNDEFINED")){%>
                    <img class="card-img-top" src ="/WorkoutApp/images/no-image.svg" alt="Image placeholder" style="object-fit:cover; width:360px; height:300px;">
                    <%}else{%>
                    <img class="card-img-top"  src=<%= exerciseItemRepo.findExerciseItemById(exerciseItemId).getCustomExercise().getImageSource() %> alt="Image placeholder" style="object-fit:contain; width:360px; height:300px;">
                    <%}%>
                    <div class="card-body">
                        <h5 class="card-title"><%=exerciseItemRepo.findExerciseItemById(exerciseItemId).getCustomExercise().getName() %></h5>
                        <h6 class="card-title"><%=exerciseItemRepo.findExerciseItemById(exerciseItemId).getSet() + " sets" %></h6>
                        <h6 class="card-title"><%=exerciseItemRepo.findExerciseItemById(exerciseItemId).getRepetition() + " repetitions" %></h6>
                        <div class="d-flex gap-2 py-2">
                        <span class="badge text-bg-primary rounded-pill"><p class="card-text"><%=exerciseItemRepo.findExerciseItemById(exerciseItemId).getCustomExercise().getCategory().getName() %></p></span>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                        <a  href=<%= "viewCustomExercise.jsp?id=" + exerciseItemRepo.findExerciseItemById(exerciseItemId).getCustomExercise().getId()%>>
                            <button type="button" class="btn btn-sm btn-outline-primary">View</button>
                        </a>
                        <a  href=<%= "deleteExerciseItemFromWorkoutPlan.jsp?id=" + exerciseItemRepo.findExerciseItemById(exerciseItemId).getId() + "&wid=" + workoutPlan.getId()%>>
                            <button type="button" class="btn btn-sm btn-outline-danger">Remove from Workout Plan</button>
                        </a>
                    </div>
                    <small class="text-body-secondary"><%=exerciseItemRepo.findExerciseItemById(exerciseItemId).getId() %></small>
                    </div>
                       </div>
                          </div>
                            </div>
                     <% }
        }
        else{%>
           <p> No content </p>
        <%}%>
     </div>
     </div>
      </div>

      <br/>
      <br/>
               <form action="showMyWorkouts.jsp">
                   <input type="submit" value="Back to my workouts"/>
               </form>
</body>
</html>