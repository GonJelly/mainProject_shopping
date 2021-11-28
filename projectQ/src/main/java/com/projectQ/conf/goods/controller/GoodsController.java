package com.projectQ.conf.goods.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.projectQ.conf.goods.vo.GoodsVO;

public interface GoodsController {
	
	public ModelAndView goodsList(@RequestParam("goods_sort") String goods_sort,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView goodsDetail(@RequestParam("goods_id") String goods_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody String keywordSearch(@RequestParam("keyword") String keyword,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchGoods(@RequestParam("searchWord") String searchWord,HttpServletRequest request, HttpServletResponse response) throws Exception; 
}
