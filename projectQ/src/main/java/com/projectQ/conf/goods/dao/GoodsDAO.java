package com.projectQ.conf.goods.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.projectQ.conf.goods.vo.GoodsVO;

public interface GoodsDAO {
	
	public List<GoodsVO> selectGoodsList(String goods) throws DataAccessException;
	
}
