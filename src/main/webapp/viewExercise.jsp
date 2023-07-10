<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.repository.JpaWgerExerciseRepository" %>
<%@ page import="com.repository.WgerApiReader" %>
<%@ page import="com.model.WgerExercise" %>

<% String id = request.getParameter("id");
   JpaWgerExerciseRepository repository = new JpaWgerExerciseRepository();
   WgerExercise exercise = repository.findWgerExerciseById(Integer.parseInt(id));
%>
<html>

 <head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>Workout Application</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  </head>
<body>

  <div class="b-example-divider"></div>

  <div class="container col-xxl-8 px-4 py-5">
    <div class="row flex-lg-row-reverse align-items-center g-5 py-5">
      <div class="col-10 col-sm-8 col-lg-6">
        <img src="/WorkoutApp/images/dumbbell.svg" class="d-block mx-lg-auto img-fluid" alt="Bootstrap Themes" width="700" height="500" loading="lazy">
      </div>
      <div class="col-lg-6">
        <h1 class="display-5 fw-bold text-body-emphasis lh-1 mb-3"><%=exercise.getName() %></h1>
        <p class="lead"><%=exercise.getDescription() %></p>
        <h2><div class="d-grid gap-2 d-md-flex justify-content-md-start">
           <div class="d-flex gap-2 py-5">
                 <span class="badge text-bg-primary rounded-pill"><p class="card-text"><%= exercise.getCategory().getName() %></p></span>
            </div>
        </div> </h2>
      </div>
    </div>
  </div>

<br/>
<br/>
         <form action="showExerciseCards.jsp">
             <input type="submit" value="Back to exercises"/>
         </form>
</body>
</html>
