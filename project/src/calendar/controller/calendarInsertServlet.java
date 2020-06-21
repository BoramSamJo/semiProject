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
import calendar.model.vo.CalendarData;
import calendar.model.vo.CalendarViews;

/**
 * Servlet implementation class calendarServlet
 */
@WebServlet("/insert.ca")
public class calendarInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public calendarInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int product = Integer.valueOf(request.getParameter("reservation"));
		int userId = Integer.valueOf(request.getParameter("userId"));
		String selectDay = request.getParameter("selectDay");
		String selectTime = request.getParameter("selectTime");
		
		CalendarData cal = new CalendarData(product, userId, selectDay, selectTime);
//		System.out.println(cal);
		ArrayList<CalendarViews> clist = CalendarService.insertProduct(cal);
//		System.out.println(clist);
		
		RequestDispatcher view = null;
		if(!clist.isEmpty()) {
			view = request.getRequestDispatcher("views/manage/calendar.jsp");
			request.setAttribute("clist", clist);
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
