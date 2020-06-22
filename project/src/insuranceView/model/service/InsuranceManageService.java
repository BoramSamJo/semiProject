package insuranceView.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.vo.Pagination;
import insuranceView.model.dao.InsuranceManageDao;
import insuranceView.model.vo.InsuranceManage;
import member.model.vo.Member;

public class InsuranceManageService {

	public static ArrayList<InsuranceManage> firstUpdate(Pagination p) {
		Connection conn = getConnection();
		ArrayList<InsuranceManage> iList = new ArrayList();
		
		iList = InsuranceManageDao.firstUpdate(conn, p);
		
		if(!iList.isEmpty()) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return iList;
	}

	public static int getListCount() {
		Connection conn = getConnection();
		
		int listCount = InsuranceManageDao.getListCount(conn);
		
		if(listCount>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return listCount;
	}

	public static int getListCount(String select, String search) {
		Connection conn = getConnection();
		
		int listCount = InsuranceManageDao.getListCount(conn, select, search);

		if(listCount>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return listCount;
	}

	public static ArrayList<InsuranceManage> getInsList(Pagination p, String select, String search) {
		Connection conn = getConnection();
		
		ArrayList<InsuranceManage> iList = InsuranceManageDao.getInsList(conn, p, select, search);
		
		if(!iList.isEmpty()) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return iList;
	}

	public static int deleteIns(int insNo) {
		Connection conn = getConnection();
		
		int result = InsuranceManageDao.deleteIns(conn, insNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

}
