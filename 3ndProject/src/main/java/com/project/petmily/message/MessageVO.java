package com.project.petmily.message;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MessageVO {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
	private int msgidx;
	private int room;
	private int send_midx;
	private int recv_midx;
	private Date send_time;
	private Date read_time;
	private String content;
	private int read_chk;
	private String mnickname;
	private String mphoto;
	
	private String send_nick;
	private String recv_nick;
	
	// 현재 사용자의 메세지 상대 nick을 담는다.
	private String other_nick;
		
	// 현재 사용자의 메세지 상대 profile을 담는다.
	private String profile;
	
	// 현재 사용자 nick
	private String nick;
	
	// 현재 사용자 midx;
	private int midx;
	
	// 안읽은 메세지 갯수 
	private int unread;
	
	private int delete_chk;
	
	public String getOther_nick() {
		return other_nick;
	}
	public void setOther_nick(String other_nick) {
		this.other_nick = other_nick;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public int getUnread() {
		return unread;
	}
	public void setUnread(int unread) {
		this.unread = unread;
	}
	public int getMsgidx() {
		return msgidx;
	}
	public void setMsgidx(int msgidx) {
		this.msgidx = msgidx;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public int getSend_midx() {
		return send_midx;
	}
	public void setSend_midx(int send_midx) {
		this.send_midx = send_midx;
	}
	public int getRecv_midx() {
		return recv_midx;
	}
	public void setRecv_midx(int recv_midx) {
		this.recv_midx = recv_midx;
	}
	public String getSend_time() {
		return sdf.format(send_time);
	}
	public void setSend_time(Date send_time) {
		this.send_time = send_time;
	}
	public Date getRead_time() {
		return read_time;
	}
	public void setRead_time(Date recv_time) {
		this.read_time = recv_time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRead_chk() {
		return read_chk;
	}
	public void setRead_chk(int read_chk) {
		this.read_chk = read_chk;
	}
	public String getMnickname() {
		return mnickname;
	}
	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}
	public String getMphoto() {
		return mphoto;
	}
	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}
	public String getSend_nick() {
		return send_nick;
	}
	public void setSend_nick(String send_nick) {
		this.send_nick = send_nick;
	}
	public String getRecv_nick() {
		return recv_nick;
	}
	public void setRecv_nick(String recv_nick) {
		this.recv_nick = recv_nick;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getDelete_chk() {
		return delete_chk;
	}
	public void setDelete_chk(int delete_chk) {
		this.delete_chk = delete_chk;
	}
	@Override
	public String toString() {
		return "MessageVO [sdf=" + sdf + ", msgidx=" + msgidx + ", room=" + room + ", send_midx=" + send_midx
				+ ", recv_midx=" + recv_midx + ", send_time=" + send_time + ", read_time=" + read_time + ", content="
				+ content + ", read_chk=" + read_chk + ", mnickname=" + mnickname + ", mphoto=" + mphoto
				+ ", send_nick=" + send_nick + ", recv_nick=" + recv_nick + ", other_nick=" + other_nick + ", profile="
				+ profile + ", nick=" + nick + ", midx=" + midx + ", unread=" + unread + ", delete_chk=" + delete_chk
				+ "]";
	}
}
