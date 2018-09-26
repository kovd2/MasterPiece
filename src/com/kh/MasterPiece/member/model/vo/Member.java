package com.kh.MasterPiece.member.model.vo;

public class Member implements java.io.Serializable {
		
	private int userNo;			//회원번호(시퀀스)
	private String userType; 		//회원유형 
	private String userName; 		//이름
	private String userId;	 		//아이디
	private String userPwd;  		//비밀번호
	private String phone;	 		//연락처
	private String address;			//주소	
	private String email;	 		//이메일
	private String status;			//회원상태(가입Y,탈퇴N)
	private String orderCheck;
	
	public Member(){}

	public Member(int userNo, String userType, String userName, String userId, String userPwd, String phone,
			String address, String email, String status, String orderCheck) {
		super();
		this.userNo = userNo;
		this.userType = userType;
		this.userName = userName;
		this.userId = userId;
		this.userPwd = userPwd;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.status = status;
		this.orderCheck = orderCheck;
	}
	
	
	public String getOrderCheck() {
		return orderCheck;
	}

	public void setOrderCheck(String orderCheck) {
		this.orderCheck = orderCheck;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userType=" + userType + ", userName=" + userName + ", userId=" + userId
				+ ", userPwd=" + userPwd + ", phone=" + phone + ", address=" + address + ", email=" + email
				+ ", status=" + status + "]";
	}
	
}
