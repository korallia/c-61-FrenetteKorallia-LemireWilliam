package com.TrocQc.DAO;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;

import com.TrocQc.Entity.Lot;
import com.TrocQc.Entity.Product;
import com.TrocQc.Entity.Vente;
import com.TrocQc.Utils.DatePoint;
import com.TrocQc.Utils.LinkedList;
import com.TrocQc.Utils.Point;
import com.TrocQc.config.SpringJdbcConfig;

public class FinanceDao extends SpringJdbcConfig {

	private int userId;

	public FinanceDao(int UserId) {
		this.userId = UserId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public List<Vente> GetAllVentes() {

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("userid", this.userId);

		List<Vente> ventes = namedParameterJdbcTemplate().query("select * from vente WHERE userid=:userid ORDER BY id",
				params, BeanPropertyRowMapper.newInstance(Vente.class));
		return ventes;

	}

	public LinkedList<Point> GetDailySales() {
		try {

			MapSqlParameterSource params = new MapSqlParameterSource();
			params.addValue("userid", this.userId);

			// +1 since we want to count the first day as day #1
			List<Point> points = namedParameterJdbcTemplate().query(
					"select (DATEDIFF(ventedate, (SELECT min(ventedate)  from vente) )+1) x, sum(montant) y  from vente WHERE userid=:userid GROUP BY DATE(ventedate) ORDER BY ventedate",
					params, BeanPropertyRowMapper.newInstance(Point.class));

			LinkedList<Point> ll = new LinkedList<Point>();
			for (int i = 0; i < points.size(); i++) {
				ll.add(points.get(i));
			}
			return ll;

		} catch (Exception e) {
			return null;
		}
	}

	public LinkedList<Point> GetDailySalesOfPeriod(Date start, Date end) {
		try {

			MapSqlParameterSource params = new MapSqlParameterSource();
			params.addValue("start", start.toString());
			params.addValue("end", end.toString());
			params.addValue("userid", this.userId);

			// +1 since we want to count the first day as day #1
			List<Point> points = namedParameterJdbcTemplate().query(
					"select (DATEDIFF(ventedate, :start)+1) x, sum(montant) y  from vente WHERE userid=:userid AND ventedate>=:start AND ventedate<=:end  group by DATE(ventedate)  ORDER BY ventedate",
					params, BeanPropertyRowMapper.newInstance(Point.class));

			LinkedList<Point> ll = new LinkedList<Point>();
			for (int i = 0; i < points.size(); i++) {
				ll.add(points.get(i));
			}
			return ll;

		} catch (Exception e) {
			return null;
		}
	}

	public LinkedList<DatePoint> GetDailySalesOfPeriodByDay(Date start, Date end) {
		try {

			MapSqlParameterSource params = new MapSqlParameterSource();
			params.addValue("start", start.toString());
			params.addValue("end", end.toString());
			params.addValue("userid", this.userId);

			List<DatePoint> points = namedParameterJdbcTemplate().query(
					"select ventedate date, sum(montant) value  from vente WHERE userid=:userid AND ventedate>=:start AND ventedate<=:end  group by DATE(ventedate) ",
					params, BeanPropertyRowMapper.newInstance(DatePoint.class));

			LinkedList<DatePoint> ll = new LinkedList<>();
			for (int i = 0; i < points.size(); i++) {
				ll.add(points.get(i));
			}
			return ll;

		} catch (Exception e) {
			return null;
		}
	}
	
	public double GetProductCosts(Date start, Date end) {
		try {

			InventoryDao invdao = new InventoryDao();
			MapSqlParameterSource params = new MapSqlParameterSource();
			params.addValue("start", start.toString());
			params.addValue("end", end.toString());
			params.addValue("userid", this.userId);

			List<Lot> lots = namedParameterJdbcTemplate().query(
					"select *  from lot WHERE productid IN (SELECT id FROM product WHERE userid=:userid) AND addeddate>=:start AND addeddate<=:end",
					params, BeanPropertyRowMapper.newInstance(Lot.class));

			
			double cost = 0;
			for( int i = 0; i< lots.size(); i++) {
				Product p = invdao.getProduct(lots.get(i).getProductid());
				
				cost += p.getCost() * lots.get(i).getOriginalquantity();
			}
			
			return cost;
			
		} catch (Exception e) {
			return 0;
		}
	}

	public double GetRawMaterialCosts(Date start, Date end) {
		try {

			InventoryDao invdao = new InventoryDao();
			MapSqlParameterSource params = new MapSqlParameterSource();
			params.addValue("start", start.toString());
			params.addValue("end", end.toString());
			params.addValue("userid", this.userId);

			List<Lot> lots = namedParameterJdbcTemplate().query(
					"select *  from lot WHERE productid IN (SELECT id FROM product WHERE userid=:userid) AND addeddate>=:start AND addeddate<=:end",
					params, BeanPropertyRowMapper.newInstance(Lot.class));

			
			double cost = 0;
			for( int i = 0; i< lots.size(); i++) {
				Product p = invdao.getProduct(lots.get(i).getProductid());
				
				// the raw material cost is the full cost minus the product costs
				cost += (p.getFullCost() - p.getCost() ) * lots.get(i).getOriginalquantity();
			}
			
			return cost;
			
		} catch (Exception e) {
			return 0;
		}
	}
	
	public double GetTotalSalesOfPeriod(Date start, Date end) {
		try {

			MapSqlParameterSource params = new MapSqlParameterSource();
			params.addValue("start", start.toString());
			params.addValue("end", end.toString());
			params.addValue("userid", this.userId);

			double sales = namedParameterJdbcTemplate().queryForObject(
					"select sum(montant) value  from vente WHERE userid=:userid AND ventedate>=:start AND ventedate<=:end", 
					params, Double.class);

			
			return sales;

		} catch (Exception e) {
			return 0;
		}
	}

	
}
