package controller;

import service.MemberService;
import vo.MemberVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MemberInsertController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		/*
		 * String userid = request.getParameter("userid"); String pwd =
		 * request.getParameter("pwd"); String name = request.getParameter("name");
		 * String ph1=request.getParameter("ph1"); String
		 * ph2=request.getParameter("ph2"); String ph3=request.getParameter("ph3");
		 * String email = request.getParameter("email"); int
		 * zipcode=Integer.parseInt(request.getParameter("zipcode")); String
		 * addr1=request.getParameter("addr1"); String
		 * addr2=request.getParameter("addr2");
		 * 
		 * //입력값검증 System.out.println("2)입력값 검증 -> 잘못된 값 전달시 HttpUtil.forward() 사용");
		 * if(userid.isEmpty() || pwd.isEmpty()||name.isEmpty()||email.isEmpty()) { //다시
		 * memberinsert로 이동(HttpUtil.java에서 처리)
		 * request.setAttribute("error","올바른 값이 입력되지 않았습니다");
		 * HttpUtil.forward(request,response,"/Ch18JSP/VIEW/memberInsert.jsp"); }
		 * 
		 * //MemberVO에 값 설정 MemberVO member = new MemberVO();
		 * 
		 * //Service 실행
		 * System.out.println("4)Service 실행 -> MemberService의 MemberJoin()함수 실행");
		 * MemberService service = MemberService.getInstance();
		 * //service.memberJoin(member);
		 * 
		 * //결과를 화면으로 구현 request.setAttribute("userid", userid);
		 * HttpUtil.forward(request, response, "/Result/MemberInsertOutput.jsp");
		 */
	}

}
