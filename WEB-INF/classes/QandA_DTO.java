package dto;

public class QandA_DTO {
	String qanda_no,
	title,
	question,
	answer,
	user_id,
	reg_date_q,
	reg_date_a,
	status,
	secret,
	name;
	int  hit;
	
	public QandA_DTO(String qanda_no, String title, String question, String reg_date_q) {
		super();
		this.qanda_no = qanda_no;
		this.title = title;
		this.question = question;
		this.reg_date_q = reg_date_q;
	}
	
	public QandA_DTO(String qanda_no, String title, String question, String user_id, String reg_date_q,
			String secret) {
		super();
		this.qanda_no = qanda_no;
		this.title = title;
		this.question = question;
		this.user_id = user_id;
		this.reg_date_q = reg_date_q;
		this.secret = secret;
	}
	
	public QandA_DTO(String qanda_no, String title, String question, String answer, String user_id, String reg_date_q,
			String reg_date_a, String status, String secret, String name, int hit) {
		super();
		this.qanda_no = qanda_no;
		this.title = title;
		this.question = question;
		this.answer = answer;
		this.user_id = user_id;
		this.reg_date_q = reg_date_q;
		this.reg_date_a = reg_date_a;
		this.status = status;
		this.secret = secret;
		this.name = name;
		this.hit = hit;
	}

	public String getQanda_no() {
		return qanda_no;
	}

	public void setQanda_no(String qanda_no) {
		this.qanda_no = qanda_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getReg_date_q() {
		return reg_date_q;
	}

	public void setReg_date_q(String reg_date_q) {
		this.reg_date_q = reg_date_q;
	}

	public String getReg_date_a() {
		return reg_date_a;
	}

	public void setReg_date_a(String reg_date_a) {
		this.reg_date_a = reg_date_a;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}			
}
