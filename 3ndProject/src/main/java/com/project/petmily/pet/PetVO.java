package com.project.petmily.pet;

import java.sql.Date;

public class PetVO {

	int pidx;
	int midx;
	String ptype;
	String pkind;
	String pname;
	String pgender;
	String pphoto;
	Date pbirth;
	
	public PetVO(){}
	
	public PetVO(int pidx, int midx, String ptype, String pkind, String pname, String pgender, String pphoto,
			Date pbirth) {
		super();
		this.pidx = pidx;
		this.midx = midx;
		this.ptype = ptype;
		this.pkind = pkind;
		this.pname = pname;
		this.pgender = pgender;
		this.pphoto = pphoto;
		this.pbirth = pbirth;
	}
	
	
	public int getPidx() {
		return pidx;
	}
	public void setPidx(int pidx) {
		this.pidx = pidx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getPtype() {
		return ptype;
	}
	public void setPtype(String ptype) {
		this.ptype = ptype;
	}
	public String getPkind() {
		return pkind;
	}
	public void setPkind(String pkind) {
		this.pkind = pkind;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPgender() {
		return pgender;
	}
	public void setPgender(String pgender) {
		this.pgender = pgender;
	}
	public String getPphoto() {
		return pphoto;
	}
	public void setPphoto(String pphoto) {
		this.pphoto = pphoto;
	}
	public Date getPbirth() {
		return pbirth;
	}
	public void setPbirth(Date pbirth) {
		this.pbirth = pbirth;
	}


	@Override
	public String toString() {
		return "PetVO [pidx=" + pidx + ", midx=" + midx + ", ptype=" + ptype + ", pkind=" + pkind + ", pname=" + pname
				+ ", pgender=" + pgender + ", pphoto=" + pphoto + ", pbirth=" + pbirth + "]";
	}
	
	
	
}
