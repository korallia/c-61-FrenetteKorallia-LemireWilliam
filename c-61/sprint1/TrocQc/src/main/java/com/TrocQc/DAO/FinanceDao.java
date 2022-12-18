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

	private int UserId;

	public FinanceDao(int UserId) {
		this.UserId = UserId;
	}

	public int getUserId() {
		return UserId;
	}

	public void setUserId(int userId) {
		UserId = userId;
	}

	public List<Vente> GetAllVentes() {

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("userid", this.UserId);

		List<Vente> ventes = namedParameterJdbcTemplate().query("select * from vente WHERE userid=:userid ORDER BY id",
				params, BeanPropertyRowMapper.newInstance(Vente.class));
		return ventes;

	}

	public LinkedList<Point> GetDailySales() {
		try {

			MapSqlParameterSource params = new MapSqlParameterSource();
			params.addValue("userid", this.UserId);

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
			params.addValue("userid", this.UserId);

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
			params.addValue("userid", this.UserId);

			// +1 since we want to count the first day as day #1
			List<DatePoint> points = namedParameterJdbcTemplate().query(
					"select ventedate date, sum(montant) value  from vente WHERE userid=:userid AND ventedate>=:start AND ventedate<=:end  group by DATE(ventedate)  ORDER BY ventedate",
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

}
