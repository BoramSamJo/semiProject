package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import board.model.service.SketchBoardService;
import board.model.vo.SbReply;

/**
 * Servlet implementation class ModifyReplyServlet
 */
@WebServlet("/modifyReply.sb")
public class ModifyReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rNo = Integer.valueOf(request.getParameter("rNo"));
		int mNo = Integer.valueOf(request.getParameter("mNo")); 
		int sbNo = Integer.valueOf(request.getParameter("sbNo")); 
		String changeContent = request.getParameter("changeContent");
		
		SbReply sr = new SbReply(rNo, sbNo, mNo, changeContent);
		
//		System.out.println("서블릿에서 rNo : " + rNo);
//		System.out.println("서블릿에서 mNo : " + mNo);
//		System.out.println("서블릿에서 sbNo : " + sbNo);
//		System.out.println("서블릿에서 changeContent : " + changeContent);
		
		SketchBoardService sbs = new SketchBoardService();
		
		int result = sbs.modifyReply(sr);
		
		ArrayList<SbReply> rList = sbs.selectReply(sr.getSbNo());
		
		

//		System.out.println("댓글 수정 후 댓글 리스트 : " + rList);
		 
		response.setContentType("application/json");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(rList, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
