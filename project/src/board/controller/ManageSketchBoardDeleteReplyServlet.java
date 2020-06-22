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
 * Servlet implementation class ManageSketchBoardDeleteReplyServlet
 */
@WebServlet("/deleteReply.ms")
public class ManageSketchBoardDeleteReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageSketchBoardDeleteReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rNo = Integer.valueOf(request.getParameter("rNo"));
		int sbNo = Integer.valueOf(request.getParameter("sbNo"));
		
		SbReply sr = new SbReply(rNo, sbNo);
		
//		System.out.println("서블릿에서 rNo : " + rNo);
		
		SketchBoardService sbs = new SketchBoardService();

		int result = sbs.manageDeleteReply(sr);
		
		ArrayList<SbReply> rList = new ArrayList<>();
		
		
		SketchBoard sb = new SketchBoardService().selectList(sbNo);
		Attachment at = new SketchBoardService().selectFlist(sbNo);
		
		RequestDispatcher view = null;
		if(result > 0) {
			rList = sbs.selectManageReply(sr.getSbNo());
			if(rList != null) {
//			System.out.println("서블릿에서 : " + rList);
			request.setAttribute("rList",rList);
			request.setAttribute("sb",sb);
			request.setAttribute("at",at);
			view = request.getRequestDispatcher("views/manage/manageSketchBoardDetail.jsp");
			}
			}else {
			request.setAttribute("rList",rList);
			request.setAttribute("sb",sb);
			request.setAttribute("at",at);
			request.setAttribute("msg", "댓글 삭제 실패!");
			view = request.getRequestDispatcher("/views/manage/manageSketchBoardDetail.jsp");
			
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
