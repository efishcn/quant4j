package com.quant.admin.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author yujs
 */
@Configuration
public class CorsConfig implements WebMvcConfigurer {

    /**
     * 配置支持跨域访问
     *
     * @param registry
     */
  @Override
  public void addCorsMappings(CorsRegistry registry) {
    registry.addMapping("/**")
            .allowedOrigins("*")
            .allowCredentials(true)
            .allowedHeaders("*")
            .allowedMethods("GET", "POST", "DELETE", "PUT", "OPTIONS")
            .maxAge(7200);
  }

}
