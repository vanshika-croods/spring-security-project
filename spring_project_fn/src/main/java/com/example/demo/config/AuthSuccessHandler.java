package com.example.demo.config;

import java.io.IOException;
import java.util.Collection;

import javax.security.sasl.AuthenticationException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.example.demo.model.User;
import com.example.demo.repo.UserRepo;

@Configuration
public class AuthSuccessHandler implements AuthenticationSuccessHandler {

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Autowired
	UserRepo userrepo;

	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException 
	{
		HttpSession session=request.getSession();
		
		String username=authentication.getName();
		User user=userrepo.findByUserName(username);
		session.setAttribute("user", user);
		session.setAttribute("userId", user.getUserId());
		
		
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		authorities.forEach(authority -> {
	if(authority.getAuthority().equals("ROLE_USER")) {
		try {
			if(user.getStatus()==0) {
				LockedException exception = new LockedException(username);
				exception = new LockedException("Your account has been locked due to 3 failed attempt " +"It will be unlocked after 24 hours.");
				response.sendRedirect("login?error");
			}
			else {
				redirectStrategy.sendRedirect(request, response, "/user/index");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} else if(authority.getAuthority().equals("ROLE_ADMIN")) {
		try {
			redirectStrategy.sendRedirect(request, response, "/admin/index");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} else {
        throw new IllegalStateException();
    }
});

	}

}


