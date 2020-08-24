package _05_loginSystem.dao;

import java.util.List;

import _05_loginSystem.model.Month;

public interface MonthDao {
	List<Month> getAllMonth();
	Month getMonth(Integer id);
}
