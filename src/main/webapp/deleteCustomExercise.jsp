<%@ page import="com.model.CustomExercise" %>
<%@ page import="com.model.ExerciseItem" %>
<%@ page import="com.repository.JpaCustomExerciseRepository" %>
<%@ page import="com.repository.JpaExerciseItemRepository" %>
<%@ page import="java.util.*" %>

<%@ page isErrorPage = "true" %>

<% String id = request.getParameter("id");
   JpaCustomExerciseRepository customExerciseRepo = new JpaCustomExerciseRepository();
   JpaExerciseItemRepository exerciseItemRepo = new JpaExerciseItemRepository();
   try{
    customExerciseRepo.deleteCustomExercise(Integer.parseInt(id));
    }catch(RuntimeException e){%>
           <div class="modal" tabindex="-1" role="dialog">
             <div class="modal-dialog" role="document">
               <div class="modal-content">
                 <div class="modal-header">
                   <h5 class="modal-title">Cannot delete exercise</h5>
                   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                   </button>
                 </div>
                 <div class="modal-body">
                   <p>This exercise is currently used in a workout plan.</p>
                 </div>
                 <div class="modal-footer">
                   <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                 </div>
               </div>
             </div>
           </div>
   <%}%>

  <meta http-equiv="Refresh" content="0; url='/WorkoutApp/showMyExercises.jsp" />

