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
import board.model.vo.Reply;
import board.model.vo.SbReply;

/**
 * Servlet implementation class InsertReplyServlet
 */
@WebServlet("/insertReply.sb")
public class InsertReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rContent = request.getParameter("rContent");
		int sbNo = Integer.valueOf(request.getParameter("sbNo"));
		int mNo = Integer.valueOf(request.getParameter("mNo"));
		
		System.out.println("ajax 후 : " + rContent);
		System.out.println("ajax 후 : " + sbNo);
		System.out.println("ajax 후 : " + mNo);
		
		SbReply r = new SbReply();
		r.setrContent(rContent);
		r.setSbNo(sbNo);
		r.setMemberNo(mNo);
		
		ArrayList<SbReply> rList = new SketchBoardService().insertReply(r);
		
//		System.out.println("댓글 불러오기 : " + rList);
		
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
