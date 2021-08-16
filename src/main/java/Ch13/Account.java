package Ch13;

public class Account {
	private String id;
	private String pwd;
	private String SID;
	public Account(String id , String pwd , String SID)
	{
		this.id = id;
		this.pwd = pwd;
		this.SID = SID;
	}
	public String getId() {
		return id;
	}
	public String getPwd() {
		return pwd;
	}
	public String getSID() {
		return SID;
	}
	
}
