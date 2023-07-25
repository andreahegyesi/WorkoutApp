<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.repository.JpaCustomExerciseRepository" %>
<%@ page import="com.repository.JpaCategoryRepository" %>
<%@ page import="com.repository.JpaMuscleRepository" %>
<%@ page import="com.repository.JpaEquipmentRepository" %>
<%@ page import="com.repository.WgerApiReader" %>
<%@ page import="com.model.CustomExercise" %>
<%@ page import="com.model.Category" %>
<%@ page import="com.model.Muscle" %>
<%@ page import="com.model.Equipment" %>

<% String id = request.getParameter("id");
   JpaCustomExerciseRepository customRepository = new JpaCustomExerciseRepository();
   CustomExercise customExercise = customRepository.findCustomExerciseById(Integer.parseInt(id));
%>

<html>

 <head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>Workout Application</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  </head>
<body>
<h1>Update your exercise!</h1>

<form action="createCustomExercise.jsp">
  <div class="form-group w-50 " >
    <label for="exampleFormControlInput1">Name</label>
    <input type="text" class="form-control" name = "name" id="exampleFormControlInput1" value=<%=customExercise.getName()%>>
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
      <textarea class="form-control" name="description" id="exampleFormControlTextarea1" value=<%=customExercise.getDescription()%> rows="3"></textarea>
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
