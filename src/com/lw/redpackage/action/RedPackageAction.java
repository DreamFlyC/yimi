package com.lw.redpackage.action;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lw.core.base.action.BaseAction;
import com.lw.redpackage.service.IUserRedPackageService;

@Controller("RedPackageAction")
@RequestMapping(value="/userRedPacket")
public class RedPackageAction extends BaseAction{
	@Autowired
	private  IUserRedPackageService userRedPackageService;
	@RequestMapping(value = "/grapRedPacket")
	@ResponseBody
	public Map<String, Object> grapRedPacket(Long redPacketId, Long userId) {
		// 抢红包
		System.err.println("redPacketId:"+redPacketId+"---userId:"+userId);
		int result = userRedPackageService.grapRedPacket(redPacketId, userId);
		Map<String, Object> retMap = new HashMap<String, Object>();
		boolean flag = result > 0;
		retMap.put("success", flag);
		retMap.put("message", flag ? "抢红包成功" : "抢红包失败");
		return retMap;
	}	
	
	@RequestMapping(value="/grap")
	public String grap() {
		return "/WEB-INF/redpackage/grap";
	}
	
	@RequestMapping(value="/whiteblock")
	public String whiteblock() {
		return "/WEB-INF/whiteblock/whiteblock";
	}
}
