package com.projectQ.conf.goods.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.projectQ.conf.article.vo.ArticleVO;
import com.projectQ.conf.goods.dao.GoodsDAO;
import com.projectQ.conf.goods.vo.GoodsVO;
import com.projectQ.conf.goods.vo.ImageFileVO;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService{

	@Autowired
	GoodsDAO goodsDAO;
	
	@Override
	public Map<String,List<GoodsVO>> goodsList() throws DataAccessException {
		
		Map<String,List<GoodsVO>> goodsMap = new HashMap<String,List<GoodsVO>>();
		
		List<GoodsVO> goodsList = new ArrayList<GoodsVO>();
		goodsList = goodsDAO.selectGoodsList("top");
		goodsMap.put("top",goodsList);
		
		goodsList = goodsDAO.selectGoodsList("pants");
		goodsMap.put("pants",goodsList);
		
		goodsList = goodsDAO.selectGoodsList("shoes");
		goodsMap.put("shoes",goodsList);
		
		return goodsMap;
	}

	@Override
	public Map goodsDetailList(String goods_id) throws DataAccessException {
		
		Map goodsMap = new HashMap();
		
		GoodsVO goodsVO = goodsDAO.selectGoodsDetail(goods_id);
		goodsMap.put("goodsVO", goodsVO);
		
		List<ImageFileVO> imageList = goodsDAO.selectGoodsImage(goods_id);
		goodsMap.put("imageList",imageList);
		
		List<ArticleVO> articleList = goodsDAO.selectGoodsArticle(goods_id);
		goodsMap.put("articleList", articleList);
		
		return goodsMap;
	}

	@Override
	public List<String> keywordSearch(String keyword) throws DataAccessException {
		
		List<String> keywordList = goodsDAO.selectKeyword(keyword);
		
		return keywordList;
	}

	@Override
	public List<GoodsVO> goodsSearch(String searchWord) throws DataAccessException {
		
		List<GoodsVO> goodsList = goodsDAO.selectGoodsSearch(searchWord);
		
		return goodsList;
	}

	@Override
	public List<GoodsVO> searchSortGoods(String goods_sort) throws DataAccessException {
		
		List<GoodsVO> SearchSortGoods = goodsDAO.selectSortGoods(goods_sort);
		
		return SearchSortGoods;
	}
}
