package com.TrocQc.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import com.TrocQc.config.SpringJdbcConfig;

public class CongifDao extends SpringJdbcConfig {

	public CongifDao() {
		// TODO Auto-generated constructor stub
	}
	
	
	public ArrayList<String> getSkuByUserId(int userID) {
		String sql = "SELECT  skupattern FROM usersku where userID=:userID";
		Map<String, Object> params = new HashMap<>();
		params.put("userID", userID);
		ArrayList<String> skuPatternList = new ArrayList<String>();
		skuPatternList = (ArrayList<String>)namedParameterJdbcTemplate().query(sql,params, BeanPropertyRowMapper.newInstance(String.class));
		return skuPatternList;
	
	}
	
	
	public int addSkuPattern(int userID,String skupattern) {
		return jdbcTemplate().update(
				"INSERT INTO usersku (userID, skupattern)VALUES (?, ?)", userID,skupattern);
	}
	
	public int modifySkuPattern(int skuPatternID,String skupattern) {
		return jdbcTemplate().update(
					"UPDATE usersku SET skupattern=? WHERE skupatternid=?",skupattern,skuPatternID);
		
	}
		
	
	public int deleteSku(int skuPatternID) {
		return jdbcTemplate().update(
					"DELETE FROM  usersku WHERE skupatternid=?", skuPatternID);
	}
	
}


