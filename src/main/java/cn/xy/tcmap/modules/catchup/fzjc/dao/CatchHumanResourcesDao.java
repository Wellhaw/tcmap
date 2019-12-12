/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package cn.xy.tcmap.modules.catchup.fzjc.dao;

import cn.xy.tcmap.common.persistence.CrudDao;
import cn.xy.tcmap.common.persistence.annotation.MyBatisDao;
import cn.xy.tcmap.modules.catchup.fzjc.entity.CatchHumanResources;

/**
 * 人力资源统计DAO接口
 * @author liuyang
 * @version 2018-05-29
 */
@MyBatisDao
public interface CatchHumanResourcesDao extends CrudDao<CatchHumanResources> {
	
}