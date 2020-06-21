package calendar.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import calendar.model.service.CalendarService;
import calendar.model.vo.CalendarViews;

/**
 * Servlet implementation class calendarDeleteServlet
 */
@WebServlet("/delete.ca")
public class calendarDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public calendarDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rNo = Integer.valueOf(request.getParameter("delReservation"));
		System.out.println(rNo);
		ArrayList<CalendarViews> clist = CalendarService.deleteProduct(rNo);
		
		RequestDispatcher view = null;
		if(clist != null) {
			view = request.getRequestDispatcher("views/manage/calendar.jsp");
			request.setAttribute("clist", clist);
		}else {
		}
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
