package com.project.petmily.board;

import java.sql.Date;

public class BoardVO {

	int bidx;
	int midx;
	String btitle;
	String btext;
	String bpict1;
	String bpict2;
	String bpict3;
	Date bregdate;
	int boardcate;
	int alarm;
	int likecnt;
	
	//검색을 위한 조건
	String searchCondition;
	String searchKeyword;
	
	
	
	public String getSearchCondition() {
		return searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public BoardVO() {
	}

	public BoardVO(int bidx, int midx, String btitle, String btext, String bpict1, String bpict2, String bpict3,
			Date bregdate, int boardcate, int alarm, String searchCondition, String searchKeyword) {
		super();
		this.bidx = bidx;
		this.midx = midx;
		this.btitle = btitle;
		this.btext = btext;
		this.bpict1 = bpict1;
		this.bpict2 = bpict2;
		this.bpict3 = bpict3;
		this.bregdate = bregdate;
		this.boardcate = boardcate;
		this.alarm = alarm;
		this.searchCondition = searchCondition;
		this.searchKeyword = searchKeyword;
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

	public Date getBregdate() {
		return bregdate;
	}

	public void setBregdate(Date bregdate) {
		this.bregdate = bregdate;
	}

	public int getBoardcate() {
		return boardcate;
	}

	public void setBoardcate(int boardcate) {
		this.boardcate = boardcate;
	}

	public int getAlarm() {
		return alarm;
	}

	public void setAlarm(int alarm) {
		this.alarm = alarm;
	}
	
	public int getLikecnt() {
		return likecnt;
	}

	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}

	@Override
	public String toString() {
		return "BoardVO [bidx=" + bidx + ", midx=" + midx + ", btitle=" + btitle + ", btext=" + btext + ", bpict1="
				+ bpict1 + ", bpict2=" + bpict2 + ", bpict3=" + bpict3 + ", bregdate=" + bregdate + ", boardcate="
				+ boardcate + ", alarm=" + alarm + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + "]";
	}


	
	
	
}
