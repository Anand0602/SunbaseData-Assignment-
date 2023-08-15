package com.viki;

import java.io.IOException;
import java.net.URI;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

public class Delete extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String apiURL = "https://qa2.sunbasedata.com/sunbase/portal/api/assignment.jsp";
        String cmdParam = "delete"; 
        
        String uuid = request.getHeader("X-UUID");
        System.err.println("UUID: "+uuid);
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
            String encodedUuidParam = URLEncoder.encode(uuid, StandardCharsets.UTF_8);
            
            String urlWithParams = apiURL + "?cmd=" + encodedCmdParam+"&uuid=" + encodedUuidParam;

            HttpClient httpClient = HttpClient.newHttpClient();
            HttpRequest req = HttpRequest.newBuilder()
                    .uri(URI.create(urlWithParams))
                    .header("Authorization", "Bearer " + accessToken)
                    .POST(HttpRequest.BodyPublishers.noBody()) 
                    .build();

            HttpResponse<String> httpResponse = httpClient.send(req, HttpResponse.BodyHandlers.ofString());

            
            int statusCode = httpResponse.statusCode();
            System.err.println("Delete Status: "+statusCode);
            if (statusCode == 200) {
                
                String responseData = httpResponse.body();
                System.err.println(responseData);
                
               
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(responseData);
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("/Home");
                dispatcher.forward(request, response);
                
            } else {
                
                System.err.println("API Request Failed with response code: " + statusCode);
            }

        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
