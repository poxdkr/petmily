package com.project.petmily.knowhow;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

//@JsonIgnoreProperties : JSON 데이터 변환시 제외시킬 필드 지정
@JsonIgnoreProperties(value = {"searchCondition", "searchKeyword"})
public class KnowhowVO {
	private int bidx;
	private int midx;
	private String btitle;
	private String btext;
	private String bpict1;
	private Date bregdate;
	private int boardcate;
	private int alarm;
	private String mnickname;
	private int likecnt;
	private String mphoto;
	
	// 검색조건용 필드 추가
	//@JsonIgnore //JSON 데이터 변경 제외
	private String searchCondition;
	//@JsonIgnore 
	private String searchKeyword;
	
	
	public KnowhowVO() {
		System.out.println(">> KnowVO() 객체 생성");
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

	public Date getBregdate() {
		return bregdate;
	}

	public void setBregdate(Date regdate) {
		this.bregdate = regdate;
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
	
	public String getMnickname() {
		return mnickname;
	}

	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}
	
	public int getLikecnt() {
		return likecnt;
	}

	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}

	@Override
	public String toString() {
		return "KnowhowVO [bidx=" + bidx + ", midx=" + midx + ", btitle=" + btitle + ", btext=" + btext + ", bpict1="
				+ bpict1 + ", bregdate=" + bregdate + ", boardcate=" + boardcate + ", alarm=" + alarm + ", mnickname="
				+ mnickname + ", like=" + likecnt + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + "]";
	}

	//==========================
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}


	public String getMphoto() {
		return mphoto;
	}


	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}

}









