package Ch13;

import java.util.*;

public class SessionSave {
	public Map<String,Account> map = new HashMap();
	
	public void addSession(String id,String pwd , String SID)
	{
			Account tmp = new Account(id,pwd,SID);
			map.put(id, tmp);
			System.out.println("MAP에 세션추가됨!");
	}
	public Map<String,Account> getSession(){
		return map;
	}
	
}
