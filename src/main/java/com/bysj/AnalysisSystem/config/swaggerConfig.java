package com.bysj.AnalysisSystem.config;

import com.google.common.base.Predicates;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class swaggerConfig {

    @Bean
    public Docket adminApiConfig(){
        return new Docket(DocumentationType.SWAGGER_2)
                .groupName("adminApi")
                .apiInfo(adminApiInfo())
                .select()
                .paths(Predicates.and(PathSelectors.regex("/admin/.*")))
                .build();
    }

    @Bean
    public Docket userApiConfig(){
        return new Docket(DocumentationType.SWAGGER_2)
                .groupName("userApi")
                .apiInfo(userApiInfo())
                .select()
                .paths(Predicates.not(PathSelectors.regex("/user/.*")))
                .paths(Predicates.not(PathSelectors.regex("/error.*")))
                .build();
    }

    private ApiInfo adminApiInfo(){

        ApiInfo build = new ApiInfoBuilder()
                .title("管理员-API接口")
                .description("管理员 主要的功能模块")
                .version("1.0")
                .contact("xxxx")
                .build();
        return build;
    }

    private ApiInfo userApiInfo(){

        ApiInfo build1 = new ApiInfoBuilder()
                .title("用户-API接口")
                .description("用户接口")
                .version("1.0")
                .contact("xxxx")
                .build();
        return build1;
    }
}
