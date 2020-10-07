package dto;

public class Freeboard_DTO {
	String freeboard_no,
	pw,
	title,
	content,
	reg_id,
	reg_date,
	name;
	int hit;
	
	public Freeboard_DTO() {
		super();
	}
	public Freeboard_DTO(String freeboard_no, String title, String content, String reg_date) {
		super();
		this.freeboard_no 	= freeboard_no;
		this.title 			= title;
		this.content 		= content;
		this.reg_date 		= reg_date;
	}
	
	public Freeboard_DTO(String freeboard_no, String title, String reg_id, String reg_date, int hit) {
		super();
		this.freeboard_no = freeboard_no;
		this.title = title;
		this.reg_id = reg_id;
		this.reg_date = reg_date;
		this.hit = hit;
	}
	
	public Freeboard_DTO(String freeboard_no, String pw, String title, String content, String reg_id, String reg_date, int hit) {
		super();
		this.freeboard_no = freeboard_no;
		this.pw = pw;
		this.title = title;
		this.content = content;
		this.reg_id = reg_id;
		this.reg_date = reg_date;
		this.hit = hit;
	}
	


	public String getFreeboard_no() {
		return freeboard_no;
	}

	public void setFreeboard_no(String freeboard_no) {
		this.freeboard_no = freeboard_no;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
	public int getName() {
		return hit;
	}

	public void setName(int hit) {
		this.hit = hit;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}
	
	

	
}
