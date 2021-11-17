package com.projectQ.conf.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.projectQ.conf.goods.vo.GoodsVO;

public interface GoodsService {
	
	public Map goodsList() throws DataAccessException;
	public Map goodsDetailList(String goods_id) throws DataAccessException;
	public List<String> keywordSearch(String keyword) throws DataAccessException;
	public List<GoodsVO> goodsSearch(String searchWord) throws DataAccessException;

}
