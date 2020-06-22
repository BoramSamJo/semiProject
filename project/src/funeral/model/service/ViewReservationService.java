package funeral.model.service;

import java.sql.Connection;

import funeral.model.dao.ViewReservationDao;
import funeral.model.vo.FuneralProduct;
import funeral.model.vo.SelectProduct;
import member.model.vo.Animal;
import static common.JDBCTemplate.*;

public class ViewReservationService {

	public Animal selectA(int memberNo) {
		Connection conn = getConnection();
		
		Animal a = new ViewReservationDao().selectA(conn, memberNo);
		
		close(conn);
		
		return a;
	}

	public FuneralProduct selectfp(String prodcutName) {
		Connection conn = getConnection();
		
		FuneralProduct fp = new ViewReservationDao().selectfp(conn, prodcutName);
		
		close(conn);
		
		return fp;
	}

	public SelectProduct selectsp(String selectShroud, String selectCoffin, String selectCremation) {
		Connection conn = getConnection();
		
		SelectProduct sp = new ViewReservationDao().selectsp(conn, selectShroud, selectCoffin, selectCremation);
		System.out.println("service sp : " + sp);
		close(conn);
		
		return sp;
	}

	public int insertfl(String spNo, int fpNo, String animalNo, int memberNo, String reservationDate,
			String reservationTime) {
		Connection conn = getConnection();
		
		int fl = new ViewReservationDao().insertfl(conn, spNo, fpNo, animalNo, memberNo, reservationDate, reservationTime);
		
		if(fl>0) {
			System.out.println("커밋");
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return fl;
	}

	public int insertAnimal(int memberNo, String aName, double weight, String kind) {
		Connection conn = getConnection();
		
		int insertA = new ViewReservationDao().insertAnimal(conn, memberNo, aName, weight, kind);
		
		if(insertA>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return insertA;
	}


	

}
