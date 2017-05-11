package model.plan;

import java.io.Serializable;

public class PlanVo  implements Serializable {
	
	int planNum;
	String memberId;
	String planSdate;
	String planEdate;
	String planContent;
	String planCoupleck;
	
	public PlanVo() {}

	public int getPlanNum() {
		return planNum;
	}

	public void setPlanNum(int planNum) {
		this.planNum = planNum;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPlanSdate() {
		return planSdate;
	}

	public void setPlanSdate(String planSdate) {
		this.planSdate = planSdate;
	}

	public String getPlanEdate() {
		return planEdate;
	}

	public void setPlanEdate(String planEdate) {
		this.planEdate = planEdate;
	}

	public String getPlanContent() {
		return planContent;
	}

	public void setPlanContent(String planContent) {
		this.planContent = planContent;
	}

	public String getPlanCoupleck() {
		return planCoupleck;
	}

	public void setPlanCoupleck(String planCoupleck) {
		this.planCoupleck = planCoupleck;
	}
	
	

	
	

}
