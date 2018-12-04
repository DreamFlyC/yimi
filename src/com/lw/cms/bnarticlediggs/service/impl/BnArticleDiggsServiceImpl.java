/**
 * 
 */
package com.lw.cms.bnarticlediggs.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.cms.bnarticlediggs.entity.BnArticleDiggs;
import com.lw.cms.bnarticlediggs.persistence.BnArticleDiggsMapper;
import com.lw.cms.bnarticlediggs.service.IBnArticleDiggsService;
import com.lw.core.base.service.impl.BaseServiceImpl;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月23日 下午3:02:38
 */
@Transactional
@Service("BnArticleDiggsServiceImpl")
public class BnArticleDiggsServiceImpl extends BaseServiceImpl<BnArticleDiggs> implements IBnArticleDiggsService{
	@Autowired
	private BnArticleDiggsMapper bnArticleDiggsMapper;
}
