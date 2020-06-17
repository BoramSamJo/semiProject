package Funeral.model.service;

import static common.JDBCTemplete.*;

import java.sql.Connection;

import Funeral.model.dao.ReservationDao;
import Funeral.model.vo.Reservation;

public class ReservationService {

	public int insertOrder(Reservation reservation) {
		// 문제 1. JDBCTemplate에러(못받아 온다)
		Connection conn = getConnection();
		
		int result = new ReservationDao().insertOrder(conn,reservation);
		System.out.println("service result : " + result);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	

	

}
