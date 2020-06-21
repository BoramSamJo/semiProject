package faqBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import faqBoard.model.service.faqBoardService;
import faqBoard.model.vo.fPagenation;
import faqBoard.model.vo.faqBoard;

/**
 * Servlet implementation class faqBoardCategory
 */
@WebServlet("/cate.fbo")
public class faqBoardCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public faqBoardCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		//카테고리 받아온 값
		String cate= request.getParameter("cate");
	
	 
		System.out.println("카테고리 잘 나오는 지 테스트:" + cate);
	 
		/* PrintWriter out = response.getWriter(); */
		/* out.println("잘 나오나?"); */
		
		
	 
		/*---------------------------------------------------------------------*/
		
		faqBoardService fService = new faqBoardService();
		ArrayList list = fService.selectcateList(cate);
			
		
		System.out.println("cate list 불러 오는 지 :" + list); 
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(list,response.getWriter());
		
		
		
		/* -----------------------------------*/
		/*
		 * int listCount = fService.getListCount();
		 * 
		 * 
		 * int currentPage=1; int limit=1; int maxPage=1; int startPage=1; int
		 * endPage=1; int pageBlock=1; int pageCount=1;
		 * 
		 * faqBoard faqBoard= new faqBoard();
		 * 
		 * 
		 * fPagenation fpn = new
		 * fPagenation(listCount,currentPage,limit,maxPage,startPage,endPage,pageBlock,
		 * pageCount);
		 * 
		 * 
		 * RequestDispatcher view = null;
		 */

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
