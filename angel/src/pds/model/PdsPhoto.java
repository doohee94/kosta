package pds.model;

/**
 * DAO 클래스에서 pds_item 테이블의 데이터를 주고 받을 때 사용할 클래스
 *
 */
public class PdsPhoto {

	private int photo_num;
	private String member_id;
	private String photo_name;
	private String photo_path;
	private long photo_size;
	private String photo_title;
	private String photo_content;
	private String photo_coupleck;
	
	
	public int getPhoto_num() {
		return photo_num;
	}
	public void setPhoto_num(int photo_num) {
		this.photo_num = photo_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getPhoto_name() {
		return photo_name;
	}
	public void setPhoto_name(String photo_name) {
		this.photo_name = photo_name;
	}
	public String getPhoto_path() {
		return photo_path;
	}
	public void setPhoto_path(String photo_path) {
		this.photo_path = photo_path;
	}
	public long getPhoto_size() {
		return photo_size;
	}
	public void setPhoto_size(long photo_size) {
		this.photo_size = photo_size;
	}
	public String getPhoto_title() {
		return photo_title;
	}
	public void setPhoto_title(String photo_title) {
		this.photo_title = photo_title;
	}
	public String getPhoto_content() {
		return photo_content;
	}
	public void setPhoto_content(String photo_content) {
		this.photo_content = photo_content;
	}
	public String getPhoto_coupleck() {
		return photo_coupleck;
	}
	public void setPhoto_coupleck(String photo_coupleck) {
		this.photo_coupleck = photo_coupleck;
	}
	
	
}
