package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.QnAService;
import member.model.vo.Member;

/**
 * Servlet implementation class insertQnAServlet
 */
@WebServlet("/insertQnA.bo")
public class insertQnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertQnAServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = (String)request.getSession().getAttribute("userId");
		if(userId==null) {
			userId = ((Member)request.getSession().getAttribute("loginUser")).getmId();
		}
		
		String title = request.getParameter("title");
		String isOpen = request.getParameter("isOpen");
		String password = "";
		if(isOpen.equals("no")) {
			password = request.getParameter("password");			
		}else{
			password = "0";
		}
		String category1 = request.getParameter("category");
		int category = 0;
		switch(category1) {
		case "reservation": category = 1;
			break;
		case "price": category = 3;
			break;
		case "insFu": category = 2;
			break;
		case "etc": category = 4;
			break;
		}
		String content = request.getParameter("content");
		
		int mNo = new QnAService().selectMemberNo(userId);
		
		int result = new QnAService().insertQnaAsk(mNo, title, password, category, content);
		
		RequestDispatcher view = null;
		if(result>0) {
			response.sendRedirect("QnAList.bo");
		}else {
			request.getRequestDispatcher("views/board/qnaDetailBaord.jsp").forward(request, response);
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
