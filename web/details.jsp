<%@ page import="bitlab.techorda.kz.classes.Tasks" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
      <title>Title</title>
      <%@include file="head_bootstrap_version.jsp"%>
  </head>
  <body>
    <%@include file="navbar.jsp"%>
    <div class="container mt-5 pb-5">
        <%
            Tasks task = (Tasks) request.getAttribute("tapsyrma");
            if (task!=null){
        %>
        <div class="row">
            <div class="col-6 mx-auto">
                  <div class="row">
                    <div class="col-12">
                      <label>NAME: </label>
                    </div>
                  </div>
                  <div class="row mt-2">
                    <div class="col-12">
                      <input type="text" class="form-control" readonly value="<%=task.getName()%>">
                    </div>
                  </div>

                  <div class="row mt-3">
                    <div class="col-12">
                      <label>DESCRIPTION: </label>
                    </div>
                  </div>
                  <div class="row mt-2">
                    <div class="col-12">
                      <textarea class="form-control" readonly rows="10"><%=task.getDescription()%></textarea>
                    </div>
                  </div>

                  <div class="row mt-3">
                    <div class="col-12">
                        <label>IS IT DONE: </label>
                    </div>
                  </div>
                  <div class="row mt-2">
                      <div class="col-12">
                          <%
                              String isDone;
                              if (task.getDone()){
                                  isDone = "YES";
                              }else {
                                  isDone = "NO";
                              }
                          %>
                          <input type="text" class="form-control" readonly value="<%=isDone%>">
                      </div>
                  </div>

                  <div class="row mt-3">
                    <div class="col-12">
                      <label>DEADLINE: </label>
                    </div>
                  </div>
                  <div class="row mt-2">
                    <div class="col-12">
                      <input type="date" class="form-control" readonly value="<%=task.getDeadlineDate()%>">
                    </div>
                  </div>

                  <div class="row mt-3">
                      <div class="col-12">
                          <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editTask">
                              EDIT TASK
                          </button>
                          <!-- Button trigger modal -->
                          <button type="button" class="btn btn-danger btn-sm ms-3" data-bs-toggle="modal" data-bs-target="#deleteTask">
                              Delete task
                          </button>

                      </div>
                  </div>

                    <div class="modal fade" id="deleteTask" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                    <form action="/delete-task" method="post">
                                    <input type="hidden" value="<%=task.getId()%>" name="id">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" >Confirm Delete</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <h5 class="text-center">Are you senimdi?</h5>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                        <button class="btn btn-danger">Yes</button>
                                    </div>
                                    </form>
                            </div>
                        </div>
                    </div>


                  <div class="modal fade" id="editTask" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="/save-task" method="post">
                                    <input type="hidden" name="task_id" value="<%=task.getId()%>">
                                    <div class="row">
                                        <div class="col-12">
                                            <label>NAME: </label>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-12">
                                            <input type="text" class="form-control" name="task_name" value="<%=task.getName()%>">
                                        </div>
                                    </div>

                                    <div class="row mt-3">
                                        <div class="col-12">
                                            <label>DESCRIPTION: </label>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-12">
                                            <textarea name="task_description" class="form-control" rows="10"><%=task.getDescription()%></textarea>
                                        </div>
                                    </div>

                                    <div class="row mt-3">
                                        <div class="col-12">
                                            <label>DEADLINE: </label>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-12">
                                            <input type="date" class="form-control" name="task_deadline" value="<%=task.getDeadlineDate()%>">
                                        </div>
                                    </div>



                                    <div class="row">
                                        <div class="col-12">
                                            <label>IS IT DONE: </label>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-12">
                                            <select class="form-control" name="task_done">
                                                <option <%=task.getDone()?"":"selected"%> value="true">YES</option>
                                                <option <%=task.getDone()?"":"selected"%> value="false">NO</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="row mt-3">
                                        <div class="col-12">
                                            <button class="btn btn-primary">Edit task</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>

                        </div>
                    </div>
                  </div>

            </div>
        </div>

        <%
            }else {

        %>
            <h3 class="text-center">I can't find this task</h3>
        <%
            }
        %>
    </div>

  </body>
</html>
