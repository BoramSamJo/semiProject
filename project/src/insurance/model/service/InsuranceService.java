package insurance.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import insurance.model.dao.InsuranceDao;
import insurance.model.vo.Insurance;

public class InsuranceService {
	
	// DB넘어오는지 확인용
//	public ArrayList<Insurance> selectAllIns(){
//		Connection conn = getConnection();
//		
//		InsuranceDao id = new InsuranceDao();
//		
//		ArrayList<Insurance> list = id.selectAllIns(conn);
//		
//		return list;
//	}

	public Insurance calculateIns(Insurance ins) {
		Connection conn = getConnection();
		
		Insurance result = new InsuranceDao().calculateIns(conn, ins);
		
		close(conn);
		
		return result;
	}

}
