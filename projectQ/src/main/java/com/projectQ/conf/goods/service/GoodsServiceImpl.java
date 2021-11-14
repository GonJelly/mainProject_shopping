package com.projectQ.conf.goods.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.projectQ.conf.goods.dao.GoodsDAO;
import com.projectQ.conf.goods.vo.GoodsVO;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService{

	@Autowired
	GoodsDAO goodsDAO;
	
	@Override
	public Map<String,List<GoodsVO>> goodsList() throws DataAccessException {
		
		Map<String,List<GoodsVO>> goodsMap = new HashMap<String,List<GoodsVO>>();
		
		List<GoodsVO> goodsList = new ArrayList<GoodsVO>();
		goodsList = goodsDAO.selectGoodsList("bigsize");
		goodsMap.put("bigsize",goodsList);
		
		goodsList = goodsDAO.selectGoodsList("top");
		goodsMap.put("top",goodsList);
		
		goodsList = goodsDAO.selectGoodsList("shoes");
		goodsMap.put("shoes",goodsList);
		
		return goodsMap;
	}

}
