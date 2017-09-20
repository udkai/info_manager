package com.balance.customer.service;



import com.balance.customer.VO.CustomerInfoSearchVO;
import com.balance.customer.dao.CustomerInfoDao;
import com.balance.customer.model.CustomerInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by dsy on 2017/4/17.
 * 学员档案  Service
 */
@Service
public class CustomerInfoService {
    @Autowired
    private CustomerInfoDao customerInfoDao;

    /**
     * 查询
     */
    public List<CustomerInfo> search(CustomerInfoSearchVO customerInfoSearchVO, int pageIndex, int pageSize) {
        return customerInfoDao.search(customerInfoSearchVO, pageIndex, pageSize);
    }

    public int count(CustomerInfoSearchVO customerInfoSearchVO) {

        return customerInfoDao.count(customerInfoSearchVO);
    }

    /**
     * 新增
     *
     * @param customerInfo
     * @return 成功1  失败0
     */
    public int add(CustomerInfo customerInfo) {
        return customerInfoDao.add(customerInfo);
    }

    /**
     * 修改
     *
     * @param customerInfo 客户信息
     * @return 成功1 失败0
     */
    public int update(CustomerInfo customerInfo) {

        return customerInfoDao.update(customerInfo);
    }

    /**
     *
     *
     * @return 客户信息
     */
    public CustomerInfo get(int id) {
        return customerInfoDao.getById(id);
    }


    /**
     * 删除
     * @param id
     * @return
     */
    public int delete(int id) {
        return customerInfoDao.delete(id);
    }





}
