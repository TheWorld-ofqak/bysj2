package com.bysj.AnalysisSystem.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 *
 *
 *
 *
 */
@Component
@Slf4j
public class MybatispulsMetaObjectHandler implements MetaObjectHandler {

	@Override
	public void insertFill(MetaObject metaObject) {
		log.info("start insert fill ....");
		this.setFieldValByName("creatTime", new Date(), metaObject);
		this.setFieldValByName("updateTime", new Date(), metaObject);
		this.setFieldValByName("createTime", new Date(), metaObject);
	}

	@Override
	public void updateFill(MetaObject metaObject) {
		log.info("start update fill ....");
		this.setFieldValByName("updateTime", new Date(), metaObject);
	}
}