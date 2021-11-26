package com.project.petmily.faq;

import java.sql.Date;

public class ReportDetailVO {

	private int ridx;
	private int rfrom;
	private int rto;
	private int rtype;
	private int rnum;
	private String rcontent;
	private Date rregdate;
	private int rcount;
	private int bidx;
	private String btitle;
	private String btext;
	private String bpict1;
	private String bpict2;
	private String bpict3;
	private int ridx1;
	private String rcontent1;
	private String rfnick;
	private String rtnick;

	
	public ReportDetailVO() {
	}
	
	public ReportDetailVO(int ridx, int rfrom, int rto, int rtype, int rnum, String rcontent, Date rregdate) {
		super();
		this.ridx = ridx;
		this.rfrom = rfrom;
		this.rto = rto;
		this.rtype = rtype;
		this.rnum = rnum;
		this.rcontent = rcontent;
		
	}

	public int getRidx() {
		return ridx;
	}

	public void setRidx(int ridx) {
		this.ridx = ridx;
	}

	public int getRfrom() {
		return rfrom;
	}

	public void setRfrom(int rfrom) {
		this.rfrom = rfrom;
	}

	public int getRto() {
		return rto;
	}

	public void setRto(int rto) {
		this.rto = rto;
	}

	public int getRtype() {
		return rtype;
	}

	public void setRtype(int rtype) {
		this.rtype = rtype;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public Date getRregdate() {
		return rregdate;
	}

	public void setRregdate(Date rregdate) {
		this.rregdate = rregdate;
	}
	
	

	public int getRcount() {
		return rcount;
	}

	public void setRcount(int rcount) {
		this.rcount = rcount;
	}
	
	

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBtext() {
		return btext;
	}

	public void setBtext(String btext) {
		this.btext = btext;
	}

	public String getBpict1() {
		return bpict1;
	}

	public void setBpict1(String bpict1) {
		this.bpict1 = bpict1;
	}

	public String getBpict2() {
		return bpict2;
	}

	public void setBpict2(String bpict2) {
		this.bpict2 = bpict2;
	}

	public String getBpict3() {
		return bpict3;
	}

	public void setBpict3(String bpict3) {
		this.bpict3 = bpict3;
	}

	public int getBidx() {
		return bidx;
	}

	public void setBidx(int bidx) {
		this.bidx = bidx;
	}

	public int getRidx1() {
		return ridx1;
	}

	public void setRidx1(int ridx1) {
		this.ridx1 = ridx1;
	}

	public String getRcontent1() {
		return rcontent1;
	}

	public void setRcontent1(String rcontent1) {
		this.rcontent1 = rcontent1;
	}

	public String getRfnick() {
		return rfnick;
	}

	public void setRfnick(String rfnick) {
		this.rfnick = rfnick;
	}

	public String getRtnick() {
		return rtnick;
	}

	public void setRtnick(String rtnick) {
		this.rtnick = rtnick;
	}

	@Override
	public String toString() {
		return "ReportDetailVO [ridx=" + ridx + ", rfrom=" + rfrom + ", rto=" + rto + ", rtype=" + rtype + ", rnum="
				+ rnum + ", rcontent=" + rcontent + ", rregdate=" + rregdate + ", rcount=" + rcount + ", bidx=" + bidx
				+ ", btitle=" + btitle + ", btext=" + btext + ", bpict1=" + bpict1 + ", bpict2=" + bpict2 + ", bpict3="
				+ bpict3 + ", ridx1=" + ridx1 + ", rcontent1=" + rcontent1 + ", rfnick=" + rfnick + ", rtnick=" + rtnick
				+ "]";
	}
	
	

	
	
}
