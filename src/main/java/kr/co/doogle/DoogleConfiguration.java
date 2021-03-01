package kr.co.doogle;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import kr.co.doogle.dto.CategoryDTO;
import kr.co.doogle.sitemesh.config.SiteMeshConfig;

@Configuration
public class DoogleConfiguration {

	@Bean
	public CategoryDTO categoryDTO() {
		return new CategoryDTO();
	}

	@Bean
	public FilterRegistrationBean<SiteMeshConfig> siteMeshFilter() {
		FilterRegistrationBean<SiteMeshConfig> filter = new FilterRegistrationBean<SiteMeshConfig>();
		filter.setFilter(new SiteMeshConfig());
		return filter;
	}

}