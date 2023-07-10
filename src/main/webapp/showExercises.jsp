<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.repository.JpaExerciseRepository" %>
<%@ page import="com.repository.ExerciseToDatabase" %>
<%@ page import="com.model.Exercise" %>
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
                <a class="nav-link active" aria-current="page" href="showExercises.jsp">Exercises</a>
              </li>
    		  <li class="nav-item">
                <a class="nav-link" href="#">Workouts</a>
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
    <h1>List of exercises</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Category</th>
        </tr>
  <% JpaExerciseRepository repository = new JpaExerciseRepository();
      List<Exercise> exercises = repository.getAllExercises();
       if(exercises != null){
               for (Exercise exercise : exercises) { %>
                          <tr>
                              <td><%= exercise.getId() %></td>
                              <td><%= exercise.getName() %></td>
                              <td><%= exercise.getCategory().getName() %></td>
                          </tr>
                     <% }
        }
        else{%>
           <p> Table is empty </p>
        <%}%>
    </table>
<br/>
<br/>
         <form action="index.jsp">
             <input type="submit" value="Back to home page"/>
         </form>
</body>
</html>

