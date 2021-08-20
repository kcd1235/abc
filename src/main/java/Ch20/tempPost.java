package Ch20;

import java.sql.*;
public class tempPost {
	
	
	public static void main(String[] args) {
		DBConnectionMgr pool=DBConnectionMgr.getInstance();
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql=null;
		try {
			conn=pool.getConnection();
			for(int i=1;i<=1000;i++)
			{
			sql="insert into boardtbl(theatername,divi,subject,content,regdate,ip)";
			sql+=" values('aaa"+i+"','bbb"+i+"','ccc"+i+"',"+i+",0,now(),'127.0.0.1');";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
