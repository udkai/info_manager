package com.balance.order.VO;

import java.util.Date;

/**
 * Created by dsy on 2017/4/19.
 * 学员档案表  查询VO
 */
public class OrderInfoSearchVO {

    private String order_name;  //订单内容
    private Double amount;
    private String order_time_start;
    private String order_time_end;
    private String status;

    @Override
    public String toString() {
        return "OrderInfoSearchVO{" +
                "order_name='" + order_name + '\'' +
                ", amount=" + amount +
                ", order_time_start='" + order_time_start + '\'' +
                ", order_time_end='" + order_time_end + '\'' +
                ", status='" + status + '\'' +
                '}';
    }

    public String getOrder_name() {
        return order_name;
    }

    public void setOrder_name(String order_name) {
        this.order_name = order_name;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public String getOrder_time_start() {
        return order_time_start;
    }

    public void setOrder_time_start(String order_time_start) {
        this.order_time_start = order_time_start;
    }

    public String getOrder_time_end() {
        return order_time_end;
    }

    public void setOrder_time_end(String order_time_end) {
        this.order_time_end = order_time_end;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
