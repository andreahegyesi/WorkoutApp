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
                            <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                        </a>
                        <a  href=<%= "deleteExerciseItemFromWorkoutPlan.jsp?id=" + exerciseItemRepo.findExerciseItemById(exerciseItemId).getId() %>>
                            <button type="button" class="btn btn-sm btn-outline-secondary">Remove from Workout Plan</button>
                        </a>
                    </div>
                    <small class="text-body-secondary">id=<%=exerciseItemRepo.findExerciseItemById(exerciseItemId).getId() %></small>
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