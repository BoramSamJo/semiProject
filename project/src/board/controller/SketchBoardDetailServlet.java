package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.SketchBoardService;
import board.model.vo.Attachment;
import board.model.vo.SketchBoard;

/**
 * Servlet implementation class SketchBoardDetailServlet
 */
@WebServlet("/detail.sb")
public class SketchBoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SketchBoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int sbNo = Integer.valueOf(request.getParameter("sbNo"));
		
//		System.out.println(sbNo);
		
		int result = new SketchBoardService().updateCount(sbNo);
		
//		System.out.println(result);
//		ArrayList<SketchBoard> list = new SketchBoardService().selectList(sb);
//		
//		ArrayList<Attachment> fList = new SketchBoardService().selectFlist(sb);
		
		RequestDispatcher view = null;
		
		if(result>0) {
			SketchBoard sb = new SketchBoardService().selectList(sbNo);
			Attachment at = new SketchBoardService().selectFlist(sbNo);
			
//			System.out.println(sb);
//			System.out.println(at);
			
			if(sb != null && at != null) {
				request.setAttribute("sb", sb);
				request.setAttribute("at", at);
				view = request.getRequestDispatcher("views/sketchBoard/sketchBoardDetail.jsp");
			}else {
				request.setAttribute("msg", "게시물 조회 실패");
				view = request.getRequestDispatcher("views/common/errorPage.jsp");
			}
			view.forward(request, response);

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
