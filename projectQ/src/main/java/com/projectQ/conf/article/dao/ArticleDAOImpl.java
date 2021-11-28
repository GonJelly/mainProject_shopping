package com.projectQ.conf.article.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.projectQ.conf.article.vo.ArticleVO;

@Repository("articleDAO")
public class ArticleDAOImpl implements ArticleDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<ArticleVO> selectsiderArticle() throws DataAccessException {
		List<ArticleVO> siderArticleList = (ArrayList)sqlSession.selectList("mapper.article.selectSider");
		return siderArticleList;
	}

	@Override
	public List<ArticleVO> selectAllArticle(String article_sort) throws DataAccessException {
		List<ArticleVO> AllArticleList = (ArrayList) sqlSession.selectList("mapper.article.selectAllarticle",article_sort);
		return AllArticleList;
	}

	@Override
	public ArticleVO selectArticleDetail(int article_id) throws DataAccessException {
		ArticleVO detailList = (ArticleVO) sqlSession.selectOne("mapper.article.selectArticleDetail",article_id);
		return detailList;
	}

	@Override
	public void insertNewarticle(ArticleVO articleVO) throws DataAccessException {
		sqlSession.insert("mapper.article.insertNewArticle",articleVO);
		
	}

	@Override
	public void deleteArticle(int article_id) throws DataAccessException {
		sqlSession.delete("mapper.article.deleteArticle",article_id);
		
	}

}
