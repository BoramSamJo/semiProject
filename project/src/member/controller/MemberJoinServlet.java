package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Animal;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberJoinServlet
 */
@WebServlet("/join.me")
public class MemberJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberJoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String informMail = request.getParameter("informMail");
		
		String pName = request.getParameter("pName");
		Double pWeight = Double.parseDouble("pWeight");
		String pKind = request.getParameter("pKind");
		
//		System.out.println(userName);
//		System.out.println(userId);
//		System.out.println(userPwd);
//		System.out.println(email);
//		System.out.println(phone);
//		System.out.println(address);
		System.out.println(informMail);
//		System.out.println(pName);
//		System.out.println(pWeight);
//		System.out.println(pKind);
		
		//1. 회원을 생성한다!
		Member m = new Member();
		m.setmId(userId);
		m.setmName(userName);
		m.setmPwd(userPwd);
		m.setEmail(email);
		m.setPhone(phone);
		m.setAddress(address);
		m.setMailServie(informMail);
		//정보메일수신 동의여부는 나중에 db결정하고 보내든가 말든가 하자
		
		int result = new MemberService().insertMember(m);
		
		//회원가입이 됐으면
		PrintWriter out = response.getWriter();
		if(result>0) {
			//2. 펫정보 입력 여부에 따라 ANIMAL테이블에 정보를 입력해 준다.
			if(!pKind.equals("")) {//펫정보 입력한 경우
				//1) 가입된 사람의 회원번호를 가져온다
				int mNo = new MemberService().selectMemberNo(userId);
				System.out.println(mNo);
				if(mNo>0) {//성공적으로 회원 번호를 가져왔다
					Animal a = new Animal();
					a.setmNo(mNo);
					a.setaName(pName);
					a.setKind(pKind);
					a.setWeight(pWeight);
					int animal = new MemberService().insertAnimal(a);
					
					if(animal>0) {//성공적으로 펫정보를 넣은경우
						out.print("success");
						out.flush();
						out.close();
						return;
					}else {//펫정보를 넣지 못한 경우
						out.print("failP");
						out.flush();
						out.close();
						return;
					}
					
				}else {//회원번호를 못가져왔다
					out.print("failP");
					out.flush();
					out.close();
					return;
				}
			}else {//펫정보 입력 안한경우
				out.print("success");
				out.flush();
				out.close();
				return;
			}
		}else {
			out.print("failM");
			out.flush();
			out.close();
			return;
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
