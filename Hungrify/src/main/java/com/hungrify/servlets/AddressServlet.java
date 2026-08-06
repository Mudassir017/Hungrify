package com.hungrify.servlets;

import java.io.IOException;

import com.hungrify.DAOImpl.AddressDAOImpl;
import com.hungrify.model.Address;
import com.hungrify.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/address")
public class AddressServlet extends HttpServlet {

    private AddressDAOImpl addressDAO;

    @Override
    public void init() throws ServletException {
        addressDAO = new AddressDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        int userId = user.getUserId();

        String fullName = req.getParameter("fullName");
        String phone = req.getParameter("phone");
        String addressType = req.getParameter("addressType");
        String houseNo = req.getParameter("houseNo");
        String area = req.getParameter("area");
        String landmark = req.getParameter("landmark");
        String city = req.getParameter("city");
        String state = req.getParameter("state");
        String pincode = req.getParameter("pincode");

        boolean isDefault = req.getParameter("isDefault") != null;

        Address address = new Address(
                userId,
                fullName,
                phone,
                addressType,
                houseNo,
                area,
                landmark,
                city,
                state,
                pincode,
                isDefault
        );

        Address savedAddress = addressDAO.addAddress(address);

        if (savedAddress != null) {

            session.setAttribute("address", savedAddress);

            resp.sendRedirect("checkout.jsp");

        } else {

            req.setAttribute("error", "Unable to save address.");

            req.getRequestDispatcher("add-address.jsp")
                    .forward(req, resp);

        }
    }
}