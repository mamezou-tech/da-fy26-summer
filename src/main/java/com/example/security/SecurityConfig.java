package com.example.security;

import jakarta.servlet.DispatcherType;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig{

	// こいつが肝で、ホームページの@GetMappingみたいなもの。一番最初に動き始める？
	// リクエストがアプリケーションに到達する前に通過するフィルターの集まりで、リクエスト認証、認可、CSRF保護などのセキュリティ処理
	// 複数のフィルタが内部にある
	@Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
        .authorizeHttpRequests(authz -> authz
                // サーバー処理のjspアクセスを許可
                .dispatcherTypeMatchers(
                        DispatcherType.FORWARD,
                        DispatcherType.ERROR
                ).permitAll()
                .requestMatchers("/", "/login").permitAll() // /には誰でもアクセス可
                // .requestMatchers(PathRequest.toStaticResources().atCommonLocations()).permitAll()    // ログイン前からこのリソースを使えるようになる
                .requestMatchers("/reserver/**").hasRole("GENERAL") //GENERAL権限がある場合にのみ/reserver/以下にアクセス可
                .requestMatchers("/admin/**").hasRole("ADMIN")  //ADMIN権限がある場合にのみ/admin/以下にアクセス可
                .anyRequest().authenticated()   //ここまでのルールに当てはまらないURLはログイン必須
        )
        .formLogin(login -> login	// index.htmlからのth:action
                .loginPage("/login")    //自分で作成したログインページにする場合
                .loginProcessingUrl("/login")  //ログイン時にformのactionから送るURL(デフォルトは/login)
//                .defaultSuccessUrl("/reserver", true)	// 成功
                .successHandler(new CustomSuccessHandler())
                .failureUrl("/login?error")		// 失敗
                .permitAll()					// ログイン画面なら誰でもアクセス可。
                								// ログインページを開くのにログインページを求められ無限リダイレクトになる
        )
        .logout(logout -> logout
                .logoutSuccessUrl("/")	//ログアウト成功後に遷移するURL
        );

//        http
//        .authorizeHttpRequests(authz -> authz
//            .anyRequest().permitAll()
//        );




        return http.build();
    }

	//  メソッドに付けている。Autowiredの記述があるところに注入している
	//  SpringSecurtyのアノテーションの内部に記述されている。
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
