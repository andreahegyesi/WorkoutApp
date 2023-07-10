<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.repository.JpaExerciseRepository" %>
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
                <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="showExerciseCards.jsp">Exercises</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">My Exercises</a>
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


   <main class="form-signin w-50 m-auto">
     <form>
        <h3 class="h3 mb-3 fw-normal" >Welcome back!</h3>
       <img class="mb-4" src="/WorkoutApp/images/dumbbell.svg" alt="" width="72" height="57">
       <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

       <div class="form-floating">
         <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
         <label for="floatingInput">Email address</label>
       </div>
       <div class="form-floating">
         <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
         <label for="floatingPassword">Password</label>
       </div>

       <div class="form-check text-start my-3">
         <input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
         <label class="form-check-label" for="flexCheckDefault">
           Remember me
         </label>
       </div>
       <button class="btn btn-primary w-100 py-2" type="submit">Sign in</button>
       <p class="mt-5 mb-3 text-body-secondary">&copy; 2017–2023</p>
     </form>
   </main>
   <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

    <%
        if (request.getParameter("syncExerciseLibrary") != null) {
            WgerApiReader wgerApiReader = new WgerApiReader();
            ArrayList<WgerExercise> generatedExercises = wgerApiReader.getExercisesFromWGER();
            JpaExerciseRepository exerciseRepo = new JpaExerciseRepository();
            exerciseRepo.addExercise(generatedExercises);

    %>



    <%
        }
    %>

        <h2>Show all exercises</h2>

            <form action="showExercises.jsp">
                <div class="form-outline mb-4">
            <br/>
            <input type="submit" value="Show all exercises" class="btn btn-primary btn-block"/>
            </form>

</body>
</html>

