package com.hungrify.servlets;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.hungrify.DAOImpl.UserDAOImpl;
import com.hungrify.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/changePassword")
public class ChangePasswordServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req,
	        HttpServletResponse resp)
	        throws ServletException, IOException {

	    HttpSession session = req.getSession(false);

	    if (session == null || session.getAttribute("user") == null) {
	        resp.sendRedirect("login.jsp");
	        return;
	    }

	    RequestDispatcher rd =
	            req.getRequestDispatcher("change-password.jsp");

	    rd.forward(req, resp);
	}

    @Override
    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if(session == null || session.getAttribute("user") == null){

            resp.sendRedirect("login.jsp");
            return;
        }
        
        User user = (User) session.getAttribute("user");
        
        String currentPassword = req.getParameter("currentPassword");
        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");
        
        if (!BCrypt.checkpw(currentPassword, user.getPassword())) {

            req.setAttribute("error", "Current password is incorrect.");

            RequestDispatcher rd =
                    req.getRequestDispatcher("change-password.jsp");

            rd.forward(req, resp);

            return;
        }
        
        if (!newPassword.equals(confirmPassword)) {

            req.setAttribute("error", "New password and Confirm password do not match.");

            RequestDispatcher rd =
                    req.getRequestDispatcher("change-password.jsp");

            rd.forward(req, resp);

            return;
        }

        String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt(8));

        UserDAOImpl dao = new UserDAOImpl();

        boolean updated = dao.updatePassword(user.getUserId(), hashedPassword);

        if (updated) {

            user.setPassword(hashedPassword);

            session.setAttribute("user", user);

            resp.sendRedirect("profile");

        } else {

            req.setAttribute("error", "Unable to update password.");

            RequestDispatcher rd =
                    req.getRequestDispatcher("change-password.jsp");

            rd.forward(req, resp);
        }

    }

}