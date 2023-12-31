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
                <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="showWgerExercises.jsp">Exercises</a>
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
      </nav>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
      <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

   <main class="form-signin w-50 m-auto">
    <h1 class="h3 mb-3 fw-normal text-center" ><br>Welcome back!</h1>
    <img class="mb-4" src="/WorkoutApp/images/dumbbell.svg" alt="" width="72" height="72">
     <form action="login" method="post">
       <div class="form-floating">
         <input type="text" class="form-control" name="email" id="floatingInput" placeholder="name@example.com" required>
         <label for="floatingInput">Email address</label>
       </div>
       <div class="form-floating">
         <input type="password" class="form-control" name="password" id="floatingPassword" placeholder="Password" required><br>
         <label for="floatingPassword">Password</label>
       </div>
       <button class="btn btn-primary w-100 py-2" type="submit">Sign in</button>
     </form>

     <a  href= "createNewUser.jsp">
         <button class="btn btn-success w-100 py-2" type="submit">Create new account</button>
     </a>

      <p class="mt-5 mb-3 text-body-secondary">&copy; 2023 Hegyesi Andrea</p>
   </main>
</body>
</html>

