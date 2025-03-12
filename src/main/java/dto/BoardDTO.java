package dto;

public class BoardDTO {
	private int qnaNum;
	private String qnaId;
	private String qnaName;
	private String qnaTitle;
	private String qnaContent;
	private String qnaRegist_day;
	private int qnaHit;
	private String qnaIp;

	public BoardDTO() {
		super();
	}

	public int getQnaNum() {
		return qnaNum;
	}

	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}

	public String getQnaId() {
		return qnaId;
	}

	public void setQnaId(String qnaId) {
		this.qnaId = qnaId;
	}

	public String getQnaName() {
		return qnaName;
	}

	public void setQnaName(String qnaName) {
		this.qnaName = qnaName;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public String getQnaRegist_day() {
		return qnaRegist_day;
	}

	public void setQnaRegist_day(String qnaRegist_day) {
		this.qnaRegist_day = qnaRegist_day;
	}

	public int getQnaHit() {
		return qnaHit;
	}

	public void setQnaHit(int qnaHit) {
		this.qnaHit = qnaHit;
	}

	public String getQnaIp() {
		return qnaIp;
	}

	public void setQnaIp(String qnaIp) {
		this.qnaIp = qnaIp;
	}

	public void setSubject(String string) {

	}

	public String getSubject() {
		return null;
	}
}