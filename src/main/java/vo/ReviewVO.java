package vo;

public class ReviewVO {
	private String name;
	private String r_book;
	private String r_content;
	private int star;
	private String regdate;//작성일
	
	/*
	 * float sta;
	 * 
	 * public void setSta(float sta) { this.sta = sta; }
	 * 
	 * public float getSta() { return sta; }
	 */
	
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	public String getRegdate() {
		return regdate;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getR_book() {
		return r_book;
	}
	public void setR_book(String r_book) {
		this.r_book = r_book;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	
	
}
