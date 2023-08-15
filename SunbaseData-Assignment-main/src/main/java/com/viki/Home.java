package com.viki;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.util.Arrays;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Home extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	String apiURL = "https://qa2.sunbasedata.com/sunbase/portal/api/assignment.jsp";
        String cmdParam = "get_customer_list"; 
        System.out.println("In Home");
        try {

            String accessToken = "";
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("access_token")) {
                        accessToken = cookie.getValue();
                    }
                }
            }

            
            String encodedCmdParam = URLEncoder.encode(cmdParam, StandardCharsets.UTF_8);

            
            String urlWithParams = apiURL + "?cmd=" + encodedCmdParam;

            HttpClient httpClient = HttpClient.newHttpClient();
            HttpRequest req = HttpRequest.newBuilder()
                    .uri(URI.create(urlWithParams))
                    .header("Authorization", "Bearer " + accessToken)
                    .GET()
                    .build();

            HttpResponse<String> httpResponse = httpClient.send(req, HttpResponse.BodyHandlers.ofString());

            
            int statusCode = httpResponse.statusCode();

            if (statusCode == 200) {
                
                String responseData = httpResponse.body();
                
                response.setContentType("application/json");

               
	                PrintWriter out = response.getWriter();
	                out.print(responseData);
	                out.flush();
              
                
            } else {
                
                System.err.println("API Request Failed with response code: " + statusCode);
            }

        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	doGet(request, response);
    }
}
