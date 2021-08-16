package controller;

import java.io.IOException;
import java.util.HashMap;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet{

	HashMap<String,Controller>list = null;	//Key : URL value :컨트롤러객체
	
	@Override
	public void init() throws ServletException {
		list = new HashMap();
		list.put("/lms/View/MemberJoin.do",new MemberInsertController());	
	}
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String URL = request.getRequestURI();	//action 경로 받아옴
		System.out.println("URL : " + URL);
		Controller controller = list.get(URL);	//Map에서 해당 action 경로에 대한 기능객체를 가져옴
		controller.execute(request, response);	//해당기능객체를 실행
	}



}
