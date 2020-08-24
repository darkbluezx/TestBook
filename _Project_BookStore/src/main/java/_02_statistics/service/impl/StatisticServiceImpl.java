package _02_statistics.service.impl;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_statistics.dao.StatisticsDao;
import _02_statistics.model.StatisticFormatBean;
import _02_statistics.service.StatisticService;
import _09_Book.model.BookBean;
import _09_Book.service.BookService;

@Service
public class StatisticServiceImpl implements StatisticService{

	@Autowired
	BookService bservice;
	
	@Autowired
	StatisticsDao stdao;
	
	@Transactional
	@Override
	public StatisticFormatBean singleItemTotalByMonth(Integer itemId, LocalDate selectMonth) {
		StatisticFormatBean sfb = null;
//		BookBean bb = bservice.getBookById(itemId);
//		Integer bookId = bb.getBookId();
		sfb = stdao.singleItemTotalByMonth(itemId, selectMonth);
		return sfb;
	}

	@Transactional
	@Override
	public List<StatisticFormatBean> multiItemTotalByMonth(Integer itemId, LocalDate selectMonth) {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional
	@Override
	public StatisticFormatBean singleItemTotalByYear(Integer itemId, LocalDate selectYear) {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional
	@Override
	public List<StatisticFormatBean> multiItemTotalByYear(Integer itemId, LocalDate selectYear) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Transactional
	@Override
	public List<StatisticFormatBean> top10ItemTotalByMonth(LocalDate selectTime) {
		List<StatisticFormatBean> sfb = null;
		sfb = stdao.top10ItemTotalByMonth(selectTime);
		return sfb;
	}

}
