/**
 * 
 */
package com.lw.tpartnerbasicinfo.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.common.util.qrcode.QrcodeUtil;
import com.lw.core.base.action.BaseAction;
import com.lw.tpartnerbasicinfo.entity.TPartnerBasicInfo;
import com.lw.tpartnerbasicinfo.service.ITPartnerBasicInfoService;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:41:52
 */
@Controller("TPartnerBasicInfoAction")
@RequestMapping(value="/manage/tpartnerbasicinfo")
public class TPartnerBasicInfoAction extends BaseAction{
	@Autowired
	private ITPartnerBasicInfoService tPartnerBasicInfoService;
	
	/**
	 * 
	 * @Desc 信息列表
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:43:25
	 */
	@RequestMapping("")
	public String list(){
		instantPage(20);
		List<TPartnerBasicInfo> list=tPartnerBasicInfoService.getList();
		int total=tPartnerBasicInfoService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/tpartnerbasicinfo/tpartnerbasicinfo_list";
	}
	
	/**
	 * 
	 * @Desc 跳转到新增页面
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:36
	 */
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addtpartnerbasicinfo(){
		
		return "/WEB-INF/tpartnerbasicinfo/tpartnerbasicinfo_add";
	}
	
	/**
	 * @Desc 保存数据
	 * @param tPartnerBasicInfo
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:23
	 */
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addAdpic(@ModelAttribute TPartnerBasicInfo tPartnerBasicInfo) throws Exception{
		tPartnerBasicInfoService.save(tPartnerBasicInfo);
		return "redirect:/manage/tpartnerbasicinfo.html";
	}
	
	/**
	 * 
	 * @Desc 删除信息
	 * @param id
	 * @param response
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:09
	 */
	@RequestMapping(value="/del/{id}")
	public String deletetpartnerbasicinfo(@PathVariable("id")int id,HttpServletResponse response){
		tPartnerBasicInfoService.del(id);
		return "redirect:/manage/tpartnerbasicinfo.html";
	}
	
	/**
	 * @Desc 修改信息
	 * @param tPartnerBasicInfo
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:00
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updatetpartnerbasicinfo(TPartnerBasicInfo tPartnerBasicInfo)throws Exception{
		tPartnerBasicInfoService.edit(tPartnerBasicInfo);
		return "redirect:/manage/tpartnerbasicinfo.html";
	}
	
	/**
	 * 
	 * @Desc 编辑前根据id获取信息
	 * @param id
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:43:43
	 */
	@RequestMapping(value="/{id}")
	public String viewtpartnerbasicinfo(@PathVariable("id")String id)
	{
		TPartnerBasicInfo tPartnerBasicInfo=tPartnerBasicInfoService.get(Integer.parseInt(id));
		getRequest().setAttribute("tPartnerBasicInfo",tPartnerBasicInfo);
		return "/WEB-INF/tpartnerbasicinfo/tpartnerbasicinfo_detail";
	}
}
