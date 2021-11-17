package com.projectQ.conf.goods.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class GoodsVO {
	
	private int goods_id;
	private String goods_sort;
	private String goods_title;
	private String goods_publisher;
	private int goods_price;
	private int goods_sales_price;
	private int goods_point;
	private Date goods_published_date;
	private String goods_color;
	private int goods_delivery_price;
	private Date goods_delivery_date;
	private String goods_status;
	private String goods_intro;
	private Date goods_creDate;
	private String goods_fileName;

	public int getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}

	public String getGoods_sort() {
		return goods_sort;
	}

	public void setGoods_sort(String goods_sort) {
		this.goods_sort = goods_sort;
	}

	public String getGoods_title() {
		return goods_title;
	}

	public void setGoods_title(String goods_title) {
		this.goods_title = goods_title;
	}

	public String getGoods_publisher() {
		return goods_publisher;
	}

	public void setGoods_publisher(String goods_publisher) {
		this.goods_publisher = goods_publisher;
	}

	public int getGoods_price() {
		return goods_price;
	}

	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}

	public int getGoods_sales_price() {
		return goods_sales_price;
	}

	public void setGoods_sales_price(int goods_sales_price) {
		this.goods_sales_price = goods_sales_price;
	}

	public int getGoods_point() {
		return goods_point;
	}

	public void setGoods_point(int goods_point) {
		this.goods_point = goods_point;
	}

	public Date getGoods_published_date() {
		return goods_published_date;
	}

	public void setGoods_published_date(Date goods_published_date) {
		this.goods_published_date = goods_published_date;
	}

	public String getGoods_color() {
		return goods_color;
	}

	public void setGoods_color(String goods_color) {
		this.goods_color = goods_color;
	}

	public int getGoods_delivery_price() {
		return goods_delivery_price;
	}

	public void setGoods_delivery_price(int goods_delivery_price) {
		this.goods_delivery_price = goods_delivery_price;
	}

	public Date getGoods_delivery_date() {
		return goods_delivery_date;
	}

	public void setGoods_delivery_date(Date goods_delivery_date) {
		this.goods_delivery_date = goods_delivery_date;
	}

	public String getGoods_status() {
		return goods_status;
	}

	public void setGoods_status(String goods_status) {
		this.goods_status = goods_status;
	}

	public String getGoods_intro() {
		return goods_intro;
	}

	public void setGoods_intro(String goods_intro) {
		this.goods_intro = goods_intro;
	}

	public Date getGoods_credate() {
		return goods_creDate;
	}

	public void setGoods_credate(Date goods_creDate) {
		this.goods_creDate = goods_creDate;
	}

	public String getGoods_fileName() {
		return goods_fileName;
	}

	public void setGoods_fileName(String goods_fileName) {
		this.goods_fileName = goods_fileName;
	}
	
	
	
}
