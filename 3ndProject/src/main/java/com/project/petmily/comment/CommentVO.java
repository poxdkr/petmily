package com.project.petmily.comment;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class CommentVO {

	private int ridx;
	private int bidx;
	private int midx;
	private int recomment;
	private String rcontent;
	private Date rregdate;
	private String mnickname;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
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

	public String getRregdate() {
		return sdf.format(rregdate);
	}

	public void setRregdate(Date rregdate) {
		this.rregdate = rregdate;
	}

	public String getMnickname() {
		return mnickname;
	}

	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}

	@Override
	public String toString() {
		return "CommentVO [ridx=" + ridx + ", bidx=" + bidx + ", midx=" + midx + ", recomment=" + recomment
				+ ", rcontent=" + rcontent + ", rregdate=" + rregdate + ", mnickname=" + mnickname + "]";
	}

}
