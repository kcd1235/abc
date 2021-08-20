package controller;

import controller.Controller;
import controller.HttpUtil;
import service.MemberService;
//import VO.MemberVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MemberJoinController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		// Parameter 가져오기
		/*String userid=request.getParameter("userid");
		String pwd=request.getParameter("pwd");
		String name=request.getParameter("name");
		String ph1=request.getParameter("ph1");
		String ph2=request.getParameter("ph2");
		String ph3=request.getParameter("ph3");
		String email=request.getParameter("email");
		int zipcode=Integer.parseInt(request.getParameter("zipcode"));
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		
		if(userid.isEmpty()||pwd.isEmpty()||name.isEmpty()||ph1.isEmpty()||ph2.isEmpty()||ph3.isEmpty()||email.isEmpty()
				||addr1.isEmpty()||addr2.isEmpty()) {
			request.setAttribute("error", "올바른 값이 저장되지 않았습니다");
			try {
				HttpUtil.forward(request, response, "/Result/MemberJoin.jsp");
			} catch (ServletException e) {
				e.printStackTrace();
			}		
		}
		// VO 설정
		//MemberVO vo=new MemberVO(userid,pwd,name,ph1,ph2,ph3,email);
		
		// Service 사용
		MemberService service=MemberService.getInstance();
		service.memberJoin(vo);
		// Output View
		request.setAttribute("userid", userid);
		try {
			HttpUtil.forward(request, response, "/Result/MemberInsertOutput.jsp");
		} catch (ServletException e) {
			e.printStackTrace();
		}*/
	}	
}
