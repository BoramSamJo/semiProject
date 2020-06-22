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
		
		String query = "SELECT * FROM MEMBER WHERE MEMBER_ID = ? AND MEMBER_PWD = ? AND STATUS='Y'";
		
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

	public int getForMailListCount(Connection conn, String colName, String completeDate) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount = 0;
		
		
		//보험내역과 합쳐야하는 경우vs장례예약내역과 합쳐야하는 경우를 나눔
		String query = "";
		if(colName.equals("INS")) {
			query = "SELECT COUNT(*)\r\n" + 
					"FROM MEMBER M, INS_LIST I\r\n" + 
					"WHERE M.MEMBER_NO=I.MEMBER_NO AND TO_CHAR(I.ENROLL_DATE,'YY/MM/DD') = TO_CHAR(SYSDATE-?,'YY/MM/DD') AND I.STATUS='Y' AND M.STATUS='Y'";
		}else if(colName.equals("FU")){
			query = "SELECT COUNT(*) FROM MEMBER M JOIN FU_LIST F USING (MEMBER_NO) WHERE TO_CHAR(RESERVATION_DATE,'YY/MM/DD') = TO_CHAR(SYSDATE-?,'YY/MM/DD') AND F.STATUS='Y' AND M.STATUS='Y'";
		}
		int cd = Integer.valueOf(completeDate);
		try {
			System.out.println("리스트세기 갔다오기전");
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cd);
			rs = pstmt.executeQuery();
			System.out.println("리스트세기 갔다오기후");
			
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

	public ArrayList<Member> searchForMail(Connection conn, Pagination p, String colName, String completeDate) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		ArrayList<Member> member = new ArrayList<>();
		
		int currentPage = p.getCurrentPage();
		int limit = p.getLimit();
		int startRow = (currentPage-1)*limit+1;
		int endRow = currentPage*limit;
		
		//보험내역과 합쳐야하는 경우vs장례예약내역과 합쳐야하는 경우를 나눔
		String query = "";
		String col = "";
		if(colName.equals("INS")) {
			query = "SELECT * FROM\r\n" + 
					"(SELECT ROWNUM RNUM, A.* FROM\r\n" + 
					"(SELECT I.ENROLL_DATE,  M.MEMBER_NO, MEMBER_NAME, MEMBER_ID, PHONE, EMAIL, ADDRESS, M.STATUS, MAIL_SERVICE\r\n" + 
					"FROM MEMBER M, INS_LIST I\r\n" + 
					"WHERE M.MEMBER_NO=I.MEMBER_NO AND TO_CHAR(I.ENROLL_DATE,'YY/MM/DD') = TO_CHAR(SYSDATE-?,'YY/MM/DD') AND I.STATUS='Y' AND M.STATUS='Y'\r\n" + 
					"ORDER BY I.ENROLL_DATE DESC) A)\r\n" + 
					"WHERE RNUM BETWEEN ? AND ?";
			col="ENROLL_DATE";
		}else {
			query = "SELECT * FROM\r\n" + 
					"(SELECT ROWNUM RNUM, A.* FROM\r\n" + 
					"(SELECT RESERVATION_DATE,  MEMBER_NO, MEMBER_NAME, MEMBER_ID, PHONE, EMAIL, ADDRESS, ENROLL_DATE, M.STATUS, MAIL_SERVICE \r\n" + 
					"FROM MEMBER M JOIN FU_LIST F USING (MEMBER_NO)\r\n" + 
					"WHERE TO_CHAR(RESERVATION_DATE,'YY/MM/DD') = TO_CHAR(SYSDATE-?,'YY/MM/DD') AND F.STATUS='Y' AND M.STATUS='Y'\r\n" + 
					"ORDER BY RESERVATION_DATE DESC) A)\r\n" + 
					"WHERE RNUM BETWEEN ? AND ?";
			col="RESERVATION_DATE";
		}
		int cd = Integer.valueOf(completeDate);
		System.out.println("조회갔다오기 전");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cd);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rs = pstmt.executeQuery();
			System.out.println("조회갔다오기 후");

			while(rs.next()) {
				m = new Member(
								rs.getInt(1)
								, rs.getInt("MEMBER_NO")
								, rs.getString("MEMBER_ID")
								, rs.getString("MEMBER_NAME")
								, rs.getString("PHONE")
								, rs.getString("EMAIL")
								, rs.getString("ADDRESS")
								, rs.getString(col)
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

	public Member selectMember(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member = null;
		
		String query = "SELECT * FROM MEMBER WHERE MEMBER_NO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, mNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new Member(rs.getInt("MEMBER_NO"),
									rs.getString("MEMBER_ID"),
									rs.getString("MEMBER_PWD"),
									rs.getString("MEMBER_NAME"),
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

	public Member memberdata(Connection conn, String phone) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member = null;
		
		String query = "SELECT * FROM MEMBER WHERE PHONE=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, phone);
			
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
						, rs.getString("MAIL_SERVICE"));		
			
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return member;
	}





	

}
