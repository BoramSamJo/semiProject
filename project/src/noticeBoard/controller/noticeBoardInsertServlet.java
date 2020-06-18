package noticeBoard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import noticeBoard.model.service.noticeBoardService;
import noticeBoard.model.vo.noticeBoard;

/**
 * Servlet implementation class noticeBoardInsert
 */
@WebServlet("/insert.bo")
public class noticeBoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public noticeBoardInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* System.out.println("insert서블릿까지 잘 나오는 지 확인"); */
		request.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		HttpSession session = request.getSession();
		
		noticeBoard nb = new noticeBoard();
		nb.setnTitle(title);
		nb.setnContent(content);
		
		int result = new noticeBoardService().insertBoard(nb);
		
		if(result>0) {
			response.sendRedirect("list.bo?currentPage=1");
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
