package funeral.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import funeral.model.service.ViewReservationService;
import funeral.model.vo.FuneralProduct;
import funeral.model.vo.Reservation;
import funeral.model.vo.SelectProduct;
import member.model.service.AnimalService;
import member.model.service.MemberService;
import member.model.vo.Animal;
import member.model.vo.Member;

/**
 * Servlet implementation class ViewReservation
 */
@WebServlet("/view.f")
public class ViewReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
		
		// 2. jsp에서 받아 객체에 넘길 변수
		String reservationD = request.getParameter("plusDate"); //date형으로 변환
		// String으로 받아온 값을 Date형으로 변환
		String yy = reservationD.substring(0, 4);
		String mm = reservationD.substring(reservationD.indexOf(" ")+1,reservationD.indexOf("월"));
		String dd = reservationD.substring(reservationD.indexOf("월")+1,reservationD.indexOf("일"));
		
		if(mm.length()<1) {
			mm = "0"+mm;
		}
		if(dd.length()<1) {
			dd = "0"+dd;
		}
		String change = yy+"/"+mm+"/"+dd;
		
		String reservationDate = change;
		String reservationTime = request.getParameter("plusTime");
		String prodcutName = request.getParameter("funeralSelect");
		String selectShroud = request.getParameter("funeralSelect1");
		String selectCoffin = request.getParameter("funeralSelect2");
		String selectCremation = request.getParameter("funeralSelect3");
		String memberName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		System.out.println("phone 반환값 : " + phone);
		String address = request.getParameter("address");
		String aName = request.getParameter("pName");
		String weightD = request.getParameter("pWeight"); // double형으로 바꿈
		double weight = Double.parseDouble(weightD);
		String p1 = request.getParameter("pKindMain"); // p1과 p2를 합쳐서 (개)품종
		String p2 = request.getParameter("pKindServe");
		String kind = "("+p1+")".concat(p2);
		
		
		// test용도
		Reservation vr = new Reservation(reservationDate,reservationTime,prodcutName,selectShroud,
				selectCoffin,selectCremation,memberName,phone,address,aName,weightD,p1,p2);
		System.out.println(vr);
////		
		int result = new ViewReservationService().insertReservation(vr);
		
//		if(result>0) {
//			System.out.println("성공!");
//		}else {
//			System.out.println("실패!");
//		}
		
		// member의 phone정보로 member객체 select
		Member member = new MemberService().memberdata(phone);
		System.out.println("member : " + member);
		// member 번호
		int memberNo = member.getmNo();
		// animal의 정보를 배열로 받아 들여 memberNo와 비교해 fu_list에 추가
		ArrayList<Animal> animal = new AnimalService().animaldata();
		System.out.println("animal 반환 값 : " + animal);
		for(int i=0;i<animal.size();i++) {
			// animal의 member번호
			int memberANo = animal.get(i).getmNo();
			// animal 번호
			int animalNo = animal.get(i).getaNo();
			if(memberNo == memberANo) {
				System.out.println("성공");
				// 창을 열어주고, 장례 서비스와 선택사항을 가져와 비교하여 각 번호를 뽑아와 fu_list에 insert 작업으로 추가
				// member의 mNo와 animal의 mNo 를 비교해서 animal 객체 select
				Animal a = new ViewReservationService().selectA(memberNo);
				System.out.println("animal 반환 값 : " + a);
				// 장례 서비스에서 장례 코드 가져오기
				FuneralProduct fp = new ViewReservationService().selectfp(prodcutName);
				System.out.println("FuneralProduct 객체 반환 : " + fp);
				// 장례상품 번호
				int fpNo = fp.getProductNo();
				System.out.println(selectShroud);
				System.out.println(selectCoffin);
				System.out.println(selectCremation);
				SelectProduct sp = new ViewReservationService().selectsp(selectShroud, selectCoffin, selectCremation);
				System.out.println("SelectProduct 객체 반환 : " + sp);
				// 장례 선택용품 상품 코드
				String spNo = sp.getSelectCode();
				System.out.println("spNo : " + spNo);
				int fl = new ViewReservationService().insertfl(spNo,fpNo,animalNo,memberNo,reservationDate,reservationTime);
				System.out.println("fu_list 객체 반환 : " + fl);
				System.out.println("fu_list 추가 성공!");
				break;
			}else {
				// 다를시에는 animal정보를 insert함
				System.out.println("animal 새로 저장");
				int insertA = new ViewReservationService().insertAnimal(memberNo,aName,weight,kind);
				// 장례 서비스에서 장례 코드 가져오기
				FuneralProduct fp = new ViewReservationService().selectfp(prodcutName);
				System.out.println("FuneralProduct 객체 반환 : " + fp);
				// 장례상품 번호
				int fpNo = fp.getProductNo();
				SelectProduct sp = new ViewReservationService().selectsp(selectShroud,selectCoffin,selectCremation);
				System.out.println("SelectProduct 객체 반환 : " + sp);
				// 장례 선택용품 상품 코드
				String spNo = sp.getSelectCode();
				int fl = new ViewReservationService().insertfl(spNo,fpNo,animalNo,memberNo,reservationDate,reservationTime);
				System.out.println("fu_list 객체 반환 : " + fl);
			}
			
			
			
			// 홈으로 돌아감
//			RequestDispatcher view = null;
//			
//			view = request.getRequestDispatcher("/index.jsp");
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
