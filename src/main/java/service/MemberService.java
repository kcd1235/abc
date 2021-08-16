package service;

import dao.MemberDAO;
import vo.MemberVO;

public class MemberService {
	
	//DB처리 객체 받아옴 
	public MemberDAO dao = MemberDAO.getInstance();
	//싱글톤 패턴 구현
	private static MemberService service = new MemberService();
	private MemberService() {}
	
	public static MemberService getInstance() {
		return service;
	}
	
	public void MemberJoin(MemberVO member) {
		System.out.println("----------------------------------------");
		System.out.println("MemberService의 MemberJoin() 메서드 사용");
		System.out.println("----------------------------------------");
		System.out.println("DAO객체의 MeberJoin(member)매서드로 DB연결 후 회원정보 INSERT 처리");
		dao.MemberJoin(member);
		System.out.println("DAO객체의 MeberJoin(member)매서드로 DB연결 후 회원정보 INSERT 완료");
	}
	public void MemberUpdate(MemberVO member) {
		dao.MemberUpdate(member);
	}
	public MemberVO MemberSearch(String userid) {
		return dao.MemberSearch(userid);
	}
//	public void MemberDelete(String userid) {
//	
//	}
//	public ArrayList<MemberVO> MemberList(MemberVO member) {
//		
//	}

	
	
}
