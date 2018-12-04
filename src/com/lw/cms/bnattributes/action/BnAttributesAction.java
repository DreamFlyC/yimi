/**
 * 
 */
package com.lw.cms.bnattributes.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.cms.bnattributes.entity.BnAttributes;
import com.lw.cms.bnattributes.service.IBnAttributesService;
import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月25日 上午11:00:29
 */
@Controller("BnAttributesAction")
@RequestMapping(value = "/manage/bnattributes")
@SuppressWarnings("all")
public class BnAttributesAction extends BaseAction{
	@Autowired
	private IBnAttributesService bnAttributesService;
	
	/**
	 * @Desc 信息列表
	 * @return
	 * @author CZP
	 * @Date 2018年10月25日 上午11:00:29
	 */
	@RequestMapping("")
	public String list(){
		instantPage(20);
		List<BnAttributes> list=bnAttributesService.getList();
		int total=bnAttributesService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/bnattributes/bnattributes_list";
	}
	
	/**
	 * 
	 * @Desc 跳转到新增页面
	 * @return
	 * @author CZP
	 * @Date 2018年10月25日 上午11:00:29
	 */
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addbnattributes(){
		
		return "/WEB-INF/bnattributes/bnattributes_add";
	}
	
	/**
	 * @Desc 保存数据
	 * @param bnAttributes
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月25日 上午11:00:29
	 */
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addAdpic(@ModelAttribute BnAttributes bnAttributes) throws Exception{
		bnAttributesService.save(bnAttributes);
		return "redirect:/manage/bnattributes.html";
	}
	
	/**
	 * 
	 * @Desc 删除信息
	 * @param id
	 * @param response
	 * @return
	 * @author CZP
	 * @Date 2018年10月25日 上午11:00:29
	 */
	@RequestMapping(value="/del/{id}")
	public String deletebnattributes(@PathVariable("id")int id,HttpServletResponse response){
		bnAttributesService.del(id);
		return "redirect:/manage/bnattributes.html";
	}
	
	/**
	 * @Desc 修改信息
	 * @param bnAttributes
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月25日 上午11:00:29
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updatebnattributes(BnAttributes bnAttributes)throws Exception{
		bnAttributesService.edit(bnAttributes);
		return "redirect:/manage/bnattributes.html";
	}
	
	/**
	 * 
	 * @Desc 编辑前根据id获取信息
	 * @param id
	 * @return
	 * @author CZP
	 * @Date 2018年10月25日 上午11:00:29
	 */
	@RequestMapping(value="/{id}")
	public String viewbnattributes(@PathVariable("id")int id)
	{
		BnAttributes bnAttributes=bnAttributesService.get(id);
		getRequest().setAttribute("bnAttributes",bnAttributes);
		return "/WEB-INF/bnattributes/bnattributes_detail";
	} 
	
	
}
