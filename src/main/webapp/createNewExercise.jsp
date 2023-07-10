<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.repository.JpaCategoryRepository" %>
<%@ page import="com.repository.WgerApiReader" %>
<%@ page import="com.model.Category" %>
<html>

 <head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>Workout Application</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  </head>
<body>
<h1>Create your own exercise!</h1>
<form>
  <div class="form-group w-50" >
    <label for="exampleFormControlInput1">Name</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Exercise Name">
  </div>
  <div class="form-group w-50">
    <label for="exampleFormControlSelect1">Category</label>
    <select class="form-control" id="exampleFormControlSelect1">
       <% JpaCategoryRepository categoryRepository = new JpaCategoryRepository();
       List<Category> categories = categoryRepository.getAllCategories();
       for (Category category : categories) { %>
            <option><%=category.getName() %></option>
        <%}%>
    </select>
  </div>
  <div class="form-group w-50"">
    <label for="exampleFormControlTextarea1">Description</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
  </div>
  <br>
   <button type="submit" class="btn btn-primary">Create new exercise</button>
</form>
         <form action="index.jsp">
             <input type="submit" value="Back to home page"/>
         </form>
</body>
</html>
