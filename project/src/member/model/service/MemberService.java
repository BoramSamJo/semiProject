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

	public int memberGone(String mId) {
		Connection conn = getConnection();
		
		int result = new MemberDao().memberGone(conn, mId);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int updateAnimal(Animal a) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateAnimal(conn, a);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int getSearchListCount(String colName, String searchText) {
		Connection conn = getConnection();
		
		int listCount = new MemberDao().getSearchListCount(conn, colName, searchText);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Member> searchMember(Pagination p, String colName, String searchText) {
		Connection conn = getConnection();
		
		ArrayList<Member> member = new MemberDao().searchMember(conn, p, colName, searchText);
		
		close(conn);
		
		return member;
	}

	public int getForMailListCount(String colName, String completeDate) {
		Connection conn = getConnection();
		
		int listCount = new MemberDao().getForMailListCount(conn, colName, completeDate);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Member> searchForMail(Pagination p, String colName, String completeDate) {
		Connection conn = getConnection();
		
		ArrayList<Member> member = new MemberDao().searchForMail(conn, p, colName, completeDate);
		
		close(conn);
		
		return member;
	}


}
