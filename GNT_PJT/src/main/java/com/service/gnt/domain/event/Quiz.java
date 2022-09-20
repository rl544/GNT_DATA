package com.service.gnt.domain.event;
public class Quiz {
	private int quizId;
	private String quizContent;
	private int answer;
	private String select1;
	private String select2;
	private String select3;
	private String select4;
	public Quiz() {}
	public Quiz(int quizId, String quizContent, int answer, String select1, String select2, String select3,
			String select4) {
		super();
		this.quizId = quizId;
		this.quizContent = quizContent;
		this.answer = answer;
		this.select1 = select1;
		this.select2 = select2;
		this.select3 = select3;
		this.select4 = select4;
	}
	public int getQuizId() {
		return quizId;
	}
	public void setQuizId(int quizId) {
		this.quizId = quizId;
	}
	public String getQuizContent() {
		return quizContent;
	}
	public void setQuizContent(String quizContent) {
		this.quizContent = quizContent;
	}
	public int getAnswer() {
		return answer;
	}
	public void setAnswer(int answer) {
		this.answer = answer;
	}
	public String getSelect1() {
		return select1;
	}
	public void setSelect1(String select1) {
		this.select1 = select1;
	}
	public String getSelect2() {
		return select2;
	}
	public void setSelect2(String select2) {
		this.select2 = select2;
	}
	public String getSelect3() {
		return select3;
	}
	public void setSelect3(String select3) {
		this.select3 = select3;
	}
	public String getSelect4() {
		return select4;
	}
	public void setSelect4(String select4) {
		this.select4 = select4;
	}
	public String toString() {
		return "Quiz [quizId=" + quizId + ", quizContent=" + quizContent + ", answer=" + answer + ", select1=" + select1
				+ ", select2=" + select2 + ", select3=" + select3 + ", select4=" + select4 + "]";
	}
	
}
