package kr.co.doogle;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;

import kr.co.doogle.api.data.Data;
import kr.co.doogle.category.Category;
import kr.co.doogle.dto.CategoryDTO;
import kr.co.doogle.key.Key;
import kr.co.doogle.member.Member;
import kr.co.doogle.pagination.Pagination;
import kr.co.doogle.security.Security;
import kr.co.doogle.sitemesh.config.SiteMeshConfig;

@SpringBootApplication
public class DoogleApplication {

	public static void main(String[] args) {
		SpringApplication.run(DoogleApplication.class, args);
	}

	@Bean
	public CategoryDTO categoryDTO() {
		CategoryDTO dto = new CategoryDTO();
		return dto;
	}

	@Bean
	public Category catetory() {
		Category category = new Category();
		return category;
	}

	@Bean
	public Data data() {
		Data data = new Data();
		return data;
	}

	@Bean
	public Member member() {
		Member member = new Member();
		return member;
	}

	@Bean
	public Security security() {
		Security security = new Security();
		return security;
	}

	@Bean
	public FilterRegistrationBean<SiteMeshConfig> siteMeshFilter() {
		FilterRegistrationBean<SiteMeshConfig> filter = new FilterRegistrationBean<SiteMeshConfig>();
		filter.setFilter(new SiteMeshConfig());
		return filter;
	}

	@Bean
	public Pagination pagination() {
		Pagination pagination = new Pagination();
		return pagination;
	}

	@Bean
	public Key key() {
		Key key = new Key();
		return key;
	}

}