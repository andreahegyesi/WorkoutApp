<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.repository.JpaCategoryRepository" %>
<%@ page import="com.repository.JpaMuscleRepository" %>
<%@ page import="com.repository.JpaEquipmentRepository" %>
<%@ page import="com.repository.WgerApiReader" %>
<%@ page import="com.model.Category" %>
<%@ page import="com.model.Muscle" %>
<%@ page import="com.model.Equipment" %>
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

<h1>Create your own exercise!</h1>

<form action="createCustomExercise.jsp">
  <div class="form-group w-50 " >
    <label for="exampleFormControlInput1">Name</label>
    <input type="text" class="form-control" name = "name" id="exampleFormControlInput1" placeholder="Exercise Name">
  </div>

  <div class="form-group w-50">
    <label for="exampleFormControlSelect1">Category</label>
    <select class="form-control" name = "category" id="exampleFormControlSelect1">
       <% JpaCategoryRepository categoryRepository = new JpaCategoryRepository();
       List<Category> categories = categoryRepository.getAllCategories();
       for (Category category : categories) { %>
            <option><%=category.getName() %></option>
        <%}%>
    </select>
  </div>

    <div class="form-group w-50"">
      <label for="exampleFormControlTextarea1">Description</label>
      <textarea class="form-control" name="description" id="exampleFormControlTextarea1" rows="3"></textarea>
    </div>

   <div class="form-group w-50">
       <label for="exampleFormControlSelect1">Muscles</label>
          <%JpaMuscleRepository muscleRepo = new JpaMuscleRepository();
          List<Muscle> muscles = muscleRepo.getAllMuscles();
          for (Muscle muscle : muscles) { %>
              <div class="form-check">
                 <input class="form-check-input" type="checkbox" name="muscle" value=<%=muscle.getId()%> id="defaultCheck1">
                <label class="form-check-label" for="defaultCheck1">
               <%=muscle.getName() %>
          </label>
          </div>
          <%}%>
    </div>

    <div class="form-group w-50">
        <label for="exampleFormControlSelect1">Secondary Muscles</label>
           <%for (Muscle muscle : muscles) { %>
               <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="secondarymuscle" value=<%=muscle.getId()%> id="defaultCheck1">
                  <label class="form-check-label" for="defaultCheck1">
                    <%=muscle.getName() %>
           </label>
           </div>
           <%}%>
        </div>

     <div class="form-group w-50">
        <label for="exampleFormControlSelect1">Equipment</label>
            <%JpaEquipmentRepository equipmentRepo = new JpaEquipmentRepository();
            List<Equipment> equipmentList = equipmentRepo.getAllEquipment();
            for (Equipment equipment : equipmentList) { %>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" name= "equipment" value=<%=equipment.getId()%> id="defaultCheck1">
                    <label class="form-check-label" for="defaultCheck1">
                    <%=equipment.getName() %>
                    </label>
                </div>
             <%}%>
     </div>

  <div>
    <label for="formFileLg" class="form-label w-50">Upload image</label>
    <input class="form-control w-50" type="file" id="formFile">
  </div>
  <br>
   <button type="submit" class="btn btn-primary">Create exercise</button>
</form>
        <form action="showMyExercises.jsp">
          <input type="submit" value="Back to My Exercises"/>
         </form>
         <form action="index.jsp">
             <input type="submit" value="Back to home page"/>
         </form>

</body>
</html>
