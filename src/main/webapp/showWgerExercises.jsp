<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.repository.JpaWgerExerciseRepository" %>
<%@ page import="com.repository.WgerApiReader" %>
<%@ page import="com.model.WgerExercise" %>
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
                <a class="nav-link" aria-current="page" href="index.jsp">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="showWgerExercises.jsp">Exercises</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="showMyExercises.jsp">My Exercises</a>
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


      <div class="album py-5 bg-body-tertiary">
        <div class="container">

          <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
  <% JpaWgerExerciseRepository repository = new JpaWgerExerciseRepository();
      List<WgerExercise> exercises = repository.getAllExercises();
       if(exercises != null){
               for (WgerExercise exercise : exercises) { %>

                           <div class="col">
                                    <div class="card">
                                    <%if (exercise.getImageSource().equals("UNDEFINED")){%>
                                      <img class="card-img-top" src ="/WorkoutApp/images/no-image.svg" alt="Image placeholder" style="object-fit:cover; width:360px; height:300px;">
                                      <%}else{%>
                                      <img class="card-img-top"  src=<%= exercise.getImageSource() %> alt="Image placeholder" style="object-fit:contain; width:360px; height:300px;">
                                      <%}%>
                                      <div class="card-body">
                                      <h5 class="card-title"><%= exercise.getName() %></h5>
                                      <div class="d-flex gap-2 py-2">
                                      <span class="badge text-bg-primary rounded-pill"><p class="card-text"><%= exercise.getCategory().getName() %></p></span>
                                       </div>
                                        <div class="d-flex justify-content-between align-items-center">
                                          <div class="btn-group">
                                            <a  href=<%= "viewWgerExercise.jsp?id=" + exercise.getId() %>>
                                                <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                            </a>
                                            <a  href=<%= "addExerciseToMyExercises.jsp?id=" + exercise.getId() %>>
                                            <button type="submit" class="btn btn-sm btn-outline-secondary">Add to My Exercises</button>
                                            </a>

                                          </div>
                                          <small class="text-body-secondary">id=<%=exercise.getId() %></small>
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
      <h2>Sync exercise library </h2>

    <form action="" method="POST">
        <br/>
        <input type="submit" name="syncExerciseLibrary" value="Read exercise from WGER" class="btn btn-primary btn-block"/>
    </form>

        <%
            if (request.getParameter("syncExerciseLibrary") != null) {
                WgerApiReader wgerApiReader = new WgerApiReader();
                ArrayList<WgerExercise> generatedExercises = wgerApiReader.getExercisesFromWGER();
                JpaWgerExerciseRepository exerciseRepo = new JpaWgerExerciseRepository();
                exerciseRepo.addExercise(generatedExercises);
            }
        %>
<br/>
<br/>
         <form action="index.jsp">
             <input type="submit" value="Back to home page"/>
         </form>
</body>
</html>

