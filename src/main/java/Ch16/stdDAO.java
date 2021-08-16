package Ch16;

import java.sql.*;
import java.util.ArrayList;

public class stdDAO {

	private DBConnectionMgr pool = null;
	
	public stdDAO()
	{
		pool=DBConnectionMgr.getInstance();
	}
	
	public ArrayList<stdDTO> select()
	{
		Connection conn=null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		stdDTO bean=null;
		ArrayList<stdDTO> stdlist = new ArrayList();
		try {
			conn=pool.getConnection();
			stmt=conn.prepareStatement("select * from stdtbl");
			rs = stmt.executeQuery();
			while(rs.next())
			{
				bean= new stdDTO();
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
				bean.setAddr(rs.getString("addr"));
				stdlist.add(bean);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally
		{
			pool.freeConnection(conn, stmt, rs);
		}
		return stdlist;
	
	}
	
	public int insert(int id,String name , String addr)
	{
		Connection conn=null;
		PreparedStatement pstmt = null;
		int result=0;
		try
		{
			conn = pool.getConnection();//연결객체 Pool통해 가져오기
			//연결객체로 쿼리객체 만들고 insert SQL 등록
			pstmt = conn.prepareStatement("insert into stdtbl values(?,?,?)");
			pstmt.setInt(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, addr);
			//연결객체로 쿼리실행 후 결과값 받아오기
			result=pstmt.executeUpdate();	
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			pool.freeConnection(conn, pstmt);
		}
		return  result;//결과값 호출했던 위치로 리턴
	}	
	
	public int update(int id,String name, String addr) {
	
		Connection conn=null;
		PreparedStatement pstmt = null;
		int result=0;
		try
		{
			conn=pool.getConnection();
			pstmt = conn.prepareStatement("update stdtbl set name=?,addr=? where id=?");
			pstmt.setString(1, name);
			pstmt.setString(2, addr);
			pstmt.setInt(3, id);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(conn, pstmt);
		}
		return result;
		//Pool안에서 DB연결객체 가져옴
		//연결객체를 통해 쿼리객체생성
		//SQL등록 후 실행
		//결과값(정수값)을 리턴
		
	}
	
	public int delete(int id) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		int result=0;
		try
		{
			conn=pool.getConnection();
			pstmt = conn.prepareStatement("delete from stdtbl where id=?");
			pstmt.setInt(1, id);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(conn, pstmt);
		}
		return result;
		//Pool안에서 DB연결객체 가져옴
		//연결객체를 통해 쿼리객체생성
		//SQL등록 후 실행
		//결과값(정수값)을 리턴
		
	}
	
}
