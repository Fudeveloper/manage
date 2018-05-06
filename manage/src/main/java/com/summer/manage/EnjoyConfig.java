package com.summer.manage;

import com.jfinal.template.ext.spring.JFinalViewResolver;
import com.jfinal.template.source.ClassPathSourceFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class EnjoyConfig {
	@Bean(name = "jfinalViewResolver")
	public JFinalViewResolver getJFinalViewResolver(){
		JFinalViewResolver jf = new JFinalViewResolver();
		jf.setDevMode(true);
		jf.setSourceFactory(new ClassPathSourceFactory());
		//这里根据自己的目录修改，一般页面放到/templates下面
		jf.setPrefix("/templates/");
		jf.setSuffix(".html");
		jf.setContentType("text/html;charset=UTF-8");
		jf.setSharedFunction("/templates/include/layout.html");
		jf.setSharedFunction("/templates/include/list.html");
		jf.setOrder(0);
		return jf;
	}
}