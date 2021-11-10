package com.project.petmily.member;

public class MemberVO {

	int midx;
	String mid;
	String pwd;
	String mname;
	String mphone;
	String memail;
	String mnickname;
	String mphoto;
	int mlevel;
	
	public MemberVO() {
	}

	public MemberVO(int midx, String mid, String pwd, String mname, String mphone, String memail, String mnickname,
			String mphoto, int mlevel) {
		super();
		this.midx = midx;
		this.mid = mid;
		this.pwd = pwd;
		this.mname = mname;
		this.mphone = mphone;
		this.memail = memail;
		this.mnickname = mnickname;
		this.mphoto = mphoto;
		this.mlevel = mlevel;
	}

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

	@Override
	public String toString() {
		return "MemberVO [midx=" + midx + ", mid=" + mid + ", pwd=" + pwd + ", mname=" + mname + ", mphone=" + mphone
				+ ", memail=" + memail + ", mnickname=" + mnickname + ", mphoto=" + mphoto + ", mlevel=" + mlevel + "]";
	}
	
	
	
	
	
}
