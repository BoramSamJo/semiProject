package myPage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import myPage.model.service.AnimalService;
import myPage.model.vo.Animal;

/**
 * Servlet implementation class AnimalChange
 */
@WebServlet("/change.an")
public class AnimalChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnimalChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.valueOf(request.getParameter("userNo"));
		String animalNo = request.getParameter("animalNo");
		String name = request.getParameter("name");
		String kind = "("+request.getParameter("kind")+")"+request.getParameter("detail");
		int weight = Integer.valueOf(request.getParameter("weight"));
		ArrayList<Animal> aList = new ArrayList();
		Animal a = new Animal(animalNo, userNo, name, kind, weight);
		
		aList = AnimalService.changeAnimal(a);
		
		PrintWriter out = response.getWriter();
		response.setContentType("application/json");
		Gson gson = new Gson();
		gson.toJson(aList, response.getWriter());
		
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
