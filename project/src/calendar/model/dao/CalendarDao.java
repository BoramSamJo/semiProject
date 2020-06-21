package calendar.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import calendar.model.vo.CalendarData;
import calendar.model.vo.CalendarViews;

public class CalendarDao {

	public static int insertProduct(Connection conn, CalendarData cal) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO FU_LIST VALUES (SEQ_RNO.NEXTVAL,?,?,?,?,'Y')";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cal.getProductNo());
			pstmt.setInt(2, cal.getMemberNo());
			pstmt.setString(3, cal.getReservationDate());
			pstmt.setString(4, cal.getReservationTime());
			
			result = pstmt.executeUpdate();
//			System.out.println("Dao에서 값을 넣은 후 : "+result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public static ArrayList<CalendarViews> searchProduct(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<CalendarViews> clist = new ArrayList<>();
		
		String query = "SELECT * FROM CLIST WHERE STATUS='Y'";

		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				clist.add(new CalendarViews(rs.getInt("RESERVATION_NO"),
											rs.getInt("PRODUCT_NO"),
											rs.getInt("A_NO"),
											rs.getInt("MEMBER_NO"),
											rs.getString("RESERVATION_DATE"),
											rs.getString("RESERVATION_TIME"),
											rs.getString("STATUS"),
											rs.getString("PRODUCT_NAME"),
											rs.getInt("PRICE"),
											rs.getString("A_NAME"),
											rs.getString("KIND"),
											rs.getInt("WEIGHT"),
											rs.getString("MEMBER_NAME")));
//				System.out.println("Dao에서 장례식 정보 : "+clist);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return clist;
	}

	public static int updateProduct(Connection conn, CalendarData cal) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE FU_LIST SET PRODUCT_NO=?,RESERVATION_DATE=?,RESERVATION_TIME=? WHERE RESERVATION_NO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cal.getProductNo());
			pstmt.setString(2, cal.getReservationDate());
			pstmt.setString(3, cal.getReservationTime());
			pstmt.setInt(4, cal.getReservationNo());
			
			result = pstmt.executeUpdate();
//			System.out.println("일정 변경Dao 후 : "+result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public static int deleteProduct(Connection conn, int rNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE FU_LIST SET STATUS='N' WHERE RESERVATION_NO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public static CalendarData checkTime(Connection conn, CalendarData cal) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CalendarData cData = null;
		String query="SELECT * FROM FU_LIST WHERE RESERVATION_DATE=? AND RESERVATION_TIME=? AND STATUS='Y'";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cal.getReservationDate());
			pstmt.setString(2, cal.getReservationTime());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
					cData = new CalendarData(rs.getInt("RESERVATION_NO"),
							rs.getInt("PRODUCT_NO"),
							rs.getInt("A_NO"),
							rs.getInt("MEMBER_NO"),
							rs.getString("RESERVATION_DATE"),
							rs.getString("RESERVATION_TIME"),
							rs.getString("STATUS"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return cData;			
	}


}
