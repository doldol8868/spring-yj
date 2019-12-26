package com.ex1.yj.vo;

import java.sql.Date;

public class BoardVO {

	private int tbno;
	private String tbid;
	private String tbtitle;
	private String tbbody;
	
	public int getTbno() {
		return tbno;
	}
	public void setTbno(int tbno) {
		this.tbno = tbno;
	}
	public String getTbid() {
		return tbid;
	}
	public void setTbid(String tbid) {
		this.tbid = tbid;
	}
	public String getTbtitle() {
		return tbtitle;
	}
	public void setTbtitle(String tbtitle) {
		this.tbtitle = tbtitle;
	}
	public String getTbbody() {
		return tbbody;
	}
	public void setTbbody(String tbbody) {
		this.tbbody = tbbody;
	}
	public Date getTbdate() {
		return tbdate;
	}
	public void setTbdate(Date tbdate) {
		this.tbdate = tbdate;
	}
	public String getTb_isshow() {
		return tb_isshow;
	}
	public void setTb_isshow(String tb_isshow) {
		this.tb_isshow = tb_isshow;
	}
	private Date tbdate;
	private String tb_isshow;
	
}
