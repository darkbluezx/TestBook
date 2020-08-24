package _05_loginSystem.service;

import java.util.List;

import _05_loginSystem.model.Month;

public interface MonthService {
	List<Month> getAllMonth();
	Month getMonth(Integer id);
}
