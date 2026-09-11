package com.example.security;

import java.io.IOException;
import java.util.Collection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomSuccessHandler implements AuthenticationSuccessHandler {
	// ここにADMIN、RESERVERイベント条件分岐を記述する？
    // 引き渡されたnameがADMINかRESERVERかのif文を記述。ここで認可の設定はしない
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
										HttpServletResponse response,
										Authentication authentication) throws IOException, ServletException {
		// TODO 自動生成されたメソッド・スタブ

		// GrantedAuthority	が親クラス
		// etAuthorities このゲッタがGrantedAuthority型のリストを返却
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        String targetUrl = "/"; // どちらにも該当しない場合のデフォルト（トップページなど）

        //GrantegAuthority
        for (GrantedAuthority authority : authorities) {
            System.out.println("AUTHORITY = " + authority.getAuthority());
            String role = authority.getAuthority();

            if ("ROLE_ADMIN".equals(role)) {
                targetUrl = "/admin"; // ADMINの場合
                break;
            } else if ("ROLE_GENERAL".equals(role)) {
                targetUrl = "/reserver";    // GENERALの場合
                break;
            }
        }
        // コンテキストパスを含めたリダイレクトを戻す（voidで行う必要がある）
        response.sendRedirect(request.getContextPath() + targetUrl);
	}
}
