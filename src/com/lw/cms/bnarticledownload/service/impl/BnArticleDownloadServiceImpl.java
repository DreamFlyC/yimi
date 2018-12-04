/**
 * 
 */
/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月23日 下午4:04:58
 */
package com.lw.cms.bnarticledownload.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.cms.bnarticledownload.entity.BnArticleDownload;
import com.lw.cms.bnarticledownload.persistence.BnArticleDownloadMapper;
import com.lw.cms.bnarticledownload.service.IBnArticleDownloadService;
import com.lw.core.base.service.impl.BaseServiceImpl;

@Transactional
@Service("BnArticleDownloadServiceImpl")
public class BnArticleDownloadServiceImpl extends BaseServiceImpl<BnArticleDownload> implements IBnArticleDownloadService{
	@Autowired
	private BnArticleDownloadMapper bnArticleDownloadMapper;
}