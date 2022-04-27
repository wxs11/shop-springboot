package com.qingge.springboot.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
//跨域配置类：配置跨域请求
@Configuration //声明全局配置类
public class WebConfig extends WebMvcConfigurerAdapter {
    //第一种：
    //  @Override
//    public void addCorsMappings(CorsRegistry registry) {
//        /*
//        * 1：访问路径
//        * 2：请求来源
//        * 3：请求方法
//        * 4：允许携带tocken
//        * 5：最大响应时间
//        *
//        * */
//
//        registry.addMapping("/**")
//                .allowedOrigins("Http:localhost:8080","null")
//                .allowedHeaders("GET","POST","PUT","OPTIONS","DELETE")
//                .allowCredentials(true)
//                .maxAge(3600);
//
//    }
//第二种：
    @Override
    public  void  addCorsMappings(CorsRegistry registry){
        registry.addMapping("/**")
                .allowedOrigins("http://localhost:8080")
                .allowedHeaders("*")
                .allowedMethods("*")
                .maxAge(30*1000);
    }

}
