package _05_loginSystem.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _05_loginSystem.dao.MonthDao;
import _05_loginSystem.model.Month;
import _05_loginSystem.service.MonthService;


@Service
@Transactional
public class MonthServiceImpl implements MonthService{
	@Autowired
	MonthDao Dao;
	
	@Override
	public List<Month> getAllMonth() {
		return Dao.getAllMonth();
	}

	@Override
	public Month getMonth(Integer id) {
		return Dao.getMonth(id);
	}
}
