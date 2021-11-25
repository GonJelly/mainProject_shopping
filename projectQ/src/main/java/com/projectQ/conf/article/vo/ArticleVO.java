package com.projectQ.conf.article.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("articleVO")
public class ArticleVO {
	
	private int article_id;
	private String article_title;
	private String article_intro;
	private String article_sort;
	private String member_id;
	private int goods_id;
	private String goods_title;
	private Date article_creDate;
	
	public int getArticle_id() {
		return article_id;
	}
	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public String getArticle_intro() {
		return article_intro;
	}
	public void setArticle_intro(String article_intro) {
		this.article_intro = article_intro;
	}
	public Date getArticle_creDate() {
		return article_creDate;
	}
	public void setArticle_creDate(Date article_creDate) {
		this.article_creDate = article_creDate;
	}
	public String getGoods_title() {
		return goods_title;
	}
	public void setGoods_title(String goods_title) {
		this.goods_title = goods_title;
	}
	public String getArticle_title() {
		return article_title;
	}
	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}
	public String getArticle_sort() {
		return article_sort;
	}
	public void setArticle_sort(String article_sort) {
		this.article_sort = article_sort;
	}
	
	
	
	
	

}
