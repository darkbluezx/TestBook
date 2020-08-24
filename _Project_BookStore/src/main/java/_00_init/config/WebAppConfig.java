package _00_init.config;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.support.OpenSessionInViewInterceptor;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import _05_loginSystem.interceptor.CheckLoginInterceptor;

@Configuration
@EnableWebMvc
@ComponentScan({"_00_init","_01_order","_02_statistics","_05_loginSystem","_08_Promotion_com.web.store","_09_Book","_03_cart","shopping"})
public class WebAppConfig implements WebMvcConfigurer {
	
	@Autowired
	SessionFactory factory;
	
	@Bean
	public ViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		// resolver.setViewClass(JstlView.class); // 新版的Spring框架不需要這一行
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	
	
//	@Override 
//	// 應用系統必須透過ResourceHandlerRegistry的輔助，以便處理靜態檔案：
//	// 只要請求路徑是以/css/開頭的任何請求，都轉到/WEB-INF/views/css/去尋找
//	// 只要請求路徑是以/image/開頭的任何請求，都轉到/WEB-INF/views/images/去尋找
//	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//		 registry.addResourceHandler("/fragment/**")
//        		 .addResourceLocations("/WEB-INF/views/fragment/");
//		 registry.addResourceHandler("/vendor/**")
//		 		 .addResourceLocations("/WEB-INF/views/vendor/");
//		 registry.addResourceHandler("/js/**")
//		 		 .addResourceLocations("/WEB-INF/views/js/");
//	     registry.addResourceHandler("/css/**")
//	             .addResourceLocations("/WEB-INF/views/css/");
//	     registry.addResourceHandler("/images/**")
//	             .addResourceLocations("/WEB-INF/views/images/");
//	}
//	
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("UTF-8");
		resolver.setMaxUploadSize(81920000);
		return resolver;
	}
	@Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new CheckLoginInterceptor());
        
        OpenSessionInViewInterceptor openSessionInViewInterceptor = new OpenSessionInViewInterceptor();
	    openSessionInViewInterceptor.setSessionFactory(factory);

	    registry.addWebRequestInterceptor(openSessionInViewInterceptor).addPathPatterns("/_05_orderProcess/orderDetail");
        
    }

}
