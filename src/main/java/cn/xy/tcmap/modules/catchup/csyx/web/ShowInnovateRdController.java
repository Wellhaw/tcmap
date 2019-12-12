/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package cn.xy.tcmap.modules.catchup.csyx.web;

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
import cn.xy.tcmap.modules.catchup.csyx.entity.ShowInnovateRd;
import cn.xy.tcmap.modules.catchup.csyx.service.ShowInnovateRdService;

import java.util.List;

/**
 * 经济rd变化Controller
 * @author wufan
 * @version 2019-07-31
 */
@Controller
@RequestMapping(value = "${adminPath}/csyx/showInnovateRd")
public class ShowInnovateRdController extends BaseController {

	@Autowired
	private ShowInnovateRdService showInnovateRdService;
	
	@ModelAttribute
	public ShowInnovateRd get(@RequestParam(required=false) String id) {
		ShowInnovateRd entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = showInnovateRdService.get(id);
		}
		if (entity == null){
			entity = new ShowInnovateRd();
		}
		return entity;
	}
	
	@RequiresPermissions("csyx:showInnovateRd:view")
	@RequestMapping(value = {"list", ""})
	public String list(ShowInnovateRd showInnovateRd, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ShowInnovateRd> page = showInnovateRdService.findPage(new Page<ShowInnovateRd>(request, response), showInnovateRd); 
		model.addAttribute("page", page);
		return "catchup/csyx/showInnovateRdList";
	}

	@RequiresPermissions("csyx:showInnovateRd:view")
	@RequestMapping(value = "form")
	public String form(ShowInnovateRd showInnovateRd, Model model) {
		model.addAttribute("showInnovateRd", showInnovateRd);
		return "catchup/csyx/showInnovateRdForm";
	}

	@RequiresPermissions("csyx:showInnovateRd:edit")
	@RequestMapping(value = "save")
	public String save(ShowInnovateRd showInnovateRd, Model model, RedirectAttributes redirectAttributes) {
		try{
			if (!beanValidator(model, showInnovateRd)){
				return form(showInnovateRd, model);
			}
			if(showInnovateRd.getIsNewRecord()){
				ShowInnovateRd condition = new ShowInnovateRd();
				condition.setYear(showInnovateRd.getYear());
				condition.setMonth(showInnovateRd.getMonth());
				List<ShowInnovateRd> list = showInnovateRdService.findList(condition);
				if(list != null && list.size()>0){
					throw new Exception("数据重复");
				}
			}
			showInnovateRdService.save(showInnovateRd);
			addMessage(redirectAttributes, "保存经济rd变化成功");
		}catch (Exception e){
			addMessage(redirectAttributes, "保存经济rd变化失败，原因："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/csyx/showInnovateRd/?repage";
	}
	
	@RequiresPermissions("csyx:showInnovateRd:edit")
	@RequestMapping(value = "delete")
	public String delete(ShowInnovateRd showInnovateRd, RedirectAttributes redirectAttributes) {
		showInnovateRdService.delete(showInnovateRd);
		addMessage(redirectAttributes, "删除经济rd变化成功");
		return "redirect:"+Global.getAdminPath()+"/csyx/showInnovateRd/?repage";
	}

}