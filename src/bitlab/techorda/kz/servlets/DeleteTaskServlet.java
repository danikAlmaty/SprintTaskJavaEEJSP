package bitlab.techorda.kz.servlets;

import bitlab.techorda.kz.classes.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/delete-task")
public class DeleteTaskServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long idDelete = Long.parseLong(request.getParameter("id"));

        DBManager.deleteTask(idDelete);

        response.sendRedirect("/");
    }
}
