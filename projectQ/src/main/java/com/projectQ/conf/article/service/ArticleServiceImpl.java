package com.projectQ.conf.article.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.projectQ.conf.article.dao.ArticleDAO;
import com.projectQ.conf.article.vo.ArticleVO;

@Service("articleService")
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	ArticleDAO articleDAO;
	
	@Override
	public List<ArticleVO> siderArticle() throws DataAccessException {
		List<ArticleVO> articleList =  articleDAO.selectsiderArticle();
		return articleList;
	}

	@Override
	public Map<String, List<ArticleVO>> FindAllArticle() throws DataAccessException {
		
		Map<String, List<ArticleVO>> articleAllMap = new HashMap<String,List<ArticleVO>>();
		
		List<ArticleVO> articleQnAList = articleDAO.selectAllArticle("QnA");
		articleAllMap.put("QnA", articleQnAList);
		
		List<ArticleVO> articleNoticeList = articleDAO.selectAllArticle("공지사항");
		articleAllMap.put("Notice", articleNoticeList);
		
		List<ArticleVO> articleOneAndOneList = articleDAO.selectAllArticle("1:1문의");
		articleAllMap.put("OneAndOne", articleOneAndOneList);
		
		
		return articleAllMap;
	}

	@Override
	public ArticleVO boardDetailList(int article_id) throws DataAccessException {
		ArticleVO DetailList = articleDAO.selectArticleDetail(article_id);
		return DetailList;
	}

	@Override
	public void addArticle(ArticleVO articleVO) throws DataAccessException {
		articleDAO.insertNewarticle(articleVO);
	}

	@Override
	public void removeArticle(int article_id) throws DataAccessException {
		articleDAO.deleteArticle(article_id);
	}

}
