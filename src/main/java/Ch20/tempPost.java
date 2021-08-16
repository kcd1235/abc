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
			sql="insert into tblBoard(name,subject,content,ref,pos,depth,regdate,pass,count,ip,filename,filesize)";
			sql+=" values('aaa"+i+"','bbb"+i+"','ccc"+i+"',"+i+",0,0,now(),'1111',0,'127.0.0.1','파일없음',0);";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
