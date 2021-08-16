package Ch13;

import java.util.*;

public class ProdRepository {

	public static ArrayList<Product> list = new ArrayList();	//Product를 저장하기 위함
	public static Map<String,ArrayList<Product>> map = new HashMap();
	
	public ProdRepository() {}
	
	public void addProduct(String userid , Product prod)
	{
		list.add(prod);	//책정보(책이름/출판사/가격)을 list에 추가
						//추가해야될 코드
						//만약 기존  userid가 있다면 list를 추출하여 add를 한다
						//만약 기존  userid가 없다면 바로 list.add() 한다
		
		map.put(userid, list);
		System.out.println("계정명 : " + userid +",추가한 책 개수 : " + list.size());
		System.out.println("MAP에 추가된 계정 : " + map.size());
	}
	
	public Map<String,ArrayList<Product>> getMap()
	{
		return map;
	}
	
	
	
}
