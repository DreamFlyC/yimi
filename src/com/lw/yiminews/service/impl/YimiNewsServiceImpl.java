package com.lw.yiminews.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.yiminews.entity.YimiNews;
import com.lw.yiminews.service.IYimiNewsService;

@Service("YimiNewsServiceImpl")
@Transactional
public class YimiNewsServiceImpl extends BaseServiceImpl<YimiNews> implements IYimiNewsService{

}
