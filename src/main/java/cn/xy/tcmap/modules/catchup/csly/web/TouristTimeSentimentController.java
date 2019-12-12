/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package cn.xy.tcmap.modules.catchup.csly.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.xy.tcmap.common.config.Global;
import cn.xy.tcmap.common.persistence.Page;
import cn.xy.tcmap.common.web.BaseController;
import cn.xy.tcmap.common.utils.StringUtils;
import cn.xy.tcmap.modules.catchup.csly.entity.TouristTimeSentiment;
import cn.xy.tcmap.modules.catchup.csly.service.TouristTimeSentimentService;

/**
 * 实时预警舆情Controller
 * @author wufan
 * @version 2019-08-19
 */
@Controller
@RequestMapping(value = "${adminPath}/csly/touristTimeSentiment")
public class TouristTimeSentimentController extends BaseController {

	@Autowired
	private TouristTimeSentimentService touristTimeSentimentService;
	
	@ModelAttribute
	public TouristTimeSentiment get(@RequestParam(required=false) String id) {
		TouristTimeSentiment entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = touristTimeSentimentService.get(id);
		}
		if (entity == null){
			entity = new TouristTimeSentiment();
		}
		return entity;
	}
	
	@RequiresPermissions("csly:touristTimeSentiment:view")
	@RequestMapping(value = {"list", ""})
	public String list(TouristTimeSentiment touristTimeSentiment, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TouristTimeSentiment> page = touristTimeSentimentService.findPage(new Page<TouristTimeSentiment>(request, response), touristTimeSentiment); 
		model.addAttribute("page", page);
		return "catchup/csly/touristTimeSentimentList";
	}

	@RequiresPermissions("csly:touristTimeSentiment:view")
	@RequestMapping(value = "form")
	public String form(TouristTimeSentiment touristTimeSentiment, Model model) {
		model.addAttribute("touristTimeSentiment", touristTimeSentiment);
		return "catchup/csly/touristTimeSentimentForm";
	}

	@RequiresPermissions("csly:touristTimeSentiment:edit")
	@RequestMapping(value = "save")
	public String save(TouristTimeSentiment touristTimeSentiment, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, touristTimeSentiment)){
			return form(touristTimeSentiment, model);
		}
		touristTimeSentimentService.save(touristTimeSentiment);
		addMessage(redirectAttributes, "保存实时预警舆情成功");
		return "redirect:"+Global.getAdminPath()+"/csly/touristTimeSentiment/?repage";
	}
	
	@RequiresPermissions("csly:touristTimeSentiment:edit")
	@RequestMapping(value = "delete")
	public String delete(TouristTimeSentiment touristTimeSentiment, RedirectAttributes redirectAttributes) {
		touristTimeSentimentService.delete(touristTimeSentiment);
		addMessage(redirectAttributes, "删除实时预警舆情成功");
		return "redirect:"+Global.getAdminPath()+"/csly/touristTimeSentiment/?repage";
	}

}