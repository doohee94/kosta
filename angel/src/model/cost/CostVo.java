package model.cost;

import java.io.Serializable;

public class CostVo implements Serializable{
	//member field
	private int costNum;
	private String memberId;
	private String costDate;
	private String costContent;
	private String costCategory;
	private String costMoney;

	//constructor method 
	public CostVo()
	{
		
	}
	public CostVo(int costNum, String memberId, String costDate, String costContent, String costCategory, String costMoney)
	{
		this.costNum 		 = costNum;
		this.memberId		 = memberId;
		this.costDate		 = costDate;
		this.costContent 	 = costContent;
		this.costCategory	 = costCategory;
		this.costMoney	 = costMoney;
	}
	//setter & getter
	public int getCostNum() {
		return costNum;
	}
	public void setCostNum(int costNum) {
		this.costNum = costNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getCostDate() {
		return costDate;
	}
	public void setCostDate(String costDate) {
		this.costDate = costDate;
	}
	public String getCostContent() {
		return costContent;
	}
	public void setCostContent(String costContent) {
		this.costContent = costContent;
	}
	public String getCostCategory() {
		return costCategory;
	}
	public void setCostCategory(String costCategory) {
		this.costCategory = costCategory;
	}
	public String getCostMoney() {
		return costMoney;
	}
	public void setCostMoney(String costMoney) {
		this.costMoney = costMoney;
	}
	
}
