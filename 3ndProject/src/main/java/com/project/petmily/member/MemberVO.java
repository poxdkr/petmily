package com.project.petmily.member;

public class MemberVO {

	private int midx;
	private String mid;
	private String pwd;
	private String mname;
	private String mphone;
	private String memail;
	private String mnickname;
	private String mphoto;
	private int mlevel;
	
	// 탈퇴 시점 날짜 추가
	private int mdate;
	
	
	public MemberVO() {}


	public int getMidx() {
		return midx;
	}


	public void setMidx(int midx) {
		this.midx = midx;
	}


	public String getMid() {
		return mid;
	}


	public void setMid(String mid) {
		this.mid = mid;
	}


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public String getMname() {
		return mname;
	}


	public void setMname(String mname) {
		this.mname = mname;
	}


	public String getMphone() {
		return mphone;
	}


	public void setMphone(String mphone) {
		this.mphone = mphone;
	}


	public String getMemail() {
		return memail;
	}


	public void setMemail(String memail) {
		this.memail = memail;
	}


	public String getMnickname() {
		return mnickname;
	}


	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}


	public String getMphoto() {
		return mphoto;
	}


	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}


	public int getMlevel() {
		return mlevel;
	}


	public void setMlevel(int mlevel) {
		this.mlevel = mlevel;
	}


	public int getMdate() {
		return mdate;
	}


	public void setMdate(int mdate) {
		this.mdate = mdate;
	}


	@Override
	public String toString() {
		return "MemberVO [midx=" + midx + ", mid=" + mid + ", pwd=" + pwd + ", mname=" + mname + ", mphone=" + mphone
				+ ", memail=" + memail + ", mnickname=" + mnickname + ", mphoto=" + mphoto + ", mlevel=" + mlevel
				+ ", mdate=" + mdate + "]";
	}
	
	

	

	
	
	
	
}
