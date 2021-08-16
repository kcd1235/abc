package controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MemberDeleteController implements Controller{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("삭제처리");
	}	

}
