package faqBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import faqBoard.model.service.faqBoardService;
import faqBoard.model.vo.faqBoard;

/**
 * Servlet implementation class manageFaqBoardDetailServlet
 */
@WebServlet("/managedetail.fbo")
public class manageFaqBoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public manageFaqBoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("잘 넘어오는지");
		
		String fno = request.getParameter("fno").trim();
		int fno2 = Integer.valueOf(fno);
		
		String cno = request.getParameter("cno").trim();
		int cno2 = Integer.valueOf(cno);
		
		faqBoard fBoard = new faqBoardService().selectfBoard(fno2, cno2);
		
		System.out.println("상세 확인" + fBoard);
		
		if(fBoard!=null) {
			request.setAttribute("fBoard", fBoard);
			request.getRequestDispatcher("views/manage/manageFaqBoardDetail.jsp").forward(request,response);
		}else {
			request.getRequestDispatcher("views/manage/manageFaqBoard.jsp").forward(request, response);
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
