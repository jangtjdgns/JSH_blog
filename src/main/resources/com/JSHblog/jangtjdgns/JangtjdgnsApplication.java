package com.JSHblog.jangtjdgns;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class JangtjdgnsApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(JangtjdgnsApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(JangtjdgnsApplication.class, args);
    }
}
