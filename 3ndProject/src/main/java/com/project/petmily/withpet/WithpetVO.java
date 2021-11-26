package com.project.petmily.withpet;

public class WithpetVO {
	private int widx;
	private String placename;
	private int placetype;
	private String content;
	private String location;
	private String link;
	private String thumbnail;
	private String postcode;
	private String address;
	private String detailAddress;
	private String extraAddress;
	private String totalAddress;
	
	private String searchKeyword;
	
	public int getWidx() {
		return widx;
	}
	public void setWidx(int widx) {
		this.widx = widx;
	}
	public String getPlacename() {
		return placename;
	}
	public void setPlacename(String placename) {
		this.placename = placename;
	}
	public int getPlacetype() {
		return placetype;
	}
	public void setPlacetype(int placetype) {
		this.placetype = placetype;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	
	public String getThumbnail() {
		return thumbnail;
	}
	
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getExtraAddress() {
		return extraAddress;
	}
	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}
	
	public String getTotalAddress() {
		return totalAddress;
	}
	
	public void setTotalAddress(String postcode, String address, String detailAddress, String extraAddress) {
		this.totalAddress = postcode + " " + address + detailAddress + extraAddress;
	}
	@Override
	public String toString() {
		return "WithpetVO [widx=" + widx + ", placename=" + placename + ", placetype=" + placetype + ", content="
				+ content + ", location=" + location + ", link=" + link + ", thumbnail=" + thumbnail + ", postcode="
				+ postcode + ", address=" + address + ", detailAddress=" + detailAddress + ", extraAddress="
				+ extraAddress + ", totalAddress=" + totalAddress + ", searchKeyword=" + searchKeyword + "]";
	}
	
	
	
}
