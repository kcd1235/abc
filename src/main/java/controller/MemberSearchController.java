package controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MemberSearchController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("조회처리");
		
	}

}
