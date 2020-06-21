package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.AnimalService;
import member.model.service.MemberService;
import member.model.vo.Animal;
import member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String maintainCheck = request.getParameter("maintainCheck");
		// 예약페이지에 userId를 넒김
		Member member = new MemberService().logindata(userId);
		RequestDispatcher view = null;
		
		if(member != null) { // 로그인 성공시
			int mNo = member.getmNo();
			ArrayList<Animal> animal = new AnimalService().animaldata();
			view = request.getRequestDispatcher("views/funeral/reservation.jsp");
			request.setAttribute("member", member);
			request.setAttribute("animal", animal);
			view.forward(request, response);
		}
		Member m = new Member();
		m.setmId(userId);
		m.setmPwd(userPwd);
		
		//1. 먼저 일치하는 아이디가 있는지 조회하여 없는 아이디의 경우 먼저 넘겨버림
		int result = new MemberService().matchingId(userId);
		
		if(result==0) {
			PrintWriter out = response.getWriter();
			out.print("noneId");
			out.flush();
			out.close();
			
		}else {
			
			Member loginUser = new MemberService().loginMember(m);
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			System.out.println(maintainCheck);
			PrintWriter out = response.getWriter();
			System.out.println("여기오나");
			if(loginUser!=null) {
				if(maintainCheck.equals("true")) {
					System.out.println(maintainCheck);
					//쿠키를 생상하고 로그인시 입력한 회원아이디를 저장
					Cookie cookie = new Cookie("loginCookie", userId);
					//쿠키를 찾을 경로를 컨텍스트 경로로 변경
					cookie.setPath("/");
					//단위는 (초)이고 7일 정도로 유효시간을 설정
					cookie.setMaxAge(60*60*24*7);
					response.addCookie(cookie);
				
					out.print("successLogin");
					out.flush();
					out.close();
				}else if(maintainCheck.equals("false")){
					System.out.println(maintainCheck);
					out.print("successLogin");
					out.flush();
					out.close();
				}
			}else {
				out.print("failLogin");
				out.flush();
				out.close();
			}
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
