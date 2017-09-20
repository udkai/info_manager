package com.balance.order.service;

import com.balance.order.VO.OrderInfoSearchVO;
import com.balance.order.dao.OrderInfoDao;
import com.balance.order.model.OrderInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by dsy on 2017/4/17.
 * 学员档案  Service
 */
@Service
public class OrderInfoService {
    @Autowired
    private OrderInfoDao orderInfoDao;

    /**
     * 查询
     */
    public List<OrderInfo> search(OrderInfoSearchVO orderInfoSearchVO, int pageIndex, int pageSize) {
        return orderInfoDao.search(orderInfoSearchVO, pageIndex, pageSize);
    }

    public int count(OrderInfoSearchVO orderInfoSearchVO) {

        return orderInfoDao.count(orderInfoSearchVO);
    }

    /**
     * 新增
     *
     * @param orderInfo
     * @return 成功1  失败0
     */
    public int add(OrderInfo orderInfo) {
        return orderInfoDao.add(orderInfo);
    }

    /**
     * 修改
     *
     * @param orderInfo 客户信息
     * @return 成功1 失败0
     */
    public int update(OrderInfo orderInfo) {

        return orderInfoDao.update(orderInfo);
    }

    /**
     * 获得学员档案
     *
     * @return 客户信息
     */
    public OrderInfo get(int id) {
        return orderInfoDao.getById(id);
    }


    /**
     * 删除
     * @param id
     * @return
     */
    public int delete(int id) {
        return orderInfoDao.delete(id);
    }





}
