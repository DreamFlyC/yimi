/**
 * 
 */
package com.lw.qaquestion.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.qaquestion.entity.QaQuestion;
import com.lw.qaquestion.service.IQaQuestionService;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:41:52
 */
@Controller("QaQuestionAction")
@RequestMapping(value="/manage/qaquestion")
public class QaQuestionAction extends BaseAction{
	@Autowired
	private IQaQuestionService qaQuestionService;
	
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
		List<QaQuestion> list=qaQuestionService.getList();
		int total=qaQuestionService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/qaquestion/qaquestion_list";
	}
	
	/**
	 * 
	 * @Desc 跳转到新增页面
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:36
	 */
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addqaquestion(){
		
		return "/WEB-INF/qaquestion/qaquestion_add";
	}
	
	/**
	 * @Desc 保存数据
	 * @param qaQuestion
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:23
	 */
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addAdpic(@ModelAttribute QaQuestion qaQuestion) throws Exception{
		qaQuestionService.save(qaQuestion);
		return "redirect:/manage/qaquestion.html";
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
	public String deleteqaquestion(@PathVariable("id")int id,HttpServletResponse response){
		qaQuestionService.del(id);
		return "redirect:/manage/qaquestion.html";
	}
	
	/**
	 * @Desc 修改信息
	 * @param qaQuestion
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:00
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updateqaquestion(QaQuestion qaQuestion)throws Exception{
		qaQuestionService.edit(qaQuestion);
		return "redirect:/manage/qaquestion.html";
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
	public String viewqaquestion(@PathVariable("id")int id)
	{
		QaQuestion qaQuestion=qaQuestionService.get(id);
		getRequest().setAttribute("qaQuestion",qaQuestion);
		return "/WEB-INF/qaquestion/qaquestion_detail";
	}
}
