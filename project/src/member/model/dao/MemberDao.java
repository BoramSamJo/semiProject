package member.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.model.vo.QnABoard;
import member.model.vo.Animal;
import member.model.vo.Member;

public class MemberDao {
	
	public int matchingId(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		String query = "SELECT COUNT(*) FROM MEMBER WHERE MEMBER_ID = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getInt(1)==1) {
					result = 1;					
				}else {
					result = 0;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}
	
	public Member loginMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member = null;
		
		String query = "SELECT * FROM MEMBER WHERE MEMBER_ID = ? AND MEMBER_PWD = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getmId());
			pstmt.setString(2, m.getmPwd());
			rs = pstmt.executeQuery();

			if(rs.next()) {
				member = new Member(rs.getInt("MEMBER_NO")
									, rs.getInt("INS_CODE")
									, rs.getString("MEMBER_ID")
									, rs.getString("MEMBER_PWD")
									, rs.getString("MEMBER_NAME")
									, rs.getString("PHONE")
									, rs.getString("EMAIL")
									, rs.getString("ADDRESS")
									, rs.getString("ENROLL_DATE")
									, rs.getString("MODIFY_DATE")
									, rs.getString("STATUS")
									);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return member;
	}

	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = "INSERT INTO MEMBER VALUES((SELECT MAX(MEMBER_NO)+1 FROM MEMBER), NULL, ?, ?, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getmId());
			pstmt.setString(2, m.getmPwd());
			pstmt.setString(3, m.getmName());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getAddress());
			pstmt.setString(7, m.getMailServie());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectMemberNo(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int mNo = 0;
		
		String query = "SELECT MEMBER_NO FROM MEMBER WHERE MEMBER_ID =?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mNo = rs.getInt("MEMBER_NO");
				System.out.println("dao에서 mNo : " + mNo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return mNo;
	}

	public int insertAnimal(Connection conn, Animal a) {
		PreparedStatement pstmt = null;
		int animal = 0;

		String query = "INSERT INTO ANIMAL VALUES((SELECT NVL(MAX(a_no), 0)+1 FROM ANIMAL), ?, ?, ?, ?, DEFAULT)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, a.getmNo());
			pstmt.setString(2, a.getaName());
			pstmt.setString(3, a.getKind());
			pstmt.setString(4, a.getWeight());
			animal = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return animal;
	}



	

}
