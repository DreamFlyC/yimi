package com.lw.newsinfo.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.newsinfo.entity.NewsInfo;
import com.lw.newsinfo.service.INewsInfoService;

/**
*@author qw
*@version 创建时间:2017年3月6日 上午11:17:28
*类说明
*/
@Service("NewsInfoServiceImpl")
@Transactional
public class NewsInfoServiceImpl extends BaseServiceImpl<NewsInfo> implements INewsInfoService{

}
