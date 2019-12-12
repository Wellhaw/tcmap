/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package cn.xy.tcmap.modules.catchup.csyx.dao;

import cn.xy.tcmap.common.persistence.CrudDao;
import cn.xy.tcmap.common.persistence.annotation.MyBatisDao;
import cn.xy.tcmap.modules.catchup.csyx.entity.LivePovertyReason;

/**
 * 致贫原因DAO接口
 * @author tuo
 * @version 2019-08-14
 */
@MyBatisDao
public interface LivePovertyReasonDao extends CrudDao<LivePovertyReason> {
	
}