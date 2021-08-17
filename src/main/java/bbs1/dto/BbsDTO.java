package bbs1.dto;

public class BbsDTO {
	
	private int num;
	private String title;
	private String contents;
	private String day;
	private int fav;
	private String user_id;
	private int like;
	private String lists;
	private int onoff;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getFav() {
		return fav;
	}
	public void setFav(int fav) {
		this.fav = fav;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public String getLists() {
		return lists;
	}
	public void setLists(String lists) {
		this.lists = lists;
	}
	public int getOnoff() {
		return onoff;
	}
	public void setOnoff(int onoff) {
		this.onoff = onoff;
	}
	@Override
	public String toString() {
		return "BbsDTO [num=" + num + ", title=" + title + ", contents=" + contents + ", day=" + day + ", fav=" + fav
				+ ", user_id=" + user_id + ", like=" + like + ", lists=" + lists + ", onoff=" + onoff + "]";
	}
	 
	
	
	
	
	
}
