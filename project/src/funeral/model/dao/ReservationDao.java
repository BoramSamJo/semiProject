package funeral.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import static common.JDBCTemplete.*;
import funeral.model.vo.Reservation;

public class ReservationDao {

	public int insertOrder(Connection conn, Reservation reservation) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO RESERVATION VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, reservation.getPlusDate());
			pstmt.setString(2, reservation.getPlusTime());
			pstmt.setString(3, reservation.getFuneralSelect());
			pstmt.setString(4, reservation.getFuneralSelect1());
			pstmt.setString(5, reservation.getFuneralSelect2());
			pstmt.setString(6, reservation.getFuneralSelect3());
			pstmt.setString(7, reservation.getUserName());
			pstmt.setString(8, reservation.getPhone());
			pstmt.setString(9, reservation.getAddress());
			pstmt.setString(10, reservation.getpName());
			pstmt.setString(11, reservation.getpWeight());
			pstmt.setString(12, reservation.getpKindMain());
			pstmt.setString(13, reservation.getpKindServe());
			
			result = pstmt.executeUpdate();
			System.out.println("dao 반환값 result : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}
