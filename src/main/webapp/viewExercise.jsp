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
<h1> <%=exercise.getName() %></h1>

<br/>
<br/>
         <form action="showExerciseCards.jsp">
             <input type="submit" value="Back to exercises"/>
         </form>
</body>
</html>
