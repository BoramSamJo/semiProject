package faqBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import faqBoard.model.service.faqBoardService;
import faqBoard.model.vo.fPagenation;
import faqBoard.model.vo.faqBoard;

/**
 * Servlet implementation class faqBoardListManagerServlet
 */
@WebServlet("/manageFbList.bo")
public class faqBoardListManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public faqBoardListManagerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		faqBoardService fService = new faqBoardService();
		
		//1. 게시판 리스트 총 갯수 구하기
		int listCount = fService.getListCount();
		System.out.println("faq전체 게시판 개수  : "+listCount); 
		
		int currentPage;		//현재 페이지	
		int limit;				//게시글 수
		int maxPage;			//맨 끝 페이지 번호
		int startPage;			//현재 페이지에서 시작번호
		int endPage;			//현재 페이지에서 끝 번호
		int pageBlock;			//한 페이지에 뿌려줄 페이지 수
		int pageCount;			//총 페이지 수
		
		currentPage = 1;
		
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.valueOf(request.getParameter("currentPage"));
		
		}
		
	
		
		//한페이지 글 개수
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
		
		
		ArrayList list = fService.selectList(currentPage,limit);
		
		faqBoard faqBoard= new faqBoard();
		
		System.out.println("faq manager db갔다가ㅏ 오는 지 " + list);
		
		if(list!=null) {
			request.setAttribute("list", list);
			request.setAttribute("fpn", fpn);
			request.setAttribute("faqBoard", faqBoard);
			request.getRequestDispatcher("views/manage/manageFaqBoard.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("");
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
