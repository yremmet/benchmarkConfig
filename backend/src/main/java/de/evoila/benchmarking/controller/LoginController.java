package de.evoila.benchmarking.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import de.evoila.benchmarking.data.LoginUser;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@RestController
public class LoginController {


	public static final String SECRET = "burgh.thiamine.nepenthe.sepia.temerity.stanza.bin";
	
	@RequestMapping(path="/login", method=RequestMethod.POST)
	public ResponseEntity<Object> login(@RequestBody final LoginUser userObj){
		if(userObj != null 
				&& userObj.username.equals("user") 
				&& userObj.password.equals("user")){
			final String token = Jwts.builder()
					.setSubject(userObj.username)
					.setIssuedAt(new Date())
					.signWith(SignatureAlgorithm.HS256, SECRET)
					.compact();
			final Map<String, String> entities = new HashMap<String, String>(1);
			entities.put("token", token);
			return new ResponseEntity<Object>(entities, HttpStatus.OK);
		} else {
			return new ResponseEntity<Object>(HttpStatus.FORBIDDEN);
		}
	}


}
