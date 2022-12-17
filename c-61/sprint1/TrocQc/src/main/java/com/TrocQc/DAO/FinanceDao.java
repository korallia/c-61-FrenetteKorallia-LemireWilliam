package com.TrocQc.DAO;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;

import com.TrocQc.Entity.Vente;
import com.TrocQc.Utils.DatePoint;
import com.TrocQc.Utils.LinkedList;
import com.TrocQc.Utils.Point;
import com.TrocQc.config.SpringJdbcConfig;

public class FinanceDao extends SpringJdbcConfig {

	public FinanceDao() {
		// TODO Auto-generated constructor stub
	}
	
	public List<Vente> GetAllVentes(){
		
		Map<String, String> params = new HashMap<>();
		List<Vente> ventes = namedParameterJdbcTemplate().query("select * from vente ORDER BY id", params,
				BeanPropertyRowMapper.newInstance(Vente.class)); 
		return ventes; 
		
		
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
	
	public LinkedList<Point> GetDailySalesOfPeriod(Date start, Date end){
		try {

			MapSqlParameterSource params = new MapSqlParameterSource();
			params.addValue("start", start.toString());
			params.addValue("end", end.toString());
			
			// +1 since we want to count the first day as day #1
			List<Point> points = namedParameterJdbcTemplate().query("select (DATEDIFF(ventedate, :start)+1) x, sum(montant) y  from vente WHERE ventedate>=:start AND ventedate<=:end  group by DATE(ventedate)  ORDER BY ventedate", params,
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

	public LinkedList<DatePoint> GetDailySalesOfPeriodByDay(Date start, Date end){
		try {

			MapSqlParameterSource params = new MapSqlParameterSource();
			params.addValue("start", start.toString());
			params.addValue("end", end.toString());
			
			// +1 since we want to count the first day as day #1
			List<DatePoint> points = namedParameterJdbcTemplate().query("select ventedate date, sum(montant) value  from vente WHERE ventedate>=:start AND ventedate<=:end  group by DATE(ventedate)  ORDER BY ventedate", params,
					BeanPropertyRowMapper.newInstance(DatePoint.class));

			
			LinkedList<DatePoint> ll = new LinkedList<>();
			for(int i = 0; i<points.size(); i++) {
				ll.add(points.get(i));
			}
			return ll;

		} catch (Exception e) {
			return null;
		}
	}

}
