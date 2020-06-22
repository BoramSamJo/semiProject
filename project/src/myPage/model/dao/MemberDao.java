package myPage.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import myPage.model.vo.Animal;
import member.model.vo.Member;
import myPage.model.vo.CalendarViews;
import myPage.model.vo.IList;

public class MemberDao {

	public static int changePwd(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query="UPDATE MEMBER SET MEMBER_PWD=?, MODIFY_DATE=SYSDATE WHERE MEMBER_ID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getmPwd());
			pstmt.setString(2, m.getmId());
			
			result = pstmt.executeUpdate();
//			System.out.println("dao에서 업데이트 확인:"+result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public static int changeEmail(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query= "UPDATE MEMBER SET EMAIL=?, MODIFY_DATE=SYSDATE WHERE MEMBER_ID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getmPwd());
			pstmt.setString(2, m.getmId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public static Member showMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m2 = null;
		
		String query = "SELECT * FROM MEMBER WHERE MEMBER_ID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getmId());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				m2 = new Member(rs.getInt("MEMBER_NO"),
								rs.getString("MEMBER_ID"),
								rs.getString("MEMBER_PWD"),
								rs.getString("MEMBER_NAME"),
								rs.getString("PHONE"),
								rs.getString("EMAIL"),
								rs.getString("ADDRESS"),
								rs.getString("ENROLL_DATE"),
								rs.getString("MODIFY_DATE"),
								rs.getString("STATUS")
								);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return m2;
	}

	public static int changePhone(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query= "UPDATE MEMBER SET PHONE=?, MODIFY_DATE=SYSDATE WHERE MEMBER_ID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getmPwd());
			pstmt.setString(2, m.getmId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public static int changeAddress(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query= "UPDATE MEMBER SET ADDRESS=?, MODIFY_DATE=SYSDATE WHERE MEMBER_ID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getmPwd());
			pstmt.setString(2, m.getmId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public static Member firstUpdate(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		
		String query = "SELECT * FROM MEMBER WHERE MEMBER_ID=? AND STATUS='Y'";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				m = new Member(rs.getInt("MEMBER_NO"),
								rs.getString("MEMBER_ID"),
								rs.getString("MEMBER_PWD"),
								rs.getString("MEMBER_NAME"),
								rs.getString("PHONE"),
								rs.getString("EMAIL"),
								rs.getString("ADDRESS"),
								rs.getString("ENROLL_DATE"),
								rs.getString("MODIFY_DATE"),
								rs.getString("STATUS")
								);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return m;
	}

	public static ArrayList<Animal> firstUpdate(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Animal> aList = new ArrayList<>();
		
		String query = "SELECT * FROM ANIMAL WHERE MEMBER_NO=? AND STATUS='N'";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Animal a = new Animal(rs.getString("A_NO"),
							   rs.getInt("MEMBER_NO"),
							   rs.getString("A_NAME"),
							   rs.getString("KIND"),
							   rs.getInt("WEIGHT"),
							   rs.getString("STATUS"));
				aList.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return aList;
	}

	public static ArrayList<CalendarViews> reservationUpdate(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CalendarViews cView = null;
		ArrayList<CalendarViews> rList = new ArrayList();
		
		String query="SELECT * FROM RLIST WHERE MEMBER_NO=? AND STATUS='Y'";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				cView = new CalendarViews(rs.getInt("RESERVATION_NO"),
											rs.getInt("PRODUCT_NO"),
											rs.getInt("A_NO"),
											rs.getInt("MEMBER_NO"),
											rs.getString("RESERVATION_DATE"),
											rs.getString("RESERVATION_TIME"),
											rs.getString("STATUS"),
											rs.getString("PRODUCT_NAME"),
											rs.getInt("PRICE"),
											rs.getString("A_NAME"));
				rList.add(cView);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return rList;
	}

	public static ArrayList<IList> insuranceUpdate(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		IList ins = new IList();
		ArrayList<IList> iList = new ArrayList();
		
		String query = "SELECT * FROM ILIST WHERE MEMBER_NO=? AND STATUS='Y'";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, mNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ins = new IList(rs.getInt("INS_NO"),
									rs.getString("INS_CODE"),
									rs.getInt("MEMBER_NO"),
									rs.getString("ENROLL_DATE"),
									rs.getString("STATUS"),
									rs.getString("INS_NAME"),
									rs.getString("INS_CONTENT"),
									rs.getString("KIND"),
									rs.getString("AGE"),
									rs.getInt("PRICE"),
									rs.getString("A_NAME"));
				iList.add(ins);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return iList;
	}

	public static int deleteUser(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE MEMBER SET STATUS='N' WHERE MEMBER_NO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public static Member searchMember(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		
		String query = "SELECT * FROM MEMBER WHERE MEMBER_NO=? AND STATUS='Y'";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, mNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				m = new Member(rs.getInt("MEMBER_NO"),
								rs.getString("MEMBER_ID"),
								rs.getString("MEMBER_PWD"),
								rs.getString("MEMBER_NAME"),
								rs.getString("PHONE"),
								rs.getString("EMAIL"),
								rs.getString("ADDRESS"),
								rs.getString("ENROLL_DATE"),
								rs.getString("MODIFY_DATE"),
								rs.getString("STATUS")
								);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return m;
	}

	

}
