package com.project.petmily.like;

public class LikeVO {
	
	int lidx;
	int bidx;
	int midx;
	int boardcate;
	boolean checked;
	int checkedcnt;
	
	public LikeVO() {
	}

	public LikeVO(int lidx, int bidx, int midx, int boardcate, boolean checked, int checkedcnt) {
		super();
		this.lidx = lidx;
		this.bidx = bidx;
		this.midx = midx;
		this.boardcate = boardcate;
		this.checked = checked;
		this.checkedcnt = checkedcnt;
	}

	public int getLidx() {
		return lidx;
	}

	public void setLidx(int lidx) {
		this.lidx = lidx;
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

	public int getBoardcate() {
		return boardcate;
	}

	public void setBoardcate(int boardcate) {
		this.boardcate = boardcate;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public int getCheckedcnt() {
		return checkedcnt;
	}

	public void setCheckedcnt(int checkedcnt) {
		this.checkedcnt = checkedcnt;
	}

	@Override
	public String toString() {
		return "LikeVO [lidx=" + lidx + ", bidx=" + bidx + ", midx=" + midx + ", boardcate=" + boardcate + ", checked="
				+ checked + ", checkedcnt=" + checkedcnt + "]";
	}
	
	
}
