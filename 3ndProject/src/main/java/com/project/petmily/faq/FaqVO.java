package com.project.petmily.faq;

public class FaqVO {
	private int fidx;
	private String ftitle;
	private String fcontent;
	private String fcategory;

	public FaqVO() {
		System.out.println("FaqVO 객체생성");
	}

	public int getFidx() {
		return fidx;
	}

	public void setFidx(int fidx) {
		this.fidx = fidx;
	}

	public String getFtitle() {
		return ftitle;
	}

	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}

	public String getFcontent() {
		return fcontent;
	}

	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}

	public String getFcategory() {
		return fcategory;
	}

	public void setFcategory(String fcategory) {
		this.fcategory = fcategory;
	}

	@Override
	public String toString() {
		return "FaqVO [fidx=" + fidx + ", ftitle=" + ftitle + ", fcontent=" + fcontent + ", fcategory=" + fcategory
				+ "]";
	}

}
