/**
 * 
 */
package com.lw.cms.bnarticlealbums.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.cms.bnarticlealbums.entity.BnArticleAlbums;
import com.lw.cms.bnarticlealbums.persistence.BnArticleAlbumsMapper;
import com.lw.cms.bnarticlealbums.service.IBnArticleAlbumsService;
import com.lw.core.base.service.impl.BaseServiceImpl;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月23日 下午3:02:38
 */
@Transactional
@Service("BnArticleAlbumsServiceImpl")
public class BnArticleAlbumsServiceImpl extends BaseServiceImpl<BnArticleAlbums> implements IBnArticleAlbumsService{
	@Autowired
	private BnArticleAlbumsMapper bnArticleAlbumsMapper;
}
