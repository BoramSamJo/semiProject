package faqBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import faqBoard.model.service.faqBoardService;
import faqBoard.model.vo.faqBoard;
import noticeBoard.model.service.noticeBoardService;
import noticeBoard.model.vo.noticeBoard;

/**
 * Servlet implementation class faqBoardInsertServlet
 */
@WebServlet("/insert.fbo")
public class faqBoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public faqBoardInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("insert서블릿 잘 오는지 ");
		
		request.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String selectBox = request.getParameter("selectBox");
		
		
		faqBoard fb = new faqBoard();
		fb.setfTitle(title);
		fb.setfContent(content);
		
		int result = new faqBoardService().insertBoard(fb,selectBox);
		
		System.out.println("insert확인 faq: "+result);
		
		if(result>0) {
			response.sendRedirect("manageFbList.bo?currentPage=1");
		}else {
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
