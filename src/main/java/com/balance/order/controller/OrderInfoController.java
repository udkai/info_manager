package com.balance.order.controller;


import com.balance.order.VO.OrderInfoSearchVO;
import com.balance.order.model.OrderInfo;
import com.balance.order.service.OrderInfoService;
import com.balance.util.backurl.BackUrlUtil;
import com.balance.util.config.PubConfig;
import com.balance.util.controller.BaseController;
import com.balance.util.global.GlobalConst;
import com.balance.util.page.PageNavigate;
import com.balance.util.session.SessionUtil;
import com.balance.util.string.StringUtil;
import com.balance.util.web.WebUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by dsy on 2017/9/18.
 * 订单信息 Controller
 */
@Controller
@RequestMapping("/order/orderInfo")
public class OrderInfoController extends BaseController {

    @Autowired
    private OrderInfoService orderInfoService;
    @Autowired
    private PubConfig pubConfig;

    /**
     * 学员档案类型首页
     *
     * @return 页面
     */
    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request, OrderInfoSearchVO orderInfoSearchVO) {
//        setBtnAutho(request, "OrderInfo");
        ModelAndView mv = new ModelAndView();
        int count = orderInfoService.count(orderInfoSearchVO);
        int pageIndex = WebUtil.getSafeInt(request.getParameter("pageIndex"), 1);// 获取当前页数
        int pageSize = GlobalConst.pageSize;// 直接取全局变量，每页记录数

        String url = createUrl(orderInfoSearchVO, pageIndex, pageSize);
        PageNavigate pageNavigate = new PageNavigate(url, pageIndex, pageSize, count);//

        List<OrderInfo> orderInfoList = orderInfoService.search(orderInfoSearchVO, pageIndex, pageSize);
        mv.addObject("orderInfoList", orderInfoList);
        mv.addObject("pageNavigate", pageNavigate);
        mv.addObject("backUrl", StringUtil.encodeUrl(url));
        mv.setViewName("order/orderInfo");

        return mv;
    }

    private String createUrl(OrderInfoSearchVO orderInfoSearchVO, int pageIndex, int pageSize) {
        String url = pubConfig.getDynamicServer() + "/order/orderInfo/index.htm?";
        if (StringUtil.isNotNullOrEmpty(orderInfoSearchVO.getOrder_name())) {
            url += " &name=" + orderInfoSearchVO.getOrder_name();
        }
        return url;
    }

    @RequestMapping("/toAdd")
    public ModelAndView toAdd(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("/order/orderInfoAdd");

        BackUrlUtil.setBackUrl(mv, request);
        return mv;
    }

    @RequestMapping("/add")
    public String add(OrderInfo orderInfo, HttpServletRequest request) {
        orderInfo.setCreate_person(SessionUtil.getUserSession(request).getRealname());
        int flag = orderInfoService.add(orderInfo);
        if (flag == 0)
            return "forward:/error.htm?msg=" + StringUtil.encodeUrl("订单信息新增失败");
        else
            return "forward:/success.htm?msg=" + StringUtil.encodeUrl("订单信息新增成功");
    }

    @RequestMapping("/toUpdate")
    public ModelAndView toUpdate(HttpServletRequest request, int id) {
        ModelAndView mv = new ModelAndView("/order/orderInfoUpdate");

        OrderInfo orderInfo = orderInfoService.get(id);
        mv.addObject("orderInfo", orderInfo);

        BackUrlUtil.setBackUrl(mv, request);
        return mv;
    }

    @RequestMapping("/update")
    public String update(OrderInfo orderInfo) {
        int flag = orderInfoService.update(orderInfo);
        if (flag == 0)
            return "forward:/error.htm?msg=" + StringUtil.encodeUrl("订单信息修改失败");
        else
            return "forward:/success.htm?msg=" + StringUtil.encodeUrl("订单信息修改成功");
    }



    @RequestMapping("/delete")
    public String delete(int id) {
        int flag = orderInfoService.delete(id);
        if (flag == 0)
            return "forward:/error.htm?msg=" + StringUtil.encodeUrl("订单信息删除失败");
        else
            return "forward:/success.htm?msg=" + StringUtil.encodeUrl("订单信息删除成功");
    }




}
