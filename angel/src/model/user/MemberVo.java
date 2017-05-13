package model.user;

import java.io.Serializable;

public class MemberVo implements Serializable{

	String memberId;
	String memberPw;
	String memberName;
	String memberGender;
	String memberTel;
	String memberBirth;
	String memberCouple;
	
	
	public MemberVo() {}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}



	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberGender() {
		return memberGender;
	}

	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}

	public String getMemberTel() {
		return memberTel;
	}

	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}

	public String getMemberBirth() {
		return memberBirth;
	}

	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}

	public String getMemberCouple() {
		return memberCouple;
	}

	public void setMemberCouple(String memberCouple) {
		this.memberCouple = memberCouple;
	}
	
	
	
	

}
