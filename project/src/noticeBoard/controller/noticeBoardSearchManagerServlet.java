package noticeBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import noticeBoard.model.service.noticeBoardService;
import noticeBoard.model.vo.nPagenation;

/**
 * Servlet implementation class noticeBoardSearchManagerServlet
 */
@WebServlet("/managesearch.nbo")
public class noticeBoardSearchManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public noticeBoardSearchManagerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selectBox=request.getParameter("selectBox");
	      String word =request.getParameter("word");
	      
	      
	   
	      System.out.println("selectBox,word 잘 가져오는 지 확인: " + selectBox+word); //잘 나옴
	      
	      noticeBoardService nService = new noticeBoardService();
	      ArrayList list = nService.searchBoard(selectBox,word);
	      
	      
	      int listCount = nService.getListCount();
	      int currentPage;      //현재 페이지
	      int limit;             //게시글 갯수
	      int maxPage;         //맨 끝페이지 번호
	      int startPage;         //현재 페이지에서 시작번호
	      int endPage;         //현재 페이지에서 끝번호
	      int pageBlock;         //한 페이지에 뿌려줄 페이지 수
	      int pageCount;         //총 페이지 수
	      
	      currentPage=1;
	      
	      if(request.getParameter("currentPage")!=null) {
	         currentPage = Integer.valueOf(request.getParameter("currentPage"));
	      }
	      
	      limit=5; //5개씩 뿌려치고
	      
	      //맨 끝 페이지 번호
	       maxPage=(int)((double)listCount/limit+0.7); 

	      
	      //총 페이지 수 (2개)
	      pageCount = listCount/limit + (listCount%limit==0?0:1);
	   
	      
	      //한 페이지에서 뿌려줄 페이지 수 : 2개
	      pageBlock=pageCount;
	      
	      startPage=(((int)((double)currentPage/pageBlock+0.7))-1)*pageBlock+1; 
	      endPage=startPage+pageBlock -1;
	      
	      if(maxPage < endPage) {
	         endPage = maxPage;
	      }

	      //마지막 페이지 처리
	      if(endPage<pageCount) {
	         endPage=pageCount;
	      }
	      
	      
	      nPagenation pn = new nPagenation(currentPage, listCount,limit, maxPage, startPage,endPage);
	      
	      
	      System.out.println("list잘 나오는 지 :" + list); //나옴
	   
	      
	      RequestDispatcher view = null;
	      if(list!=null) {
	         view=request.getRequestDispatcher("views/noticeBoard/noticeBoardListView.jsp");
	         request.setAttribute("list", list);
	         request.setAttribute("pn", pn);
	         request.setAttribute("isSearch", "true");
	         request.setAttribute("selectBox", selectBox);
	         request.setAttribute("word", word);
	      }else {
	         view=request.getRequestDispatcher("views/common/errorPage.jsp");
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
