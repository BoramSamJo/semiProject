package member.model.service;

import static common.JDBCTemplete.*;
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
	
	// test 바꿔야함 
	public Member logindata(String mId) {
		Connection conn = getConnection();
		Member member = new MemberDao().logindata(conn,mId);
		close(conn);
		return member;
	}

	public Member memberdata(String phone) {
		Connection conn = getConnection();
		Member member = new MemberDao().memberdata(conn,phone);
		close(conn);
		return member;
	}



}
