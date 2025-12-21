package com.example.SellerWeb.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.session.security.web.authentication.SpringSessionRememberMeServices;

import com.example.SellerWeb.service.CustomUserDetailsService;
import com.example.SellerWeb.service.UserService;

import jakarta.servlet.DispatcherType;

@Configuration
@EnableMethodSecurity(securedEnabled = true)
public class SecurityConfiguration {
        // config Bean PasswordEncoder
        // Override interface PasswordEncoder để mã hóa
        // -Không dùng trực tiếp object BcryptPasswordEncoder , phải cấu hình Bean sđể
        // spring security quản lí depedency injection tự động tiêm vào trong Bean
        // Controller
        @Bean
        public PasswordEncoder passwordEncoder() {
                return new BCryptPasswordEncoder();
        }

        // Config lại hàm userDetailService trong Authentication Provider
        @Bean
        public UserDetailsService userDetailsService(UserService userService) {
                return new CustomUserDetailsService(userService);
        }

        // Cấu hình Provider Authentication bằng userDetailService và passwordEncoder
        // để Provider dùng trong logic
        @Bean
        public DaoAuthenticationProvider authProvider(
                        PasswordEncoder passwordEncoder,
                        UserDetailsService userDetailsService) {
                DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
                authProvider.setUserDetailsService(userDetailsService);
                authProvider.setPasswordEncoder(passwordEncoder);
                authProvider.setHideUserNotFoundExceptions(false);
                return authProvider;
        }

        @Bean
        public AuthenticationSuccessHandler myAuthenticationSuccessHandler() {
                return new CustomSuccessHandler();
        }

        // config remember me
        @Bean
        public SpringSessionRememberMeServices rememberMeServices() {
                SpringSessionRememberMeServices rememberMeServices = new SpringSessionRememberMeServices();
                rememberMeServices.setAlwaysRemember(true);
                return rememberMeServices;
        }

        @SuppressWarnings("deprecation")
        @Bean
        public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
                // phần custom này khá là hơi trái quan điểm của mình.Vì đây là custom user chưa
                // login vẫn pass vào trang /home được nhưng với tư cách là GUEST. Cái cách này
                // thì phổ biến với các trang web bán hàng , người dùng chưa login thì vẫn có
                // thể vào trang product bình thường nhưng không thể mua hàng đặt hàng

                // Do việc permit như vậy dẫn đến khá nhiều Bug , nên phải config lại nhiều.
                // Khuyến khích sau này redone project không làm như này
                // Chỉ cần config permit url đến các static resources để phục vụ front-end thôi
                http

                                .csrf(c -> c.disable())

                                .formLogin(formLogin -> formLogin
                                                .loginPage("/login") // chỉ định url của page login
                                                .defaultSuccessUrl("/home", true)
                                                .successHandler(myAuthenticationSuccessHandler()) // custom redirect
                                                                                                  // page phụ thuộc vào
                                                                                                  // Role
                                                .permitAll())

                                .logout((logout) -> logout.logoutUrl("/logout")
                                                .logoutSuccessUrl("/login?logout"))
                                .authorizeHttpRequests(authorize -> authorize
                                                .dispatcherTypeMatchers(DispatcherType.FORWARD,
                                                                DispatcherType.INCLUDE)
                                                .permitAll() // cho phép tất cả các url loại FORWARD , INCLUDE

                                                .requestMatchers("/home", "/login", "/product/**", "/client/**",
                                                                "/css/**", "/js/**",
                                                                "/image/**","/error/**")
                                                .permitAll() // cho phép tất cả các url này để phục vụ cho phần resouces
                                                             // render

                                                .requestMatchers("/admin/**").hasRole("ADMIN")
                                                .requestMatchers("/register").permitAll()
                                                .dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
                                                .anyRequest().authenticated()

                                )
                                // handling 403 lỗi không đủ Role truy cập
                                .exceptionHandling(ex -> ex.accessDeniedPage("/access-reject"))
                                .rememberMe(r -> r.rememberMeServices(rememberMeServices()));
                return http.build();
        }
}
