package com.lw.traceabilitytype.action;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.traceabilitytype.entity.TraceabilityType;
import com.lw.traceabilitytype.service.ITraceabilityTypeService;

@Controller("TraceabilityTypeAction")
@RequestMapping(value="/traceabilitytype")
public class TraceabilityTypeAction extends BaseAction{
	@Autowired
	private ITraceabilityTypeService traceabilityTypeService;
	
	//信息列表
	@RequestMapping("")
	public String list(ModelMap map){
		map.addAttribute("nameList", traceabilityTypeService.getAllOne());
		instantPage(20);
		List<TraceabilityType> list=traceabilityTypeService.getList();
		int total=traceabilityTypeService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/traceabilitytype/traceabilitytype_list";
	}
	
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addtraceabilitytype(){
		
		return "/WEB-INF/traceabilitytype/traceabilitytype_add";
	}
	
	//新增信息
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addtraceabilitytype(TraceabilityType traceabilityType){
		traceabilityTypeService.getList();
		traceabilityTypeService.save(traceabilityType);
		return "redirect:/WEB-INF/traceabilitytype.html";
	}
	
	//删除信息
	@RequestMapping(value="/del/{id}")
	public String deletetraceabilitytype(@PathVariable("id")int id,HttpServletResponse response) throws SQLException{
		//traceabilityTypeService.del(id);
		delNode(id);
		return "redirect:/WEB-INF/traceabilitytype.html";
	}
	
	//修改信息
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updatetraceabilitytype(TraceabilityType traceabilityType,HttpServletResponse response){
		traceabilityTypeService.edit(traceabilityType);
		return "redirect:/WEB-INF/traceabilitytype.html";
	}
	
	//编辑前根据id获取信息
	@RequestMapping(value="/{id}")
	public String viewtraceabilitytype(@PathVariable("id")int id)
	{
		TraceabilityType traceabilityType=traceabilityTypeService.get(id);
		getRequest().setAttribute("traceabilityType",traceabilityType);
		return "/WEB-INF/traceabilitytype/traceabilitytype_detail";
	}
	
	//新增前根据id获取信息
		@RequestMapping(value="/add/{id}")
		public String add(@PathVariable("id")int id)
		{
			TraceabilityType traceabilityType=traceabilityTypeService.get(id);
			getRequest().setAttribute("traceabilityType",traceabilityType);
			return "/WEB-INF/traceabilitytype/traceabilitytype_add";
		}
	
	//
	 /**
     * 根据省份获取城市
     * @param id
     * @return
     */
    @RequestMapping(value = "/getCityByProvinceId/{id}")
    @ResponseBody
    public Json getCityByProvinceId(@PathVariable("id") Integer id){
        List<TraceabilityType> cityList = traceabilityTypeService.getCityByProvinceId(id);
        if (cityList!=null){
            return new Json(true,"success",cityList);
        } else {
            return new Json(false,"fail",null);
        }
    }

    /**
     * 根据城市获取区域
     * @param id
     * @return
     */
    @RequestMapping(value = "/getAreaByCityId/{id}")
    @ResponseBody
    public Json getAreaByCityId(@PathVariable("id") String id){
        List<TraceabilityType> areaList = traceabilityTypeService.getAreaByCityId(id);
        if (areaList!=null){
            return new Json(true,"success",areaList);
        } else {
            return new Json(false,"fail",null);
        }
    }
    
    /**
     * 根据区域获取地址
     * @param id
     * @return
     */
    @RequestMapping(value = "/getaddressByAreaId/{id}")
    @ResponseBody
    public Json getaddressByAreaId(@PathVariable("id") Integer id){
        List<TraceabilityType> addressList = traceabilityTypeService.getaddressByAreaId(id);
        if (addressList!=null){
            return new Json(true,"success",addressList);
        } else {
            return new Json(false,"fail",null);
        }
    }
    
    public void delNode(Integer id) throws SQLException{
    	//先根据id删除当前节点
    	traceabilityTypeService.del(id);
    	//再根据id查找当前节点的子节点
    	List<TraceabilityType> sons=traceabilityTypeService.getCityByProvinceId(id);
    	if(null!=sons && !sons.isEmpty()) {
    		for(int i=0;i<sons.size();i++) {
    			TraceabilityType son=sons.get(i);
    			delNode(son.getId());
    		}
    	}
    }
    
}
