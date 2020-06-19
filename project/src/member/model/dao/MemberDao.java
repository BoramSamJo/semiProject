package member.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.model.vo.Pagination;
import board.model.vo.QAnswer;
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
		}finally {
			close(pstmt);
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
									, rs.getString("MEMBER_ID")
									, rs.getString("MEMBER_PWD")
									, rs.getString("MEMBER_NAME")
									, rs.getString("PHONE")
									, rs.getString("EMAIL")
									, rs.getString("ADDRESS")
									, rs.getString("ENROLL_DATE")
									, rs.getString("MODIFY_DATE")
									, rs.getString("STATUS")
									, rs.getString("MAIL_SERVICE")
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

		String query = "INSERT INTO MEMBER VALUES((SELECT MAX(MEMBER_NO)+1 FROM MEMBER), ?, ?, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT, ?)";
		
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

	public int getListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount = 0;
		
		String query = "SELECT COUNT(*) FROM MEMBER WHERE STATUS = 'Y'";
		
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return listCount;
	}

	public ArrayList<Member> selectAllMember(Connection conn, Pagination p) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		ArrayList<Member> member = new ArrayList<>();
		
		int currentPage = p.getCurrentPage();
		int limit = p.getLimit();
		int startRow = (currentPage-1)*limit+1;
		int endRow = currentPage*limit;

		
		String query = "SELECT * FROM (SELECT ROWNUM RNUM, M.* FROM (SELECT * FROM MEMBER WHERE STATUS='Y' AND MEMBER_NO!=1 ORDER BY ENROLL_DATE DESC) M) WHERE RNUM BETWEEN ? AND ? ORDER BY RNUM";
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				m = new Member(
								rs.getInt(1)
								, rs.getInt("MEMBER_NO")
								, rs.getString("MEMBER_ID")
								, rs.getString("MEMBER_PWD")
								, rs.getString("MEMBER_NAME")
								, rs.getString("PHONE")
								, rs.getString("EMAIL")
								, rs.getString("ADDRESS")
								, rs.getString("ENROLL_DATE")
								, rs.getString("MODIFY_DATE")
								, rs.getString("STATUS")
								, rs.getString("MAIL_SERVICE")
								);
				member.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return member;
	}

	public ArrayList<Animal> selectAllAnimal(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Animal a = null;
		ArrayList<Animal> animal = new ArrayList<>();
		
		String query = "SELECT * FROM ANIMAL";
		
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				a = new Animal(
								rs.getString("A_NO")
								, rs.getInt("MEMBER_NO")
								, rs.getString("A_NAME")
								, rs.getString("KIND")
								, rs.getString("WEIGHT")
								, rs.getString("STATUS")
								);
				animal.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return animal;
	}

	public int memberGone(Connection conn, String mId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = "UPDATE MEMBER SET STATUS = 'N' WHERE MEMBER_ID = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mId);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateAnimal(Connection conn, Animal a) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = "UPDATE ANIMAL SET A_NAME=?, KIND=?, WEIGHT=?, STATUS=? WHERE MEMBER_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, a.getaName());
			pstmt.setString(2, a.getKind());
			pstmt.setString(3, a.getWeight());
			pstmt.setString(4, a.getStatus());
			pstmt.setInt(5, a.getmNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getSearchListCount(Connection conn, String colName, String searchText) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount = 0;

		String query = "SELECT COUNT(*) FROM MEMBER WHERE "+colName+" LIKE '%"+searchText+"%' AND STATUS = 'Y' AND MEMBER_NO !=1";
		
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return listCount;
	}

	public ArrayList<Member> searchMember(Connection conn, Pagination p, String colName, String searchText) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		ArrayList<Member> member = new ArrayList<>();
		
		int currentPage = p.getCurrentPage();
		int limit = p.getLimit();
		int startRow = (currentPage-1)*limit+1;
		int endRow = currentPage*limit;

		String query = "SELECT * FROM (SELECT ROWNUM RNUM, M.* FROM (SELECT * FROM MEMBER WHERE "+colName+" LIKE '%"+searchText+"%' AND STATUS = 'Y' AND MEMBER_NO!=1 ORDER BY ENROLL_DATE DESC) M) WHERE RNUM BETWEEN ? AND ? ORDER BY RNUM";		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				m = new Member(
								rs.getInt(1)
								, rs.getInt("MEMBER_NO")
								, rs.getString("MEMBER_ID")
								, rs.getString("MEMBER_PWD")
								, rs.getString("MEMBER_NAME")
								, rs.getString("PHONE")
								, rs.getString("EMAIL")
								, rs.getString("ADDRESS")
								, rs.getString("ENROLL_DATE")
								, rs.getString("MODIFY_DATE")
								, rs.getString("STATUS")
								, rs.getString("MAIL_SERVICE")
								);
				member.add(m);
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
