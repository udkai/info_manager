package com.balance.order.model;

import java.util.Date;

/**
 * Created by dsy on 2017/9/18.
 * 订单信息表  model
 */
public class OrderInfo {
	private int id;// 主键 自增
	private String order_name;//订单名称
	private String order_time;//订单时间
	private Double amount;//订单金额
	private String status;//订单状态
	private String create_person;//创建人
	private Date create_at;//创建时间


	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrder_name() {
		return order_name;
	}

	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}

	public String getOrder_time() {
		return order_time;
	}

	public void setOrder_time(String order_time) {
		this.order_time = order_time;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
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

	@Override
	public String toString() {
		return "CustomerInfo{" +
				"id=" + id +
				", order_name='" + order_name + '\'' +
				", order_time=" + order_time +
				", amount=" + amount +
				", create_person='" + create_person + '\'' +
				", create_at=" + create_at +
				'}';
	}

	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}
}
