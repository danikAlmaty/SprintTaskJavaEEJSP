package bitlab.techorda.kz.servlets;

import bitlab.techorda.kz.classes.Book;
import bitlab.techorda.kz.classes.DBManager;
import bitlab.techorda.kz.classes.Tasks;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;


@WebServlet(value = "/home.html")
public class HomeServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ArrayList<Tasks> tasks = DBManager.getTasks();
        request.setAttribute("tapsyrmalar", tasks);
        request.getRequestDispatcher("/tasks.jsp").forward(request, response);

    }
}
