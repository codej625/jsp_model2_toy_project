package dao;

public class Post {
	private int board_num;		// 게시판 번호
	private int post_num;		// 게시글 번호
	private String user_id;		// 사용자명
	private String post_date;	// 작성일
	private String post_name;	// 제목
	private String post_cont;	// 내용
	private int post_view;		// 조회수
	private int post_re;
	private int post_restep;
	private int post_lv;
	private int post_chq;		// 문의게시판 답변유무

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public int getPost_num() {
		return post_num;
	}

	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPost_date() {
		return post_date;
	}

	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}

	public String getPost_name() {
		return post_name;
	}

	public void setPost_name(String post_name) {
		this.post_name = post_name;
	}

	public String getPost_cont() {
		return post_cont;
	}

	public void setPost_cont(String post_cont) {
		this.post_cont = post_cont;
	}

	public int getPost_view() {
		return post_view;
	}

	public void setPost_view(int post_view) {
		this.post_view = post_view;
	}

	public int getPost_re() {
		return post_re;
	}

	public void setPost_re(int post_re) {
		this.post_re = post_re;
	}

	public int getPost_restep() {
		return post_restep;
	}

	public void setPost_restep(int post_restep) {
		this.post_restep = post_restep;
	}

	public int getPost_lv() {
		return post_lv;
	}

	public void setPost_lv(int post_lv) {
		this.post_lv = post_lv;
	}

	public int getPost_chq() {
		return post_chq;
	}

	public void setPost_chq(int post_chq) {
		this.post_chq = post_chq;
	}

}