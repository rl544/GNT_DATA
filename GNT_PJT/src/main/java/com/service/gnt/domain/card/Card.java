package com.service.gnt.domain.card;
public class Card {
	
	
	private String cardId; // pk
	private int cvc;
	private String createTime; // date
	private String endTime; // date
	private String bgFront; // 배경색
	private String bgBack;
	private int emoId;
	private int emoInfoTop;
	private int emoInfoLeft;
	private String fontFront; // 글꼴
	private String fontBack;
	private String fontColorFront;
	private String fontColorBack;
	private String cardContent; // 카드 내 사용자 입력 내용
	private String isIssued;
	private String isUniqueColor;
	private String isUniqueFont;
	
	
	public Card() {}
	
	public Card(String cardId, int cvc, String createTime, String endTime, String bgFront, String bgBack, int emoId,
			int emoInfoTop, int emoInfoLeft, String fontFront, String fontBack, String fontColorFront,
			String fontColorBack, String cardContent, String isIssued) {
		super();
		this.cardId = cardId;
		this.cvc = cvc;
		this.createTime = createTime;
		this.endTime = endTime;
		this.bgFront = bgFront;
		this.bgBack = bgBack;
		this.emoId = emoId;
		this.emoInfoTop = emoInfoTop;
		this.emoInfoLeft = emoInfoLeft;
		this.fontFront = fontFront;
		this.fontBack = fontBack;
		this.fontColorFront = fontColorFront;
		this.fontColorBack = fontColorBack;
		this.cardContent = cardContent;
		this.isIssued = isIssued;
	}
	public Card(String cardId, int cvc, String createTime, String endTime, String bgFront, String bgBack, int emoId,
			int emoInfoTop, int emoInfoLeft, String fontFront, String fontBack, String fontColorFront,
			String fontColorBack, String cardContent) {
		super();
		this.cardId = cardId;
		this.cvc = cvc;
		this.createTime = createTime;
		this.endTime = endTime;
		this.bgFront = bgFront;
		this.bgBack = bgBack;
		this.emoId = emoId;
		this.emoInfoTop = emoInfoTop;
		this.emoInfoLeft = emoInfoLeft;
		this.fontFront = fontFront;
		this.fontBack = fontBack;
		this.fontColorFront = fontColorFront;
		this.fontColorBack = fontColorBack;
		this.cardContent = cardContent;
	}
	public Card(String cardId, int cvc, String bgFront, String bgBack, int emoId, int emoInfoTop, int emoInfoLeft,
			String fontFront, String fontBack, String fontColorFront, String fontColorBack, String cardContent) {
		super();
		this.cardId = cardId;
		this.cvc = cvc;
		this.bgFront = bgFront;
		this.bgBack = bgBack;
		this.emoId = emoId;
		this.emoInfoTop = emoInfoTop;
		this.emoInfoLeft = emoInfoLeft;
		this.fontFront = fontFront;
		this.fontBack = fontBack;
		this.fontColorFront = fontColorFront;
		this.fontColorBack = fontColorBack;
		this.cardContent = cardContent;
	}
	public Card(String bgFront, String bgBack, int emoId, int emoInfoTop, int emoInfoLeft, String fontFront,
			String fontBack, String fontColorFront, String fontColorBack, String cardContent) {
		super();
		this.bgFront = bgFront;
		this.bgBack = bgBack;
		this.emoId = emoId;
		this.emoInfoTop = emoInfoTop;
		this.emoInfoLeft = emoInfoLeft;
		this.fontFront = fontFront;
		this.fontBack = fontBack;
		this.fontColorFront = fontColorFront;
		this.fontColorBack = fontColorBack;
		this.cardContent = cardContent;
	}
	public String getCardId() {
		return cardId;
	}
	public void setCardId(String cardId) {
		this.cardId = cardId;
	}
	public int getCvc() {
		return cvc;
	}
	public void setCvc(int cvc) {
		this.cvc = cvc;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getBgFront() {
		return bgFront;
	}
	public void setBgFront(String bgFront) {
		this.bgFront = bgFront;
	}
	public String getBgBack() {
		return bgBack;
	}
	public void setBgBack(String bgBack) {
		this.bgBack = bgBack;
	}
	public int getEmoId() {
		return emoId;
	}
	public void setEmoId(int emoId) {
		this.emoId = emoId;
	}
	public int getEmoInfoTop() {
		return emoInfoTop;
	}
	public void setEmoInfoTop(int emoInfoTop) {
		this.emoInfoTop = emoInfoTop;
	}
	public int getEmoInfoLeft() {
		return emoInfoLeft;
	}
	public void setEmoInfoLeft(int emoInfoLeft) {
		this.emoInfoLeft = emoInfoLeft;
	}
	public String getFontFront() {
		return fontFront;
	}
	public void setFontFront(String fontFront) {
		this.fontFront = fontFront;
	}
	public String getFontBack() {
		return fontBack;
	}
	public void setFontBack(String fontBack) {
		this.fontBack = fontBack;
	}
	public String getFontColorFront() {
		return fontColorFront;
	}
	public void setFontColorFront(String fontColorFront) {
		this.fontColorFront = fontColorFront;
	}
	public String getFontColorBack() {
		return fontColorBack;
	}
	public void setFontColorBack(String fontColorBack) {
		this.fontColorBack = fontColorBack;
	}
	public String getCardContent() {
		return cardContent;
	}
	public void setCardContent(String cardContent) {
		this.cardContent = cardContent;
	}
	public String getIsIssued() {
		return isIssued;
	}
	public void setIsIssued(String isIssued) {
		this.isIssued = isIssued;
	}
	
	public String getIsUniqueColor() {
		return isUniqueColor;
	}

	public void setIsUniqueColor(String isUniqueColor) {
		this.isUniqueColor = isUniqueColor;
	}

	public String getIsUniqueFont() {
		return isUniqueFont;
	}

	public void setIsUniqueFont(String isUniqueFont) {
		this.isUniqueFont = isUniqueFont;
	}

	@Override
	public String toString() {
		return "Card [cardId=" + cardId + ", cvc=" + cvc + ", createTime=" + createTime + ", endTime=" + endTime
				+ ", bgFront=" + bgFront + ", bgBack=" + bgBack + ", emoId=" + emoId + ", emoInfoTop=" + emoInfoTop
				+ ", emoInfoLeft=" + emoInfoLeft + ", fontFront=" + fontFront + ", fontBack=" + fontBack
				+ ", fontColorFront=" + fontColorFront + ", fontColorBack=" + fontColorBack + ", cardContent="
				+ cardContent + ", isIssued=" + isIssued + ", isUniqueColor=" + isUniqueColor + ", isUniqueFont="
				+ isUniqueFont + "]";
	}


}
