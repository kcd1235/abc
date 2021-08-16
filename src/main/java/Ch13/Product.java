package Ch13;

public class Product {
	private String userid;
	private String title;
	private String publisher;
	private String price;
	
	public Product(){}
	public Product(String u, String t , String p1 ,String p2)//유저ID,책제목,출판사,가격 순으로
	{
		userid=u;title=t;publisher=p1;price=p2;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	
	
}
