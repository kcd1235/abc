package dao;

import vo.MemberVO;
import java.sql.*;

public class MemberDAO {

	DBConnectionMgr pool = DBConnectionMgr.getInstance();
	private static MemberDAO instance = new MemberDAO();
	private MemberDAO() {}
	public static MemberDAO getInstance()
	{
		return instance;
	}
	
	public void MemberJoin(MemberVO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement("insert into membertbl values(?,?,?,?,?,?,?,?)");
			pstmt.setString(1, member.getUserid());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getPh1()+member.getPh2()+member.getPh3());
			pstmt.setString(5, member.getEmail());
			pstmt.setInt(6, member.getZipcode());
			pstmt.setString(7, member.getAddr1());
			pstmt.setString(8, member.getAddr2());
			pstmt.executeUpdate();	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(conn,pstmt);
		}
	}
	
	public MemberVO MemberSearch(String userid)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberVO vo=null;
		try {
			conn=pool.getConnection();
			pstmt=conn.prepareStatement("select * from membertbl where userid='"+userid+"'");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				vo=new MemberVO();
				vo.setUserid(rs.getString("userid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				String ph = rs.getString("phone");
				String tmp[] = ph.split("-");
				vo.setPh1(tmp[0]);
				vo.setPh2(tmp[1]);
				vo.setPh3(tmp[2]);
				vo.setEmail(rs.getString("email"));
				vo.setZipcode(rs.getInt("zipcode"));
				vo.setAddr1(rs.getString("addr1"));
				vo.setAddr2(rs.getString("addr2"));
			}
		}catch(Exception e) {
			
		}finally {
			pool.freeConnection(conn, pstmt, rs);
		}
		return vo;
	}
	
	public void MemberUpdate(MemberVO member) 
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql=null;
		try {
			conn=pool.getConnection();
			sql="update membertbl set"
					+ "userid=?,pwd=?,name=?,phone=?"
					+ "email=?,zipcode=?,addr1=?,addr2";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, member.getUserid());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getPh1()+member.getPh2()+member.getPh3());
			pstmt.setString(5, member.getEmail());
			pstmt.setInt(6, member.getZipcode());
			pstmt.setString(7, member.getAddr1());
			pstmt.setString(8, member.getAddr2());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(conn, pstmt);
		}
	}
	public void MemberDelete() {}
	public void MemberList() {}
	
	
	
	
	
	
	
	
}
