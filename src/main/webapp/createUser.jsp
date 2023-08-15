<%@ page import="com.model.User" %>
<%@ page import="com.repository.JpaUserRepository" %>
<%@ page import="java.util.*" %>
<%@ page import= "java.util.stream.Collectors" %>

<%
  String name = request.getParameter("name");
  String email = request.getParameter("email");
  String password = request.getParameter("password");
  User user = new User(name, email, password);
  JpaUserRepository userRepo = new JpaUserRepository();
  userRepo.addUser(user);
  %>

<meta http-equiv="Refresh" content="0; url='/WorkoutApp/createNewUser.jsp" />