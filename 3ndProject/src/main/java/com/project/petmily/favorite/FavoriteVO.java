package com.project.petmily.favorite;

public class FavoriteVO {

	
	int fidx;
	int midx;
	int bidx;
	boolean checked;
	int boardcate;
	
	public FavoriteVO() {
	}

	public FavoriteVO(int fidx, int midx, int bidx, boolean checked, int boardcate) {
		super();
		this.fidx = fidx;
		this.midx = midx;
		this.bidx = bidx;
		this.checked = checked;
		this.boardcate = boardcate;
	}

	public int getFidx() {
		return fidx;
	}

	public void setFidx(int fidx) {
		this.fidx = fidx;
	}

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	public int getBidx() {
		return bidx;
	}

	public void setBidx(int bidx) {
		this.bidx = bidx;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public int getBoardcate() {
		return boardcate;
	}

	public void setBoardcate(int boardcate) {
		this.boardcate = boardcate;
	}

	@Override
	public String toString() {
		return "FavoriteVO [fidx=" + fidx + ", midx=" + midx + ", bidx=" + bidx + ", checked=" + checked
				+ ", boardcate=" + boardcate + "]";
	}
	
	
	
}
