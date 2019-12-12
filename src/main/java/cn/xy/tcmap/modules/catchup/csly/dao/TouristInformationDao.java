/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package cn.xy.tcmap.modules.catchup.csly.dao;

import cn.xy.tcmap.common.persistence.CrudDao;
import cn.xy.tcmap.common.persistence.annotation.MyBatisDao;
import cn.xy.tcmap.modules.catchup.csly.entity.TouristInformation;

/**
 * 景区资讯排行DAO接口
 * @author wufan
 * @version 2019-10-23
 */
@MyBatisDao
public interface TouristInformationDao extends CrudDao<TouristInformation> {
	
}