package kr.co.doogle;

import java.util.function.BiFunction;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import kr.co.doogle.api.data.Data;
import kr.co.doogle.category.Category;
import kr.co.doogle.dto.CategoryDTO;
import kr.co.doogle.key.Key;
import kr.co.doogle.member.Member;
import kr.co.doogle.paging.Paging;
import kr.co.doogle.security.Security;
import kr.co.doogle.sitemesh.config.SiteMeshConfig;

@Configuration
public class DoogleConfiguration {

	@Bean
	public BiFunction<Integer, Integer, Paging> myBeanFactory() {
		return (p, t) -> paging(p, t);
	}

	@Bean
	public CategoryDTO categoryDTO() {
		return new CategoryDTO();
	}

	@Bean
	public Category catetory() {
		return new Category();
	}

	@Bean
	public Data data() {
		return new Data();
	}

	@Bean
	public Member member() {
		return new Member();
	}

	@Bean
	public Security security() {
		Security security = new Security();
		return security;
	}

	@Bean
	public Key key() {
		return new Key();
	}

	@Bean
	public Paging paging() {
		return new Paging();
	}

	@Bean
	public Paging paging(int page, int totalCnt) {
		return new Paging(page, totalCnt);
	}

	@Bean
	public FilterRegistrationBean<SiteMeshConfig> siteMeshFilter() {
		FilterRegistrationBean<SiteMeshConfig> filter = new FilterRegistrationBean<SiteMeshConfig>();
		filter.setFilter(new SiteMeshConfig());
		return filter;
	}

}