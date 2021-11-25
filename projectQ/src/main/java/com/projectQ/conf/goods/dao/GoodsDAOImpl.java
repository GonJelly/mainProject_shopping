package com.projectQ.conf.goods.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.projectQ.conf.article.vo.ArticleVO;
import com.projectQ.conf.goods.vo.GoodsVO;
import com.projectQ.conf.goods.vo.ImageFileVO;

@Repository("goodsDAO")
public class GoodsDAOImpl implements GoodsDAO{

	@Autowired
	SqlSession sqlSession;
		
	@Override
	public List<GoodsVO> selectGoodsList(String goods) throws DataAccessException {
		
		List<GoodsVO> goodsList = sqlSession.selectList("mapper.goods.selectGoodsList",goods);
		
		return goodsList;
	}

	@Override
	public GoodsVO selectGoodsDetail(String goods_id) throws DataAccessException {
		
		GoodsVO goodsVO = sqlSession.selectOne("mapper.goods.selectGoodsDetail",goods_id);
		
		return goodsVO;
	}

	@Override
	public List<ImageFileVO> selectGoodsImage(String goods_id) throws DataAccessException {
		
		List<ImageFileVO> imageList = (ArrayList) sqlSession.selectList("mapper.goods.selectGoodsImage",goods_id);
		
		return imageList;
	}

	@Override
	public List<String> selectKeyword(String keyword) throws DataAccessException {
		
		List<String> keywordList = (ArrayList)sqlSession.selectList("mapper.goods.selectKeyword",keyword);
		
		return keywordList;
	}

	@Override
	public List<GoodsVO> selectGoodsSearch(String searchWord) throws DataAccessException {
		
		List<GoodsVO> goodsList = (ArrayList) sqlSession.selectList("mapper.goods.selectGoodsSearch",searchWord);
		
		return goodsList;
	}

	@Override
	public List<ArticleVO> selectGoodsArticle(String goods_id) throws DataAccessException {
		List<ArticleVO> articleList = sqlSession.selectList("mapper.goods.selectGoodsArticle",goods_id);
		
		return articleList;
	}
	
	

}
