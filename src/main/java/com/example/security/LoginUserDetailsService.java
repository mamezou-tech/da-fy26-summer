package com.example.security;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.entity.User;
import com.example.repository.UserRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class LoginUserDetailsService implements UserDetailsService {

    private final UserRepository userRepository;

    public LoginUserDetailsService(UserRepository userRepository) {
    		this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String loginName) throws UsernameNotFoundException {
    	User user = userRepository.findByLoginName(loginName);


        if (user == null) {
        	log.info("User not found.");
            throw new UsernameNotFoundException("User not found: " + loginName);
        } else {	// ここで確かに取得している
        	log.info(":" + user.getLoginName());
        }

        // ユーザー情報を入れたものをreturn
        // LoginUserDetailsのコンストラクタ。ここで作成する
        return new LoginUserDetails(user);
    }
}

