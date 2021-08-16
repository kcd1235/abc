package Ch13;

import java.util.*;

public class C01SetMain {
	public static void main(String[] args) {
		Set<String> set = new HashSet();
		
		set.add("JAVA");
		set.add("JDBC");
		set.add("Servlet/JSP");
		set.add("ABCD");
		set.add("JAVA");
		
		System.out.println("저장된 데이터 개수 : " + set.size());
		
		Iterator<String> iter = set.iterator();
		while(iter.hasNext())
		{
			String str = iter.next();
			System.out.println(str);
		}
		
		set.remove("ABCD");
		
		System.out.println("-----------------------");
		Iterator<String> iter2 = set.iterator();
		while(iter2.hasNext())
		{
			String str = iter2.next();
			System.out.println(str);
		}
		set.clear();//전체 제거
	}

}
