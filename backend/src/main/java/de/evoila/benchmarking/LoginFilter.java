package de.evoila.benchmarking;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import de.evoila.benchmarking.controller.LoginController;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureException;

@Component
public class LoginFilter extends OncePerRequestFilter {

	@Override
	protected boolean shouldNotFilter(HttpServletRequest request) throws ServletException {
		final String path = request.getRequestURI();

		//To ensure CORS Preflight is accepted
		if(request.getMethod().equals("OPTIONS")){
			return true;
		}
		
		if(path.startsWith("/login") || path.startsWith("/api")){
			return true;
		}
		
		return false;
	}
	
	@Override
	protected void doFilterInternal(
			HttpServletRequest request, 
			HttpServletResponse response, 
			FilterChain filterChain)
			throws ServletException, IOException {
		
		final String authHeader = request.getHeader("X-Auth");
		if(authHeader == null){
			response.setStatus(401);
			return;
			//throw new ServletException("Missing authHeader");
		}
		
		//TODO: Clever Token
		try {
			final Claims claims = Jwts.parser().setSigningKey(LoginController.SECRET).parseClaimsJws(authHeader).getBody();

			//TODO: User allowed, add in request etc.
			
		} catch(SignatureException sigEx) {
			response.setStatus(401);
			return;
		}
		
		filterChain.doFilter(request, response);
	}
	
}
