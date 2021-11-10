package com.project.petmily.advertise;

import java.sql.Date;

public class AdvertiseVO {
	private int aidx; 
	private String acontent;
	private String alink;
	private String apicture;
	private String aori;
	private int acount;
	private Date aregdate;
	private String atitle;
	
	public AdvertiseVO() {
	}

	public AdvertiseVO(int aidx, String acontent, String alink, String apicture, String aori, int acount, Date aregdate,
			String atitle) {
		super();
		this.aidx = aidx;
		this.acontent = acontent;
		this.alink = alink;
		this.apicture = apicture;
		this.aori = aori;
		this.acount = acount;
		this.aregdate = aregdate;
		this.atitle = atitle;
	}

	public int getAidx() {
		return aidx;
	}

	public void setAidx(int aidx) {
		this.aidx = aidx;
	}

	public String getAcontent() {
		return acontent;
	}

	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}

	public String getAlink() {
		return alink;
	}

	public void setAlink(String alink) {
		this.alink = alink;
	}

	public String getApicture() {
		return apicture;
	}

	public void setApicture(String apicture) {
		this.apicture = apicture;
	}

	public String getAori() {
		return aori;
	}

	public void setAori(String aori) {
		this.aori = aori;
	}

	public int getAcount() {
		return acount;
	}

	public void setAcount(int acount) {
		this.acount = acount;
	}

	public Date getAregdate() {
		return aregdate;
	}

	public void setAregdate(Date aregdate) {
		this.aregdate = aregdate;
	}

	public String getAtitle() {
		return atitle;
	}

	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}

	@Override
	public String toString() {
		return "AdvertiseVO [aidx=" + aidx + ", acontent=" + acontent + ", alink=" + alink + ", apicture=" + apicture
				+ ", aori=" + aori + ", acount=" + acount + ", aregdate=" + aregdate + ", atitle=" + atitle + "]";
	}
	
	
	
	
}
