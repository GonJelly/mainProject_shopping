package com.projectQ.conf.goods.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.projectQ.conf.goods.vo.GoodsVO;

@Repository("goodsDAO")
public class GoodsDAOImpl implements GoodsDAO{

	@Autowired
	SqlSession sqlSession;
		
	@Override
	public List<GoodsVO> selectGoodsList(String goods) throws DataAccessException {
		
		List<GoodsVO> goodsList = sqlSession.selectList("mapper.goods.selectGoodsList",goods);
		
		return goodsList;
	}

}
