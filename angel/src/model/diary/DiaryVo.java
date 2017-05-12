package model.diary;

import java.io.Serializable;

public class DiaryVo implements Serializable{
	String diaryNum;
	String memberId;
	String diaryDate;
	String diaryContent;
	String diaryWeather;
	String diaryCoupleck;
	String diaryTitle;
	public String getDiaryNum() {
		return diaryNum;
	}
	public void setDiaryNum(String diaryNum) {
		this.diaryNum = diaryNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getDiaryDate() {
		return diaryDate;
	}
	public void setDiaryDate(String diaryDate) {
		this.diaryDate = diaryDate;
	}
	public String getDiaryContent() {
		return diaryContent;
	}
	public void setDiaryContent(String diaryContent) {
		this.diaryContent = diaryContent;
	}
	public String getDiaryWeather() {
		return diaryWeather;
	}
	public void setDiaryWeather(String diaryWeather) {
		this.diaryWeather = diaryWeather;
	}
	public String getDiaryCoupleck() {
		return diaryCoupleck;
	}
	public void setDiaryCoupleck(String diaryCoupleck) {
		this.diaryCoupleck = diaryCoupleck;
	}
	public String getDiaryTitle() {
		return diaryTitle;
	}
	public void setDiaryTitle(String diaryTitle) {
		this.diaryTitle = diaryTitle;
	}
}
