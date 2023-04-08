<%@ page import="java.util.ArrayList" %>
<%@ page import="bitlab.techorda.kz.classes.Tasks" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
        <%@include file="head_bootstrap_version.jsp"%>
    </head>
    <body>
        <%@include file="navbar.jsp"%>

        <div class="container">
            <div class="row mt-3">
                <div class="col-12">
                    <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#addTask">
                        + ADD TASK
                    </button>

                    <div class="modal fade" id="addTask" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <%@include file="formadd.jsp"%>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container mt-3">

            <div class="row">
                <div class="col-12">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>NAME</th>
                                <th>DEADLINE</th>
                                <th>DONE</th>
                                <th style="width: 10%;">DETAILS</th>
                            </tr>

                        </thead>
                        <tbody>
                            <%
                                ArrayList<Tasks> tapsyrmalar = (ArrayList<Tasks>) request.getAttribute("tapsyrmalar");
                                if (tapsyrmalar!=null){
                                for (Tasks taps : tapsyrmalar){

                            %>
                                <tr>
                                    <td><%=taps.getId()%></td>
                                    <td><%=taps.getName()%></td>
                                    <td><%=taps.getDeadlineDate()%></td>
                                    <td><%if (taps.getDone()){
                                            out.print("YES");
                                            }else {
                                                out.print("NO");
                                            }
                                    %></td>
                                    <td>
                                        <a class="btn btn-success btn-sm" href="/details?task_id=<%=taps.getId()%>">DETAILS</a>
                                    </td>
                                </tr>
                            <%
                                    }
                                }
                            %>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </body>
</html>
