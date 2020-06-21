package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.vo.Pagination;
import member.model.service.MemberService;
import member.model.vo.Animal;
import member.model.vo.Member;

/**
 * Servlet implementation class ManageMemberListServlet
 */
@WebServlet("/manageMList.bo")
public class ManageMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageMemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//0. 페이징처리 
		//1) 리스트 총 개수 구하기
		int listCount = new MemberService().getListCount();
		
		int currentPage;
		int limit;		
		int maxPage;	
		int startPage;	
		int endPage;
		
		currentPage=1;
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.valueOf(request.getParameter("currentPage"));
			
			if(currentPage<1) {
				currentPage=1;
			}
		}
		limit=10;
		maxPage = (int)((double)listCount/limit + 0.9);
		if(currentPage > maxPage) {
			currentPage = maxPage;
		}
		startPage = (((int)((double)currentPage/limit + 0.9))-1)*limit+1;
		endPage = startPage + limit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}

		Pagination p = new Pagination(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		//1. 회원리스트 불러오기
		ArrayList<Member> member = new MemberService().selectAllMember(p);
		
		//2. 동물리스트 불러오기
		ArrayList<Animal> animal = new MemberService().selectAllAnimal();
		
		//3. 뿌리기
		RequestDispatcher veiw = null;
		if(listCount==0) {
			request.setAttribute("member", member);
			request.setAttribute("animal", animal);
			request.setAttribute("p", p);
			request.getRequestDispatcher("views/manage/manageMember.jsp").forward(request, response);
		}
		if(!member.isEmpty()) {
			request.setAttribute("member", member);
			request.setAttribute("animal", animal);
			request.setAttribute("p", p);
			request.getRequestDispatcher("views/manage/manageMember.jsp").forward(request, response);
		}else {
			request.setAttribute("p", p);
			request.setAttribute("msg", "회원조회 실패");
			request.getRequestDispatcher("views/manage/manageMember.jsp").forward(request, response);
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
