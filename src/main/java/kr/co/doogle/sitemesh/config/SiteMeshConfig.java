package kr.co.doogle.sitemesh.config;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class SiteMeshConfig extends ConfigurableSiteMeshFilter {

	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
		builder.addDecoratorPath("/*", "/WEB-INF/front/layout/mainLayout.jsp")
//		.addDecoratorPath("/admin", "/WEB-INF/back/layout/adminLayout.jsp")
//		.addExcludedPath("/html/*")
//		.addExcludedPath(".json")
		.setMimeTypes("text/html");
	}
	
}