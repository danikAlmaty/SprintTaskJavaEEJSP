package bitlab.techorda.kz.servlets;

import bitlab.techorda.kz.classes.DBManager;
import bitlab.techorda.kz.classes.Tasks;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/details")
public class DetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = -1;

        try{
            id = Long.parseLong(request.getParameter("task_id"));
        }catch (Exception e){

        }

        Tasks task = DBManager.getTask(id);

        request.setAttribute("tapsyrma", task);
        request.getRequestDispatcher("/details.jsp").forward(request, response);
    }


}
