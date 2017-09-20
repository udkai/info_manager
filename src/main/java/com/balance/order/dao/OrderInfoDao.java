package com.balance.order.dao;

import com.balance.order.VO.OrderInfoSearchVO;
import com.balance.order.model.OrderInfo;
import com.balance.util.page.PageUtil;
import com.balance.util.string.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by dsy on 2017/9/18.
 * 用户信息表  Dao
 */
@Repository
public class OrderInfoDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/**
	 * 查询
	 *
	 * @param orderInfoSearchVO 查询条件
	 * @return 客户信息列表
	 */
	public List<OrderInfo> search(OrderInfoSearchVO orderInfoSearchVO, int pageIndex, int pageSize) {
		String sql = "select * from t_order_info ";
		sql += createSql(orderInfoSearchVO);
		sql = PageUtil.createMysqlPageSql(sql, pageIndex, pageSize);
		SqlParameterSource params = new BeanPropertySqlParameterSource(orderInfoSearchVO);
		NamedParameterJdbcTemplate namedJdbc = new NamedParameterJdbcTemplate(jdbcTemplate);
		return namedJdbc.query(sql, params, new BeanPropertyRowMapper<>(OrderInfo.class));
	}

	/**
	 * 统计查询数
	 *
	 * @param orderInfoSearchVO 查询条件 姓名
	 * @return 数目
	 */
	public int count(OrderInfoSearchVO orderInfoSearchVO) {
		String sql = "select count(*) from t_order_info ";
		sql += createSql(orderInfoSearchVO);
		SqlParameterSource params = new BeanPropertySqlParameterSource(orderInfoSearchVO);
		NamedParameterJdbcTemplate namedJdbc = new NamedParameterJdbcTemplate(jdbcTemplate);
		return namedJdbc.queryForObject(sql, params, Integer.class);
	}

	private String createSql(OrderInfoSearchVO orderInfoSearchVO) {
		String sql = " where 1=1";
		if (StringUtil.isNotNullOrEmpty(orderInfoSearchVO.getOrder_name())) {
			sql += " and order_name like :order_name_param";
		}
		if (StringUtil.isNotNullOrEmpty(orderInfoSearchVO.getOrder_time_start())) {
			sql += " and order_time > :order_time_start";
		}
		if (StringUtil.isNotNullOrEmpty(orderInfoSearchVO.getOrder_time_end())) {
			sql += " and order_time <= :order_time_end";
		}
		if (StringUtil.isNotNullOrEmpty(orderInfoSearchVO.getStatus())) {
			sql += " and status =:status";
		}


		return sql;
	}

	/**
	 * 新增
	 *
	 * @param orderInfo 客户信息
	 * @return 成功1  失败0
	 */
	public int add(OrderInfo orderInfo) {
		NamedParameterJdbcTemplate namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(jdbcTemplate);
		String sql = "INSERT INTO t_order_info(id,order_name,order_time, amount,status,create_person, create_at)  "
				+ " VALUES(:id,:order_name,str_to_date(:order_time, '%Y-%m-%d'), :amount,:status,:create_person, now()) ";
		SqlParameterSource paramSource = new BeanPropertySqlParameterSource(orderInfo);
		return namedParameterJdbcTemplate.update(sql, paramSource);
	}

	/**
	 * 修改
	 *
	 * @param orderInfo 客户信息
	 * @return 成功1 失败0
	 */
	public int update(OrderInfo orderInfo) {
		String sql = "UPDATE t_order_info SET order_name=:order_name,amount=:amount, order_time=str_to_date(:order_time, '%Y-%m-%d') WHERE id=:id";
		NamedParameterJdbcTemplate namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(jdbcTemplate);
		SqlParameterSource paramSource = new BeanPropertySqlParameterSource(orderInfo);
		return namedParameterJdbcTemplate.update(sql, paramSource);
	}


	public int delete(int id) {
		String sql = "DELETE  FROM t_order_info WHERE id=?  ";
		return jdbcTemplate.update(sql, id);
	}
	public OrderInfo getById(int id){
		String sql="select * from t_order_info WHERE id=?";
		List<OrderInfo> list = jdbcTemplate.query(sql, new Object[] { id }, BeanPropertyRowMapper.newInstance(OrderInfo.class));
		return list.size() > 0 ? list.get(0) : null;

	}

}
