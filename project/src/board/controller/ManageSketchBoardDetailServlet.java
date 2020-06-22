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
import board.model.vo.SbReply;
import board.model.vo.SketchBoard;

/**
 * Servlet implementation class ManageSketchBoardDetailServlet
 */
@WebServlet("/detail.ms")
public class ManageSketchBoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageSketchBoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int sbNo = Integer.valueOf(request.getParameter("sbNo"));
		
//		System.out.println("서블릿에서 : " + sbNo);
		
		int result = new SketchBoardService().updateCount(sbNo);
		
		RequestDispatcher view = null;
		
		if(result>0) {
			SketchBoard sb = new SketchBoardService().selectList(sbNo);
			Attachment at = new SketchBoardService().selectFlist(sbNo);
			ArrayList<SbReply> rList = new SketchBoardService().selectReply(sbNo);

//			System.out.println("서블릿 : " + rList);
//			System.out.println("서블릿 : " + sb);
//			System.out.println("서블릿 : " + at);
			
			if(sb != null && at != null && rList != null) {
				request.setAttribute("sb", sb);
				request.setAttribute("at", at);
				request.setAttribute("rList", rList);
				view = request.getRequestDispatcher("views/manage/manageSketchBoardDetail.jsp");
			}else {
				request.setAttribute("msg", "게시물 조회 실패");
				view = request.getRequestDispatcher("views/manage/manageSketchBoardDetail.jsp");
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
