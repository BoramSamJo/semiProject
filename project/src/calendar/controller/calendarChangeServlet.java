package calendar.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class calendarChangeServlet
 */
@WebServlet("/change.ca")
public class calendarChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public calendarChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reservation = Integer.valueOf(request.getParameter("rProduct"));
		int reservationId = Integer.valueOf(request.getParameter("rId"));
		String changeDay = request.getParameter("date");
		String selectTime = request.getParameter("rTime");
		
		CalendarData cal = new CalendarData(reservationId, reservation, changeDay, selectTime);

		ArrayList<CalendarViews> clist = CalendarService.updateProduct(cal);
		
		System.out.println(clist);
		RequestDispatcher view = null;
		if(!clist.isEmpty()) {
			view = request.getRequestDispatcher("views/manage/calendar.jsp");
			request.setAttribute("clist", clist);
			view.forward(request, response);
		}else {
			PrintWriter out = response.getWriter();
			out.print("1");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
