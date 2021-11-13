package com.projectQ.conf.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDAO {
    @Autowired
    private SqlSession SqlSession;
    
    public List<TestVO> getTestValue(TestVO testVO){
          return SqlSession.selectList("com.hee.heechart.getTestValue", testVO);
    }

}
