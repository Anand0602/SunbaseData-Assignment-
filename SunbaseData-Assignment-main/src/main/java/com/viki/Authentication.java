package com.viki;


import java.io.IOException;

import java.net.URI;

import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

//@WebServlet("/Authentication")
public class Authentication extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");

        String apiURL = "https://qa2.sunbasedata.com/sunbase/portal/api/assignment_auth.jsp";
        try {
            
            HttpClient httpClient = HttpClient.newHttpClient();
            Map<String, String> userData = new HashMap<>();
            userData.put("login_id", username);
            userData.put("password", password);
            
      
            ObjectMapper objectMapper = new ObjectMapper();

            String jsonData = objectMapper.writeValueAsString(userData);           
            
            HttpRequest req = HttpRequest.newBuilder()
                    .uri(URI.create(apiURL))
                    .header("Content-Type", "application/json")
                    .POST(HttpRequest.BodyPublishers.ofString(jsonData, StandardCharsets.UTF_8))
                    .build();
            
            
            HttpResponse<String> httpResponse = httpClient.send(req, HttpResponse.BodyHandlers.ofString());
            
            String responseData = httpResponse.body();
            System.out.println("In Auth RES"+responseData);
            User user = objectMapper.readValue(responseData, User.class);
            String accessToken = user.getAccessToken();
            int statusCode = httpResponse.statusCode();
            System.out.println("In Auth "+ accessToken);
            if(statusCode == 200) {
            	 Cookie tokenCookie = new Cookie("access_token", accessToken);
                 tokenCookie.setHttpOnly(true); 
                 tokenCookie.setMaxAge(3600); 
                 response.addCookie(tokenCookie);
            	 response.sendRedirect("Home.jsp");
            }else {
   
                response.sendRedirect("Login.jsp?error=1");
            }
            
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
        }
}
