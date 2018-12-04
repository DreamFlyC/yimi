/**
 * 
 */
package com.lw.qaquestion.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.qaquestion.entity.QaQuestion;
import com.lw.qaquestion.service.IQaQuestionService;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:46:52
 */
@Transactional
@Service("QaQuestionServiceImpl")
public class QaQuestionServiceImpl extends BaseServiceImpl<QaQuestion> implements IQaQuestionService{

}
