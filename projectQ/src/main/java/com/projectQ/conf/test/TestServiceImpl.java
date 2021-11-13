package com.projectQ.conf.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestServiceImpl implements TestService {

    @Autowired
    TestDAO TestDAO;
    
    @Override
    public List<TestVO> getTestValue(TestVO testVO){
          return TestDAO.getTestValue(testVO);
	}

}
