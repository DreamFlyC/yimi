
package com.lw.adpic.action;

import com.lw.acommon.util.Upload;
import com.lw.adpic.entity.Adpic;
import com.lw.adpic.service.IAdpicService;
import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author CZP
 *
 * 2018年7月11日
 */
@Controller("AdpicAction")
@RequestMapping(value="/manage/adpic")
public class AdpicAction extends BaseAction{
	@Autowired
	private IAdpicService adpicService;
	
	@RequestMapping(value= {"","adpic_list"})
	public String index(String title,String component) {
		instantPage(20);
		Map<String,Object> param=new HashMap<>(2);
		if(StringUtils.isNotBlank(title)) {
			param.put("title", title);
		}
		if(StringUtils.isNotBlank(component)) {
			param.put("component", component);
		}
		List<Adpic> adList = adpicService.getList(param);
		int total=adpicService.getCount(param);
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(adList);
		getRequest().setAttribute("pager",pager);
		getRequest().setAttribute("adList", adList);
		return "/WEB-INF/adpic/adpic_list";
	}
	
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addAdpic(){
		
		return "/WEB-INF/adpic/adpic_add";
	}
	
/*	//新增信息
		@RequestMapping(value="/post",method=RequestMethod.POST)
		public String addAdpic(Adpic adpic,HttpServletRequest request) throws Exception{
//			SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
//		 	String smallpic = getRequest().getParameter("smallpic");
//			String largepic = getRequest().getParameter("largepic");
//			adpic.setSmallpic(smallpic);
//			adpic.setLargepic(largepic);
//			adpic.setAddtime(sdf.format(new Date()));
//			System.out.println("smallpic为："+smallpic+"----largepic为："+largepic); 
			adpicService.save(adpic);
			return "redirect:/manage/adpic.html";
		}*/

	
	//新增信息
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addAdpic(@ModelAttribute Adpic adpic,@RequestParam("small") MultipartFile small,
			@RequestParam("large") MultipartFile large,HttpServletRequest request) throws Exception{
		SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		String smallpic = Upload.upload(request, small,null);
		String largepic = Upload.upload(request, large,null);
		adpic.setSmallpic(smallpic);
		adpic.setLargepic(largepic);
		adpic.setAddtime(sdf.format(new Date()));
		adpicService.save(adpic);
		return "redirect:/adpic.html";
	}
	
	//删除信息
	@RequestMapping(value="/del/{id}")
	public String deleteAdpic(@PathVariable("id")int id,HttpServletResponse response){
		System.out.println("id="+id+"---------");
		adpicService.del(id);
		return "redirect:/manage/adpic.html";
	}
	
	//修改信息
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updateAdpic(Adpic adpic,@RequestParam(value="small",required=false) MultipartFile small,
			@RequestParam(value="large",required=false) MultipartFile large,HttpServletRequest request)throws Exception{
		if(small!=null) {
            String smallpic = Upload.upload(request, small,null);
			 adpic.setSmallpic(smallpic);
		}
		if(large!=null) {
            String largepic = Upload.upload(request, large,null);
			 adpic.setLargepic(largepic);
		}
		adpicService.edit(adpic);
		return "redirect:/manage/adpic.html";
	}
	
	//编辑前根据id获取信息
	@RequestMapping(value="/{id}")
	public String viewAdpic(@PathVariable("id")int id)
	{
		Adpic adpic=adpicService.get(id);
		getRequest().setAttribute("adpic",adpic);
		return "/WEB-INF/adpic/adpic_detail";
	}
	
	@RequestMapping(value="/upload")
	public String upload() {
		return "/WEB-INF/adpic/upload";
	}
	
	
	
	@RequestMapping(value="/doupload")
	@ResponseBody
	public Map<String, Object> uploadFile(@RequestParam(value = "myfile") MultipartFile myfile,HttpServletResponse response) throws IllegalStateException, IOException{
		
		//原始名称 获取文件上传原名
		String oldFileName=myfile.getOriginalFilename();
		String saveFilePath="D:\\AdpicUpload";
        // 新的图片名称
        SimpleDateFormat sdf=new SimpleDateFormat("YYYYMMddHHmmss");

        String now=sdf.format(new Date());
        int random=(int)(Math.random()*10000+1);
        String newFileName =now+random+"_"+oldFileName;
        // 新图片
        File newFile = new File(saveFilePath + "\\" + newFileName);
        // 将内存中的数据写入磁盘
        myfile.transferTo(newFile);
        // 将新图片名称返回到前端
        Map<String, Object> map = new HashMap<>();
        map.put("success", "成功啦");
        map.put("url", newFileName);
        return map;
	}
	
	@RequestMapping("upload1")
	public String up() {
		return "/WEB-INF/adpic/upload1";
	}

	@RequestMapping(value="/uploadfile",method=RequestMethod.POST)
	@ResponseBody
	public String uploadFile(HttpServletResponse response,@RequestParam("file")MultipartFile[] file,ModelMap model) {
		response.setHeader("Access-Control-Allow-Origin", "http://192.168.1.144:8848");
		String path="D:\\java\\upload";
		for(int i=0;i<file.length;i++) {
			//获取文件名
			String fileName = file[i].getOriginalFilename();
			// String fileName = new Date().getTime()+".jpg";//替换新名字
			//判断文件是否存在，不存在则创建，可创建文件夹
			// 保存
			try {
                File targetFile = new File(path, fileName);
                if (!targetFile.exists()) {
                    boolean mkdirs = targetFile.mkdirs();
                }
				//使用transferTo（dest）方法将上传文件写到服务器上指定的文件。//此方法在上传完成后才开始上传
				file[i].transferTo(targetFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}
