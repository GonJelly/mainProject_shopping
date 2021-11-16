package com.projectQ.conf.goods.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.projectQ.conf.goods.vo.GoodsVO;
import com.projectQ.conf.goods.vo.ImageFileVO;

public interface GoodsDAO {
	
	public List<GoodsVO> selectGoodsList(String goods) throws DataAccessException;
	public GoodsVO selectGoodsDetail(String goods_id) throws DataAccessException;
	public List<ImageFileVO> selectGoodsImage(String goods_id) throws DataAccessException;
	public List<String> selectKeyword(String keyword) throws DataAccessException;
	public List<GoodsVO> selectGoodsSearch(String searchWord) throws DataAccessException;
	
}
