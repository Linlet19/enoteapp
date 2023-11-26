package com.enoteapp.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;

import javax.sql.DataSource;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.enoteapp.model.NoteDAO;
import com.enoteapp.model.NoteDetails;
import com.enoteapp.model.UserDetails;


/**
 * Servlet implementation class NotesDetailsController
 */

public class NotesDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Resource(name = "jdbc/enoteapp")
	private DataSource dataSource;
	
	private NoteDAO noteDAO;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotesDetailsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		noteDAO = new NoteDAO(dataSource);
	}

	/**
	 * @throws IOException 
	 * @throws ServletException 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mode = request.getParameter("mode");
		if(mode==null) {
			mode = "SHOW_FORM";
		}
		switch (mode) {
		case "SHOW":
			showAllNotes(request, response);
			break;
			
		case "SHOW_FORM":
			showNoteForm(request, response);
			break;
			
		case "SINGLE":
			showSingleNote(request, response);
			break;

		case "CREATE":
			createNote(request, response);
			break;
			
		case "LOAD":
			loadNote(request,response);
			break;
			
		case "UPDATE":
			updateNote(request,response);
			break;
			
		case "DELETE":
			deleteNote(request,response);
			break;
			
		default: 
			showAllNotes(request, response);
			break;
		}
		
	}
	
	private void deleteNote(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		Long id = Long.parseLong(request.getParameter("id"));
		boolean success = noteDAO.flashDeleteNote(id);
		if(success) {
			response.sendRedirect("home.jsp");
		}else {
			response.sendRedirect("noteDetails?mode=SINGLE&id="+id);
		}
	}

	private void loadNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Long id = Long.parseLong(request.getParameter("id"));
		NoteDetails uNote = noteDAO.getNoteById(id);
		if(uNote != null) {
			request.setAttribute("load", uNote);
			RequestDispatcher dispatcher = request.getRequestDispatcher("updateNotes.jsp");
			dispatcher.forward(request, response);
		}
		
	}

	private void updateNote(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Long id = Long.parseLong(request.getParameter("id"));
		
		NoteDetails note = new NoteDetails(id, title, content);
		boolean success = noteDAO.updateNote(note);
		if(success) {
			response.sendRedirect("notedetails");
		}else {
			request.setAttribute("success", success);
			RequestDispatcher dispatcher = request.getRequestDispatcher("updateNotes.jsp");
			dispatcher.forward(request, response);
		}
		
	}

	private void showSingleNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		UserDetails user = (UserDetails) session.getAttribute("user");
		
		Long id = Long.parseLong(request.getParameter("id"));
		NoteDetails singleNote = noteDAO.getNoteById(id);
		request.setAttribute("singleNote", singleNote);
		RequestDispatcher dispatcher = request.getRequestDispatcher("details.jsp");
		dispatcher.forward(request, response);
	}

	private void showNoteForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
		dispatcher.forward(request, response);
	}

	private void createNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		UserDetails user = (UserDetails)session.getAttribute("user");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Long userId = user.getId();
		LocalDate date = LocalDate.now();
		
		NoteDetails note = new NoteDetails(title, content, userId, date);
		boolean success = noteDAO.createNote(note);
		
		request.setAttribute("success", success);
		RequestDispatcher dispatcher = request.getRequestDispatcher("addNotes.jsp");
		dispatcher.forward(request, response);
	}

	private void showAllNotes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserDetails user = (UserDetails)session.getAttribute("user");
		
		List<NoteDetails> allNotes = noteDAO.getAllNotes(user.getId());
		request.setAttribute("allNotes", allNotes);
		RequestDispatcher dispatcher = request.getRequestDispatcher("showAllNotes.jsp");
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

