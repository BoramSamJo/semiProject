package member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import member.model.dao.AnimalDao;
import member.model.vo.Animal;
import static common.JDBCTemplate.*;

public class AnimalService {

	public ArrayList<Animal> animaldata() {
			Connection conn = getConnection();
			
			ArrayList<Animal> animal = new AnimalDao().animaldata(conn);
			close(conn);
			
			return animal;
	}

}
