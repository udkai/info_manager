package com.balance.customer.dao;

import com.balance.customer.VO.CustomerInfoSearchVO;
import com.balance.customer.model.CustomerInfo;
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
public class CustomerInfoDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/**
	 * 查询
	 *
	 * @param customerInfoSearchVO 查询条件
	 * @return 客户信息列表
	 */
	public List<CustomerInfo> search(CustomerInfoSearchVO customerInfoSearchVO, int pageIndex, int pageSize) {
		String sql = "select * from t_customer_info ";
		sql += createSql(customerInfoSearchVO);
		sql = PageUtil.createMysqlPageSql(sql, pageIndex, pageSize);
		SqlParameterSource params = new BeanPropertySqlParameterSource(customerInfoSearchVO);
		NamedParameterJdbcTemplate namedJdbc = new NamedParameterJdbcTemplate(jdbcTemplate);
		return namedJdbc.query(sql, params, new BeanPropertyRowMapper<>(CustomerInfo.class));
	}

	/**
	 * 统计查询数
	 *
	 * @param customerInfoSearchVO 查询条件 姓名
	 * @return 数目
	 */
	public int count(CustomerInfoSearchVO customerInfoSearchVO) {
		String sql = "select count(*) from t_customer_info ";
		sql += createSql(customerInfoSearchVO);
		SqlParameterSource params = new BeanPropertySqlParameterSource(customerInfoSearchVO);
		NamedParameterJdbcTemplate namedJdbc = new NamedParameterJdbcTemplate(jdbcTemplate);
		return namedJdbc.queryForObject(sql, params, Integer.class);
	}

	private String createSql(CustomerInfoSearchVO customerInfoSearchVO) {
		String sql = " where 1=1";
		if (StringUtil.isNotNullOrEmpty(customerInfoSearchVO.getName())) {
			sql += " and name like :name_param";
		}
		return sql;
	}

	/**
	 * 新增
	 *
	 * @param customerInfo 客户信息
	 * @return 成功1  失败0
	 */
	public int add(CustomerInfo customerInfo) {
		NamedParameterJdbcTemplate namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(jdbcTemplate);
		String sql = "INSERT INTO t_customer_info(id,name,address, tel,create_person, create_at)  "
				+ " VALUES(:id,:name,:address, :tel,:create_person, now()) ";
		SqlParameterSource paramSource = new BeanPropertySqlParameterSource(customerInfo);
		return namedParameterJdbcTemplate.update(sql, paramSource);
	}

	/**
	 * 修改
	 *
	 * @param customerInfo 客户信息
	 * @return 成功1 失败0
	 */
	public int update(CustomerInfo customerInfo) {
		String sql = "UPDATE t_customer_info SET name=:name,address=:address, tel=:tel WHERE id=:id";
		NamedParameterJdbcTemplate namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(jdbcTemplate);
		SqlParameterSource paramSource = new BeanPropertySqlParameterSource(customerInfo);
		return namedParameterJdbcTemplate.update(sql, paramSource);
	}


	public int delete(int id) {
		String sql = "DELETE  FROM t_customer_info WHERE id=?  ";
		return jdbcTemplate.update(sql, id);
	}
	public CustomerInfo getById(int id){
		String sql="select * from t_customer_info WHERE id=?";
		List<CustomerInfo> list = jdbcTemplate.query(sql, new Object[] { id }, BeanPropertyRowMapper.newInstance(CustomerInfo.class));
		return list.size() > 0 ? list.get(0) : null;

	}

}
