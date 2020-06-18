package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.QnADao;
import board.model.vo.Pagination;
import board.model.vo.QnABoard;
import member.model.dao.MemberDao;
import member.model.vo.Animal;
import member.model.vo.Member;
import myPage.model.vo.CalendarViews;
import myPage.model.vo.Insurance;


public class MemberService {
	//로그인시 존재하는 아이디였는지 확인해주는 겸 회원가입시 중복체크
	public int matchingId(String userId) {
		Connection conn = getConnection();
		
		int result = new MemberDao().matchingId(conn, userId);
		
		close(conn);
		
		return result;
	}
	
	public Member loginMember(Member m) {
		Connection conn = getConnection();
		
		Member member = new MemberDao().loginMember(conn, m);
		
		close(conn);
		
		return member;
	}

	public int insertMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int selectMemberNo(String userId) {
		Connection conn = getConnection();
		
		int mNo = new MemberDao().selectMemberNo(conn, userId);
		
		close(conn);
		
		return mNo;
	}

	public int insertAnimal(Animal a) {
		Connection conn = getConnection();
		
		int animal = new MemberDao().insertAnimal(conn, a);
		
		if(animal>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return animal;
	}

	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new MemberDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Member> selectAllMember(Pagination p) {
		Connection conn = getConnection();
		
		ArrayList<Member> member = new MemberDao().selectAllMember(conn, p);
		
		close(conn);
		
		return member;
	}

	public ArrayList<Animal> selectAllAnimal() {
		Connection conn = getConnection();
		
		ArrayList<Animal> animal = new MemberDao().selectAllAnimal(conn);
		
		close(conn);
		
		return animal;	
	}
	public static int changePwd(Member m) {
		Connection conn = getConnection();
		
		int result = MemberDao.changePwd(conn,m);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public static Member changeEmail(Member m) {
		Connection conn = getConnection();
		Member m2 = null;
		int result = MemberDao.changeEmail(conn,m);
		
		if(result>0) {
			commit(conn);
			m2 = MemberDao.showMember(conn,m);
		}else {
			rollback(conn);
		}
		
		return m2;
	}

	public static Member changePhone(Member m) {
		Connection conn = getConnection();
		Member m2 = null;
		int result = MemberDao.changePhone(conn,m);
		
		if(result>0) {
			commit(conn);
			m2 = MemberDao.showMember(conn,m);
		}else {
			rollback(conn);
		}
		
		return m2;
	}

	public static Member changeAddress(Member m) {
		Connection conn = getConnection();
		Member m2 = null;
		int result = MemberDao.changeAddress(conn,m);
		
		if(result>0) {
			commit(conn);
			m2 = MemberDao.showMember(conn,m);
		}else {
			rollback(conn);
		}
		
		return m2;
	}

	public static Member firstUpdate(String userId) {
		Connection conn = getConnection();
		
		Member m = MemberDao.firstUpdate(conn,userId);
		
		if(m != null) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return m;
	}

	public static ArrayList<Animal> animalUpdate(int memberNo) {
		Connection conn = getConnection();
		ArrayList<Animal> aList = new ArrayList<>();
		aList = MemberDao.firstUpdate(conn,memberNo);
		
		if(!aList.isEmpty()) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return aList;
	}

	public static ArrayList<CalendarViews> reservationUpdate(int memberNo) {
		Connection conn = getConnection();
		ArrayList<CalendarViews> rList = new ArrayList();
		
		rList = MemberDao.reservationUpdate(conn,memberNo);
		
		if(!rList.isEmpty()) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return rList;
	}

	public static ArrayList<Insurance> insuranceUpdate(int mNo) {
		Connection conn = getConnection();
		ArrayList<Insurance> iList = new ArrayList<>();
		
		iList = MemberDao.insuranceUpdate(conn, mNo);
		
		if(!iList.isEmpty()) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return iList;
	}

	public static int deleteUser(int userNo) {
		Connection conn = getConnection();
		
		int result = MemberDao.deleteUser(conn, userNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}



}
