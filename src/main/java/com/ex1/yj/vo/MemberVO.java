package com.ex1.yj.vo;

import java.sql.Date;

public class MemberVO {

	private int m_no;
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_mail;
	private String m_tel;
	private Date m_join;
	private int m_avt;
	private String m_gen;
	private String isshow;
	
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_mail() {
		return m_mail;
	}
	public void setM_mail(String m_mail) {
		this.m_mail = m_mail;
	}
	public String getM_tel() {
		return m_tel;
	}
	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}
	public Date getM_join() {
		return m_join;
	}
	public void setM_join(Date m_join) {
		this.m_join = m_join;
	}
	public int getM_avt() {
		return m_avt;
	}
	public void setM_avt(int m_avt) {
		this.m_avt = m_avt;
	}
	public String getM_gen() {
		return m_gen;
	}
	public void setM_gen(String m_gen) {
		this.m_gen = m_gen;
	}
	public String getIsshow() {
		return isshow;
	}
	public void setIsshow(String isshow) {
		this.isshow = isshow;
	}
	
	
}
