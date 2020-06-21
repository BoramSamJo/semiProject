package faqBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import faqBoard.model.service.faqBoardService;
import faqBoard.model.vo.fPagenation;

/**
 * Servlet implementation class faqBoardSearchManagerServlet
 */
@WebServlet("/managesearch.fbo")
public class faqBoardSearchManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public faqBoardSearchManagerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selectBox=request.getParameter("selectBox");
		String word =request.getParameter("word");
		
		System.out.println("content 잘 넘어오는 지 " + selectBox);
		
		System.out.println("content 잘 넘어오는 지 " + word);
		
		faqBoardService fService = new faqBoardService();
		ArrayList list = fService.searchBoard(selectBox,word);
		
		int currentPage;		//현재 페이지	
		int limit;				//게시글 수
		int maxPage;			//맨 끝 페이지 번호
		int startPage;			//현재 페이지에서 시작번호
		int endPage;			//현재 페이지에서 끝 번호
		int pageBlock;			//한 페이지에 뿌려줄 페이지 수
		int pageCount;			//총 페이지 수
		int listCount = fService.getListCount();
		
		currentPage = 1;
		
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.valueOf(request.getParameter("currentPage"));
		}
		
		limit = 5;
		
		maxPage=(int)((double)listCount/limit+0.8);
		
		pageCount = listCount/limit +(listCount%limit==0?0:1);
		
		//한 페이지에서 뿌려줄 페이지 수 : 전체 페이지 수
		pageBlock=pageCount;
		
		startPage =((((int)((double)currentPage/pageBlock+0.8))-1)*pageBlock)+1;
		endPage=startPage + pageBlock -1;
		
		//마지막 페이지
		if(endPage<pageCount) {
			endPage=pageCount;
		}
		
		//페이징 처리 변수 담아줄 객체
		fPagenation fpn = new fPagenation(listCount,currentPage,limit,maxPage,startPage,endPage,pageBlock,pageCount);
		
		System.out.println("faq search 관리자에서 list잘 나오는 지 : " + list);
		
		
		if(list!=null) {
			request.setAttribute("list", list);
			request.setAttribute("fpn", fpn);
			request.getRequestDispatcher("views/manage/manageFaqBoard.jsp").forward(request, response);
			
		}else {
			/* request.getRequestDispatcher(""); */
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
