package com.project.petmily.board;

public class MyBoardListVO {
	private int bidx;
	private int midx;
	private int boardcate;
	private String btitle;
	private String bpict1;
	
	private int allcnt;
	private int dogcnt;
	private int catcnt;
	private int knowcnt;
	private int freecnt;
	
	// 시작 게시물 번호
	private int startRowNum;
	// 끝 게시물 번호
	private int endRowNum;
	// 가져갈 게시물 갯수
	private int rowCount;
	// 페이지 넘버
	private int strPageNum;
	
	public int getBidx() {
		return bidx;
	}
	public void setBidx(int bidx) {
		this.bidx = bidx;
	}
	public int getBoardcate() {
		return boardcate;
	}
	public void setBoardcate(int boardcate) {
		this.boardcate = boardcate;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBpict1() {
		return bpict1;
	}
	public void setBpict1(String bpict1) {
		this.bpict1 = bpict1;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getAllcnt() {
		return allcnt;
	}
	public void setAllcnt(int allcnt) {
		this.allcnt = allcnt;
	}
	public int getDogcnt() {
		return dogcnt;
	}
	public void setDogcnt(int dogcnt) {
		this.dogcnt = dogcnt;
	}
	public int getCatcnt() {
		return catcnt;
	}
	public void setCatcnt(int catcnt) {
		this.catcnt = catcnt;
	}
	public int getKnowcnt() {
		return knowcnt;
	}
	public void setKnowcnt(int knowcnt) {
		this.knowcnt = knowcnt;
	}
	public int getFreecnt() {
		return freecnt;
	}
	public void setFreecnt(int freecnt) {
		this.freecnt = freecnt;
	}
	public int getStartRowNum() {
		return startRowNum;
	}
	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}
	public int getEndRowNum() {
		return endRowNum;
	}
	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}
	public int getRowCount() {
		return rowCount;
	}
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}
	public int getStrPageNum() {
		return strPageNum;
	}
	public void setStrPageNum(int strPageNum) {
		this.strPageNum = strPageNum;
	}
	
	@Override
	public String toString() {
		return "MyBoardListVO [bidx=" + bidx + ", midx=" + midx + ", boardcate=" + boardcate + ", btitle=" + btitle
				+ ", bpict1=" + bpict1 + ", allcnt=" + allcnt + ", dogcnt=" + dogcnt + ", catcnt=" + catcnt
				+ ", knowcnt=" + knowcnt + ", freecnt=" + freecnt + ", startRowNum=" + startRowNum + ", endRowNum="
				+ endRowNum + ", rowCount=" + rowCount + ", strPageNum=" + strPageNum + "]";
	}
}
