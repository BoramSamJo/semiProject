package calendar.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import calendar.model.dao.CalendarDao;
import calendar.model.vo.CalendarData;
import calendar.model.vo.CalendarViews;

public class CalendarService {

	public static ArrayList<CalendarViews> insertProduct(CalendarData cal) {
		Connection conn = getConnection();

		int result = CalendarDao.insertProduct(conn, cal);
		
		ArrayList<CalendarViews> clist = new ArrayList<>();
		if(result>0) {
			commit(conn);
			clist = CalendarDao.searchProduct(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return clist;
	}

	public static ArrayList<CalendarViews> searchCalendar() {
		Connection conn = getConnection();
		ArrayList<CalendarViews> clist = new ArrayList<>();
		
		clist = CalendarDao.searchProduct(conn);
		if(!clist.isEmpty()) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		
		close(conn);
		return clist;
	}

	public static ArrayList<CalendarViews> updateProduct(CalendarData cal) {
		Connection conn = getConnection();
		CalendarData cData = null;
		int result = 0;
		ArrayList<CalendarViews> clist = new ArrayList<>();
		
		cData = CalendarDao.checkTime(conn, cal);

		if(cData==null) {
			result = CalendarDao.updateProduct(conn, cal);
		}

		if(result>0) {
			commit(conn);
			clist = CalendarDao.searchProduct(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return clist;
	}

	public static ArrayList<CalendarViews> deleteProduct(int rNo) {
		Connection conn = getConnection();
		ArrayList<CalendarViews> clist = new ArrayList<>();
		
		int result = CalendarDao.deleteProduct(conn, rNo);
		
		if(result>0) {
			commit(conn);
			clist = CalendarDao.searchProduct(conn);
		}
		
		close(conn);
		return clist;
	}

}
