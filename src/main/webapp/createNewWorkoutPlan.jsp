<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.repository.JpaWorkoutPlanRepository" %>
<%@ page import="com.model.WorkoutPlan" %>

<html>
<head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>Workout Application</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  </head>
<body>
<h1>Create your own workout plan!</h1>
<form action="createWorkoutPlan.jsp">
  <div class="form-group w-50 " >
    <label for="exampleFormControlInput1">Name</label>
    <input type="text" class="form-control" name = "name" id="exampleFormControlInput1" placeholder="Workout plan name">
  </div>
    <br>
     <button type="submit" class="btn btn-primary">Create workout plan</button>
  </form>
          <form action="showMyExercises.jsp">
            <input type="submit" value="Back to My Exercises"/>
           </form>
           <form action="index.jsp">
               <input type="submit" value="Back to home page"/>
           </form>

  </body>
  </html>
