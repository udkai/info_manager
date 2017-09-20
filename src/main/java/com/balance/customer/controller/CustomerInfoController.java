package com.balance.customer.controller;


import com.balance.customer.VO.CustomerInfoSearchVO;
import com.balance.customer.model.CustomerInfo;
import com.balance.customer.service.CustomerInfoService;
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
 * 客户信息 Controller
 */
@Controller
@RequestMapping("/customer/customerInfo")
public class CustomerInfoController extends BaseController {

    @Autowired
    private CustomerInfoService customerInfoService;
    @Autowired
    private PubConfig pubConfig;

    /**
     * 学员档案类型首页
     *
     * @return 页面
     */
    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request, CustomerInfoSearchVO customerInfoSearchVO) {
//        setBtnAutho(request, "CustomerInfo");
        ModelAndView mv = new ModelAndView();
        int count = customerInfoService.count(customerInfoSearchVO);
        int pageIndex = WebUtil.getSafeInt(request.getParameter("pageIndex"), 1);// 获取当前页数
        int pageSize = GlobalConst.pageSize;// 直接取全局变量，每页记录数

        String url = createUrl(customerInfoSearchVO, pageIndex, pageSize);
        PageNavigate pageNavigate = new PageNavigate(url, pageIndex, pageSize, count);//

        List<CustomerInfo> customerInfoList = customerInfoService.search(customerInfoSearchVO, pageIndex, pageSize);
        mv.addObject("customerInfoList", customerInfoList);
        mv.addObject("pageNavigate", pageNavigate);
        mv.addObject("backUrl", StringUtil.encodeUrl(url));
        mv.setViewName("/customer/customerInfo");

        return mv;
    }

    private String createUrl(CustomerInfoSearchVO customerInfoSearchVO, int pageIndex, int pageSize) {
        String url = pubConfig.getDynamicServer() + "/customer/customerInfo/index.htm?";
        if (StringUtil.isNotNullOrEmpty(customerInfoSearchVO.getName())) {
            url += " &name=" + customerInfoSearchVO.getName();
        }
        return url;
    }

    @RequestMapping("/toAdd")
    public ModelAndView toAdd(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("/customer/customerInfoAdd");

        BackUrlUtil.setBackUrl(mv, request);
        return mv;
    }

    @RequestMapping("/add")
    public String add(CustomerInfo customerInfo, HttpServletRequest request) {
        customerInfo.setCreate_person(SessionUtil.getUserSession(request).getRealname());
        int flag = customerInfoService.add(customerInfo);
        if (flag == 0)
            return "forward:/error.htm?msg=" + StringUtil.encodeUrl("客户信息新增失败");
        else
            return "forward:/success.htm?msg=" + StringUtil.encodeUrl("客户信息新增成功");
    }

    @RequestMapping("/toUpdate")
    public ModelAndView toUpdate(HttpServletRequest request, int id) {
        ModelAndView mv = new ModelAndView("/customer/customerInfoUpdate");

        CustomerInfo customerInfo = customerInfoService.get(id);
        mv.addObject("customerInfo", customerInfo);

        BackUrlUtil.setBackUrl(mv, request);
        return mv;
    }

    @RequestMapping("/update")
    public String update(CustomerInfo customerInfo) {
        int flag = customerInfoService.update(customerInfo);
        if (flag == 0)
            return "forward:/error.htm?msg=" + StringUtil.encodeUrl("客户信息修改失败");
        else
            return "forward:/success.htm?msg=" + StringUtil.encodeUrl("客户信息修改成功");
    }



    @RequestMapping("/delete")
    public String delete(int id) {
        int flag = customerInfoService.delete(id);
        if (flag == 0)
            return "forward:/error.htm?msg=" + StringUtil.encodeUrl("客户信息删除失败");
        else
            return "forward:/success.htm?msg=" + StringUtil.encodeUrl("客户信息删除成功");
    }




}
