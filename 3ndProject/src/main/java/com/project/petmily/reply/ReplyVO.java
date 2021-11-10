package com.project.petmily.reply;

import java.sql.Date;

public class ReplyVO {

	int ridx;
	int bidx;
	int midx;
	int recomment;
	String rcontent;
	Date rregdate;
	
	public ReplyVO() {
	}

	public ReplyVO(int ridx, int bidx, int midx, int recomment, String rcontent, Date rregdate) {
		super();
		this.ridx = ridx;
		this.bidx = bidx;
		this.midx = midx;
		this.recomment = recomment;
		this.rcontent = rcontent;
		this.rregdate = rregdate;
	}

	public int getRidx() {
		return ridx;
	}

	public void setRidx(int ridx) {
		this.ridx = ridx;
	}

	public int getBidx() {
		return bidx;
	}

	public void setBidx(int bidx) {
		this.bidx = bidx;
	}

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	public int getRecomment() {
		return recomment;
	}

	public void setRecomment(int recomment) {
		this.recomment = recomment;
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
		return "ReplyVO [ridx=" + ridx + ", bidx=" + bidx + ", midx=" + midx + ", recomment=" + recomment
				+ ", rcontent=" + rcontent + ", rregdate=" + rregdate + "]";
	}
	
	
	
	
	
	
}
