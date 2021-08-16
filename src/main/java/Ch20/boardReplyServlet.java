package Ch20;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/boardReply")
public class boardReplyServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardMgr bMgr=new BoardMgr();
		BoardBean rebean=new BoardBean();
		
		//답변글에대한 내용을 전달받아 저장(폼으로부터 전달되는 내용 저장)
		rebean.setName(req.getParameter("name"));
		rebean.setSubject(req.getParameter("subject"));
		rebean.setContent(req.getParameter("content"));
		rebean.setRef(Integer.parseInt(req.getParameter("ref")));
		rebean.setPos(Integer.parseInt(req.getParameter("pos")));
		rebean.setDepth(Integer.parseInt(req.getParameter("depth")));
		rebean.setPass(req.getParameter("pass"));
		rebean.setIp(req.getParameter("ip"));
		
		//답변글의 위치값 증가(이미 등록되어진 답변글의 상대위치(pos)를 1씩 증가)
		bMgr.replyUpBoard(rebean.getRef(),rebean.getPos());
		
		//답변글을 등록
		bMgr.replyBoard(rebean);
		
		//현재 보고있는 페이지로 이동
		String nowPage=req.getParameter("nowPage");
		resp.sendRedirect("/HTMLCSSJSJSP/Ch20JSP/List.jsp?nowPage="+nowPage);
	}
	
}
