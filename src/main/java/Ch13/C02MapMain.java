package Ch13;

import java.util.*;

public class C02MapMain {

	public static void main(String[] args) {
		//MAP자료구조객체 생성
		Map<String,Integer> map = new HashMap();
		
		//자료 저장
		map.put("홍길동", 40);
		map.put("서길동", 30);
		map.put("남길동", 20);
		map.put("동길동", 10);
		map.put("홍길동", 15);
		
		//총 저장 자료 확인
		System.out.println("저장된 자료 수 : " + map.size());
		//저장 내용 출력해보기
		Set<String> set = map.keySet();
		Iterator<String> iter = set.iterator();
		while(iter.hasNext())
		{
			String key = iter.next();
			Integer value = map.get(key);
			System.out.println(key + ","+value);
		}
		map.remove("서길동");
		System.out.println("---------------");
		Iterator<String> iter2 = set.iterator();
		while(iter2.hasNext())
		{
			String key = iter2.next();
			Integer value = map.get(key);
			System.out.println(key + ","+value);
		}
		map.clear();
		
		
		
		

	}

}
