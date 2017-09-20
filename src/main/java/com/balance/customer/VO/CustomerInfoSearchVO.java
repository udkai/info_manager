package com.balance.customer.VO;

/**
 * Created by dsy on 2017/4/19.
 * 学员档案表  查询VO
 */
public class CustomerInfoSearchVO {

    private String name;  //姓名

    public String getName_param() {
        return "%" + name + "%";
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


}
