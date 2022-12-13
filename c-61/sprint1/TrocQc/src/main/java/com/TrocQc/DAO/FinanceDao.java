package com.TrocQc.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;

import com.TrocQc.Entity.Product;
import com.TrocQc.Utils.LinkedList;
import com.TrocQc.Utils.Point;
import com.TrocQc.config.SpringJdbcConfig;

public class FinanceDao extends SpringJdbcConfig {

	public FinanceDao() {
		// TODO Auto-generated constructor stub
	}
	
	public LinkedList<Point> GetDailySales(){
		try {

			Map<String, String> params = new HashMap<>();
			// +1 since we want to count the first day as day #1
			List<Point> points = namedParameterJdbcTemplate().query("select (DATEDIFF(ventedate, (SELECT min(ventedate)  from vente) )+1) x, sum(montant) y  from vente group by DATE(ventedate) ORDER BY ventedate", params,
					BeanPropertyRowMapper.newInstance(Point.class));

			
			LinkedList<Point> ll = new LinkedList<Point>();
			for(int i = 0; i<points.size(); i++) {
				ll.add(points.get(i));
			}
			return ll;

		} catch (Exception e) {
			return null;
		}
	}

}
