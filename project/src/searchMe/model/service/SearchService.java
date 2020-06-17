package searchMe.model.service;

import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import searchMe.model.dao.SearchDao;
import member.model.vo.Member;

public class SearchService {

	public static ArrayList<Member> searchId(Member m) {
		Connection conn = getConnection();
		ArrayList<Member> mList = new ArrayList();
		
		mList = SearchDao.searchId(conn, m);
		
		close(conn);
		return mList;
	}

	public static Member searchPwd(Member m) {
		Connection conn = getConnection();
		Member m2 = new Member();
		
		m2 = SearchDao.searchPwd(conn, m);
		
		return m2;
	}

	public static Member newPwd(Member m) {
		Connection conn = getConnection();
		Member m2 = new Member();
		
		int result = SearchDao.newPwd(conn, m);
		
		if(result>0) {
			commit(conn);
			m2 = SearchDao.searchPwd(conn, m);
		}else {
			rollback(conn);
		}
		
		return m2;
	}

}
