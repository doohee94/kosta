package model.user;

import java.io.Serializable;

public class MemberVo implements Serializable{

	String memberId;
	String memberPw;
	String memberName;
	String memberGender;
	String memberTel;
	String memberBirth;
	String coupleID;
	String photoName;		// 고객 사진의 파일명
	String photoRealpath;	// 고객 사진의 실제주소
	
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



	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public String getPhotoRealpath() {
		return photoRealpath;
	}

	public void setPhotoRealpath(String photoRealpath) {
		this.photoRealpath = photoRealpath;
	}

	public String getCoupleID() {
		return coupleID;
	}

	public void setCoupleID(String coupleID) {
		this.coupleID = coupleID;
	}
	
	
	
	
	
	

}
