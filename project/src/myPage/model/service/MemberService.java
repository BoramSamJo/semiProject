package myPage.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import myPage.model.vo.Animal;
import member.model.vo.Member;
import myPage.model.dao.MemberDao;
import myPage.model.vo.CalendarViews;
import myPage.model.vo.IList;


public class MemberService {
	
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

	public static ArrayList<IList> insuranceUpdate(int mNo) {
		Connection conn = getConnection();
		ArrayList<IList> iList = new ArrayList<>();
		
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
