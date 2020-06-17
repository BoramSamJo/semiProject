package Member.model.service;

import java.sql.Connection;

import Member.model.dao.MemberDao;
import Member.model.vo.Member;
import static common.JDBCTemplete.*;

public class MemberService {

	public Member login(Member member) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao().login(conn,member);
		System.out.println("service에서 뽑아내는 값 : " + loginUser);
		close(conn);
		return loginUser;
	}

	public Member userMember(String userId) {
		Connection conn = getConnection();
		System.out.println("service userId :" + userId);
		Member member = new MemberDao().loginMember(conn,userId);
		close(conn);
		return member;
	}

}
