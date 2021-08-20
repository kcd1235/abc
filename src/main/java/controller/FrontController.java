package controller;

import java.io.IOException;
import java.util.HashMap;

import controller.Controller;
import controller.MemberJoinController;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet{
	String charset = "UTF-8";
	HashMap<String, Controller> list = null;

	@Override
	public void init(ServletConfig sc) throws ServletException 	 
	{
		charset = sc.getInitParameter("charset");
		//URL 기능객체 추가
		list = new HashMap();
		list.put("/KimChangDong/View/MemberJoin.do",new MemberJoinController());
	}

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(charset);
		// 사용자 요청별로 기능객체를 반환
		// 해당 기능 실행 
		String URL=request.getRequestURI();
		Controller controll=list.get(URL);
		controll.execute(request, response);
	}
}
