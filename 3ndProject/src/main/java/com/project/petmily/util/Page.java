package com.project.petmily.util;

public class Page {

	private int startPage; // 시작페이지
	private int endPage; // 끝페이지
	private boolean prev;
	private boolean next; // 이전, 다음 페이지 유무. flag
	private int total; // 전체 레코드수
	private Criteria cri;

	public Page(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;

		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;

		this.startPage = this.endPage - 9;

		// 실제 끝 페이지
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

		if (realEnd <= this.endPage) { // 실제 끝 페이지가 끝 페이지보다 작으면
			this.endPage = realEnd; // 끝 페이지를 실제 끝 페이지 값으로 변경
		}

		// 시작 페이지가 1페이지 보다 크면 prev가 true
		this.prev = this.startPage > 1;

		// 끝 페이지가 실제 끝 페이지보다 작으면 next가 true
		this.next = this.endPage < realEnd;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	@Override
	public String toString() {
		return "Page [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", cri=" + cri + "]";
	}
	
	
	
}