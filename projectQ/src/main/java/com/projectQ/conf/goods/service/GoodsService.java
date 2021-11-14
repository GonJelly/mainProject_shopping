package com.projectQ.conf.goods.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface GoodsService {
	
	public Map goodsList() throws DataAccessException;
	
}
