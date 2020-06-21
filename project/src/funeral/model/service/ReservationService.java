package funeral.model.service;

import java.sql.Connection;
import static common.JDBCTemplete.*;

import funeral.model.dao.ReservationDao;
import funeral.model.vo.Reservation;

public class ReservationService {

	public int insertOrder(Reservation reservation) {
		Connection conn = getConnection();
		
		int result = new ReservationDao().insertOrder(conn,reservation);
		System.out.println("service result 반환 : " + result);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

}
