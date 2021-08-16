package Ch20;

import java.io.File;
import java.sql.*;
import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class BoardMgr {
	DBConnectionMgr pool=null;
	
	public BoardMgr() {
		try {
		pool=DBConnectionMgr.getInstance();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getTotalCount(String keyField,String keyWord) {
		int total=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=pool.getConnection();
			if(keyWord.equals("null")||keyWord.equals("")) {
				//전체 게시물 개수를 select
				pstmt=conn.prepareStatement("select count(*) from tblboard");
			}else {
				//전달받은 검색 정보를 만족하는 게시물개수를 select
				pstmt=conn.prepareStatement("select count(*) from tblboard where "+keyField+" like ?");
				pstmt.setString(1, "%"+keyWord+"%");
			}
			rs=pstmt.executeQuery();
			if(rs.next()) {
				total=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(conn, pstmt);
		}
		
		return total;
		
	}
	
	public ArrayList<BoardBean> getBoardList(String keyField,String keyWord,int start, int end){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		ArrayList<BoardBean> blist=new ArrayList();
		
		try {
			conn=pool.getConnection();
			if(keyWord.equals("null")||keyWord.equals("")) {
				sql="select * from tblboard order by ref desc,pos limit ?,?";	//답글고려X-reply 페이지 구성시 수정
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			}
			else {
				//키워드 고려 검색
				sql="select * from tbloard where "+keyField +" like ? ";
				sql+= "order by ref desc,pos desc limit ?,?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,"%"+keyWord+"%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BoardBean bean=new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setCount(rs.getInt("count"));
				blist.add(bean);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(conn, pstmt, rs);
		}
		return blist;
		
	}

	public void insertBoard(HttpServletRequest req, Part part) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		String filename=null;
		int filesize=0;
		
		try {
			conn=pool.getConnection();
			//1.ref 값 구하기(처음 게시되는 글을 num==ref)
			sql="select max(num) from tblboard";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			int ref=1;
			
			if(rs.next())
				ref=rs.getInt(1)+1;
			
			//2.업로드 디렉토리 생성
			File file=new File("c:\\UPLOAD");
			if(!file.exists()) {
				file.mkdirs();
			}
			
			//3.파일 이름 추출
			filename=getFileName(part);
			
			//4 업로드
			if(!filename.equals("")) {
				part.write("c:\\UPLOAD"+File.separator+filename);
				filesize=(int)part.getSize();
			}
			else {
				filename="파일없음";
			}
			
			//5. DB 내용 Insert
			sql="insert into tblboard(name,content,subject,ref,pos,depth,regdate,pass,count,ip,filename,filesize)";
			sql+=" values(?,?,?,?,0,0,now(),?,0,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, req.getParameter("name"));
			pstmt.setString(2, req.getParameter("content"));
			pstmt.setString(3, req.getParameter("subject"));
			pstmt.setInt(4, ref);
			pstmt.setString(5, req.getParameter("pass"));
			pstmt.setString(6, req.getParameter("ip"));
			pstmt.setString(7, filename);
			pstmt.setInt(8, filesize);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(conn, pstmt, rs);
		}
		//업로드
		//DB저장
		
	}
	
	private String getFileName(Part part) {
			String contentDisp=part.getHeader("content-disposition");
			String [] tokens=contentDisp.split(";");
			return tokens[2].substring(11,tokens[2].length()-1);
	}
	
	public void upCount(int num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql=null;
		try {
			conn=pool.getConnection();
			sql="update tblBoard set count=count+1 where num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(conn, pstmt);
		}
	}
	
	public BoardBean getBoard(int num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		BoardBean bean=new BoardBean();
		try {
			conn=pool.getConnection();
			sql="select * from tblBoard where num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setContent(rs.getString("content"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setPass(rs.getString("pass"));
				bean.setCount(rs.getInt("count"));
				bean.setFilename(rs.getString("filename"));
				bean.setFilesize(rs.getInt("filesize"));
				bean.setIp(rs.getString("ip"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(conn, pstmt, rs);
		}
		return bean;
	}
	
	public void updateBoard(BoardBean bean) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql=null;
		try {
			conn=pool.getConnection();
			sql="update tblBoard set name=?,subject=?,content=? where num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getSubject());
			pstmt.setString(3, bean.getContent());
			pstmt.setInt(4, bean.getNum());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(conn, pstmt);
		}
	}

	//답변글들 pos 값 1씩 증가
	public void replyUpBoard(int ref, int pos) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql=null;
		
		try {
			conn=pool.getConnection();
			sql="update tblboard set pos=pos+1 where ref=? and pos>?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, pos);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(conn, pstmt);
		}
		
	}

	public void replyBoard(BoardBean rebean) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql=null;
		
		try {
			conn=pool.getConnection();
			sql="insert into tblboard(name,content,subject,ref,pos,depth,regdate,pass,count,ip)";
			sql+=" values(?,?,?,?,?,?,now(),?,0,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, rebean.getName());
			pstmt.setString(2, rebean.getContent());
			pstmt.setString(3, rebean.getSubject());
			pstmt.setInt(4, rebean.getRef());
			pstmt.setInt(5, rebean.getPos()+1);		//pos 값 1증가
			pstmt.setInt(6, rebean.getDepth()+1);	//depth 값 1증가		
			pstmt.setString(7, rebean.getPass());
			pstmt.setString(8, rebean.getIp());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(conn, pstmt);
		}
		
	}
	
	public void deleteBoard(int num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		
		try {
			conn=pool.getConnection();
			
			//첨부파일 삭제
			sql="select filename from tblboard where num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()&&!rs.getString(1).equals("파일없음"))
			{
				File file=new File("c:\\UPLOAD"+File.separator+rs.getString(1));
				if(file.exists())	//파일이 존재한다면 
				{
					if(file.isFile()) {		//파일이 일반파일이라면(디렉토리X)
						file.delete();		//파일 삭제
					}
				}
			}
			
			//게시글 삭제
			sql="delete from tblboard where num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(conn, pstmt,rs);
		}
	}
}
