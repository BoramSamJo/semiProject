package Member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Member.model.vo.Member;

import static common.JDBCTemplete.*;

public class MemberDao {

	public Member login(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member loginUser = null;
		String query = "SELECT * FROM MEMBER WHERE USERID=?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
//			System.out.println(member.getUserId());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				loginUser = new Member(rs.getString("USERID"),
										rs.getString("PHONE"),
										rs.getString("ADDRESS"));
			}
				System.out.println("dao 로그인정보 : " + loginUser);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return loginUser;
	}

	public Member loginMember(Connection conn, String userId) {
		System.out.println("memberDao userId : " + userId);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member = null;
		
		String query = "SELECT * FROM MEMBER WHERE USER_ID=?";
		
		
		
		try {
			pstmt =  conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			// 실행이안된다 생각됨(자바 member클래스의 값과 DB값이 같으면 null값이 나온다?)
			if(rs.next()) {
				member = new Member(rs.getString("USER_ID"),
									rs.getString("PHONE"),
									rs.getString("ADDRESS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return member;
	}

}
