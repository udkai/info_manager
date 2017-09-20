package com.balance.customer.model;

import java.util.Date;

/**
 * Created by dsy on 2017/9/18.
 * 用户信息表  model
 */
public class CustomerInfo {
	private int id;// 主键 自增
	private String name; // 姓名
	private String address;// 地址
	private String tel;// 电话
	private String create_person;
	private Date create_at;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getCreate_person() {
		return create_person;
	}

	public void setCreate_person(String create_person) {
		this.create_person = create_person;
	}

	public Date getCreate_at() {
		return create_at;
	}

	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}

	@Override
	public String toString() {
		return "CustomerInfo{" +
				"id=" + id +
				", name='" + name + '\'' +
				", address='" + address + '\'' +
				", tel='" + tel + '\'' +
				", create_person='" + create_person + '\'' +
				", create_at=" + create_at +
				'}';
	}
}
