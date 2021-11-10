package com.project.petmily.report;

import java.sql.Date;

public class ReportVO {

	private int ridx;
	private int rfrom;
	private int rto;
	private int rtype;
	private int rnum;
	private String rcontent;
	private Date rregdate;
	
	public ReportVO() {
	}
	
	public ReportVO(int ridx, int rfrom, int rto, int rtype, int rnum, String rcontent, Date rregdate) {
		super();
		this.ridx = ridx;
		this.rfrom = rfrom;
		this.rto = rto;
		this.rtype = rtype;
		this.rnum = rnum;
		this.rcontent = rcontent;
		this.rregdate = rregdate;
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

	@Override
	public String toString() {
		return "ReportVO [ridx=" + ridx + ", rfrom=" + rfrom + ", rto=" + rto + ", rtype=" + rtype + ", rnum=" + rnum
				+ ", rcontent=" + rcontent + ", rregdate=" + rregdate + "]";
	}
	
	
	
}
