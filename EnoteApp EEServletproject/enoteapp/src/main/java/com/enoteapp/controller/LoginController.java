package com.enoteapp.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import javax.sql.DataSource;

import com.enoteapp.model.UserDetails;
import com.enoteapp.model.UserDAO;

/**
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Resource(name = "jdbc/enoteapp")
	private DataSource dataSource;

	private UserDAO userDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		userDAO = new UserDAO(dataSource);
	}
	
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mode = request.getParameter("mode");
		
		if(mode == null) {
			mode = "LOGIN_FORM";
		}
		
		switch (mode) {
		case "LOGIN_FORM":
			showloginForm(request, response);
			break;

		case "LOGIN":
			login(request,response);
			break;
			
		case "LOGOUT":
			logout(request,response);
			break;
			
		default:
			showloginForm(request, response);
			break;
		}
	}
		
		private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("login.jsp");
	}

		private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		// TODO Auto-generated method stub

			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			if(userDAO.validateUser(username, password)) {
				UserDetails user = userDAO.isEmail(username)?userDAO.getUserByEmail(username):userDAO.getUserByNickname(username);
				
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				session.setMaxInactiveInterval(3600 * 3);
				
				response.sendRedirect("home.jsp");
			}else {
				request.setAttribute("success", false);
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
			}
}

		private void showloginForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
	}

		


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
