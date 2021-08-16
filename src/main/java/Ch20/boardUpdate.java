package Ch20;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/boardUpdate")
public class boardUpdate extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int nowPage=Integer.parseInt(req.getParameter("nowPage"));
		int num=Integer.parseInt(req.getParameter("num"));
		HttpSession session=req.getSession();
		BoardBean bean=(BoardBean)session.getAttribute("bean");		//read하고있는 게시물정보
		
		BoardMgr bMgr=new BoardMgr();
		//업데이트 예정 bean
		BoardBean upbean=new BoardBean();
		upbean.setNum(Integer.parseInt(req.getParameter("num")));
		upbean.setName(req.getParameter("name"));
		upbean.setSubject(req.getParameter("subject"));
		upbean.setContent(req.getParameter("content"));
		upbean.setPass(req.getParameter("pass"));
		upbean.setIp(req.getParameter("ip"));
		
		String uppwd=upbean.getPass();	//업데이트 예정인 게시물의 패스워드
		String inpwd=bean.getPass();	//기존에 저장된 패스워드
		
		if(uppwd.equals(inpwd)) {
			bMgr.updateBoard(upbean);	//DB수정처리
			resp.sendRedirect("/HTMLCSSJSJSP/Ch20JSP/Read.jsp?nowPage="+nowPage+"&num="+num);
		}
		else {
			//패스워드 불일치
			PrintWriter out=resp.getWriter();
			out.println("<script charset='utf-8'>");
			out.println("alert('비밀번호가 일치하지 않습니다')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
}
