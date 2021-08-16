package Ch20;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/BoardPost")
@MultipartConfig
(
		fileSizeThreshold=1024*1024*10,		//10MB
		maxFileSize=1024*1024*50,			//50MB
		maxRequestSize=1024*1024*100		//100MB
)
public class BoardPostServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardMgr bMgr=new BoardMgr();
		Part part=req.getPart("uploadFile");
		bMgr.insertBoard(req,part);
		resp.sendRedirect("/HTMLCSSJSJSP/Ch20JSP/List.jsp");
	}
	
}
