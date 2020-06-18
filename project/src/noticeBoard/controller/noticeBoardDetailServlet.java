package noticeBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import noticeBoard.model.service.noticeBoardService;
import noticeBoard.model.vo.noticeBoard;

/**
 * Servlet implementation class noticeBoardDetailServlet
 */
@WebServlet("/detail.bo")
public class noticeBoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public noticeBoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nno = request.getParameter("nno").trim();
		int nno2 = Integer.valueOf(nno);
		
		noticeBoard notiBoard = new noticeBoardService().selectBoard(nno2);
		
		System.out.println("상세 조회 db값 출력되는 지 확인: " + notiBoard);
		
		if(notiBoard !=null) {
			request.setAttribute("notiBoard", notiBoard);
			request.getRequestDispatcher("views/noticeBoard/noticeBoardDetailView.jsp").forward(request, response);
			
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
