package com.JSHblog.jangtjdgns;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class JangtjdgnsApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        // War 배포 시 실행될 클래스 지정
        return builder.sources(JangtjdgnsApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(JangtjdgnsApplication.class, args);
    }
}
