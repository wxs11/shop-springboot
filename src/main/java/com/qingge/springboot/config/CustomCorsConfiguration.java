package com.qingge.springboot.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

/**
 * @Classname CustomCorsConfiguration
 * @Description TODO
 * @Date 2022/4/23 11:05
 * @Author issuser
 */
@Configuration
public class CustomCorsConfiguration {
    private CorsConfiguration buildConfig() {
        CorsConfiguration corsConfiguration = new CorsConfiguration();
        corsConfiguration.addAllowedOriginPattern("*");
        corsConfiguration.addAllowedHeader("*");
        corsConfiguration.addAllowedMethod("*");
        corsConfiguration.setAllowCredentials(true);
        return corsConfiguration;
    }
    @Bean
    public CorsFilter corsFilter() {
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        //把buildConfig()方法中生成的配置好的CorsConfiguration应用到指定接口，/**表示所有
        source.registerCorsConfiguration("/**", buildConfig());
        return new CorsFilter(source);
    }

}
