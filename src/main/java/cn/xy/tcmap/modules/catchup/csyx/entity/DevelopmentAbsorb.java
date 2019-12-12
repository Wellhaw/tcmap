/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package cn.xy.tcmap.modules.catchup.csyx.entity;

import org.hibernate.validator.constraints.Length;

import cn.xy.tcmap.common.persistence.DataEntity;

/**
 * 产业发展潜力内容Entity
 * @author wufan
 * @version 2019-07-31
 */
public class DevelopmentAbsorb extends DataEntity<DevelopmentAbsorb> {
	
	private static final long serialVersionUID = 1L;
	private String item;		// 项目
	private String num;		// 数值
	private String increase;		// 增长
	private String year;		// 年
	private String month;//月
	
	public DevelopmentAbsorb() {
		super();
	}

	public DevelopmentAbsorb(String id){
		super(id);
	}

	@Length(min=0, max=255, message="项目长度必须介于 0 和 255 之间")
	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}
	
	@Length(min=0, max=11, message="数值长度必须介于 0 和 11 之间")
	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}
	
	@Length(min=0, max=255, message="增长长度必须介于 0 和 255 之间")
	public String getIncrease() {
		return increase;
	}

	public void setIncrease(String increase) {
		this.increase = increase;
	}
	
	@Length(min=0, max=255, message="年长度必须介于 0 和 255 之间")
	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	@Length(min=0, max=255, message="年长度必须介于 0 和 255 之间")
	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}
}