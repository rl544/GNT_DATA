package com.service.gnt.domain.event;
public class Game {
	
	private int gameId;
	private int userId;
	private int gameLocation;
	private int roundTrip;
	private char isToday;
	private char isTomorrow;
	private int top;
	private int left;
	public Game() {
		super();
	}
	
	public Game(int gameId, int userId, int gameLocation, int roundTrip, char isToday, char isTomorrow, int top,
			int left) {
		super();
		this.gameId = gameId;
		this.userId = userId;
		this.gameLocation = gameLocation;
		this.roundTrip = roundTrip;
		this.isToday = isToday;
		this.isTomorrow = isTomorrow;
		this.top = top;
		this.left = left;
	}
	

	public Game(int gameId, int userId, int gameLocation, int roundTrip, char isToday, char isTomorrow) {
		super();
		this.gameId = gameId;
		this.userId = userId;
		this.gameLocation = gameLocation;
		this.roundTrip = roundTrip;
		this.isToday = isToday;
		this.isTomorrow = isTomorrow;
	}
	public Game(int userId, int gameLocation, int roundTrip, char isToday, char isTomorrow) {
		super();
		this.userId = userId;
		this.gameLocation = gameLocation;
		this.roundTrip = roundTrip;
		this.isToday = isToday;
		this.isTomorrow = isTomorrow;
	}
	public int getGameId() {
		return gameId;
	}
	public void setGameId(int gameId) {
		this.gameId = gameId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getGameLocation() {
		return gameLocation;
	}
	public void setGameLocation(int gameLocation) {
		this.gameLocation = gameLocation;
	}
	public int getRoundTrip() {
		return roundTrip;
	}
	public void setRoundTrip(int roundTrip) {
		this.roundTrip = roundTrip;
	}
	public char getIsToday() {
		return isToday;
	}
	public void setIsToday(char isToday) {
		this.isToday = isToday;
	}
	public char getIsTomorrow() {
		return isTomorrow;
	}
	public void setIsTomorrow(char isTomorrow) {
		this.isTomorrow = isTomorrow;
	}
	
	public int getTop() {
		return top;
	}

	public void setTop(int top) {
		this.top = top;
	}

	public int getLeft() {
		return left;
	}

	public void setLeft(int left) {
		this.left = left;
	}

	@Override
	public String toString() {
		return "Game [gameId=" + gameId + ", userId=" + userId + ", gameLocation=" + gameLocation + ", roundTrip="
				+ roundTrip + ", isToday=" + isToday + ", isTomorrow=" + isTomorrow + ", top=" + top + ", left=" + left
				+ "]";
	}


	
	
	
}
