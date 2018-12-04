/**
 * 
 */
package com.lw.cms.bnarticledownload.utils;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author CZP
 *
 * 2018年7月6日
 */
public class Upload {
	@ResponseBody
	public  static String upload(HttpServletRequest request, MultipartFile file) throws Exception {
			SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMddhhmm");
			Date now = new Date();
			int random = (int) (Math.random() * 10000 + 1);
			String number = sdf.format(now) + random;
		   //如果文件不为空，写入上传路径
	       if(!file.isEmpty()) {
	           //上传文件路径
	           String path = request.getServletContext().getRealPath("/upload/images");
	           //上传文件名
	           String filename = number+"_"+file.getOriginalFilename();
	           File filepath = new File(path,filename);
	           //判断路径是否存在，如果不存在就创建一个
	           if (!filepath.getParentFile().exists()) { 
	               filepath.getParentFile().mkdirs();
	           }
	           //将上传文件保存到一个目标文件当中
	          file.transferTo(new File(path + File.separator + filename));
	          return filename;
		       } else {
		           return "";
		       }
	}

}
