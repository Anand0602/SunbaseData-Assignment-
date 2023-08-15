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

import org.json.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;

public class AddCustomer extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// TODO Auto-generated method stub
		
		String apiURL = "https://qa2.sunbasedata.com/sunbase/portal/api/assignment.jsp";
        String cmdParam = "create"; 
        
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String street = request.getParameter("street");
        String state = request.getParameter("state");
        String address = request.getParameter("name");
        String city = request.getParameter("city");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        
        
        Customer customer = new Customer();
        customer.setFirstName(firstName);
        customer.setLastName(lastName);
        customer.setStreet(street);
        customer.setState(state);
        customer.setAddress(address);
        customer.setCity(city);
        customer.setEmail(email);
        customer.setPhone(phone);
        
        try {

            String accessToken = "";
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("access_token")) {
                        accessToken = cookie.getValue();
                        System.out.println("accessToken "+ accessToken);
                    }
                }
            }

            
            String encodedCmdParam = URLEncoder.encode(cmdParam, StandardCharsets.UTF_8);
        
            
            String urlWithParams = apiURL + "?cmd=" + encodedCmdParam;
            
            ObjectMapper objectMapper = new ObjectMapper();
            String customerJson = objectMapper.writeValueAsString(customer);
            
            
            
            System.out.println(customerJson);

            HttpClient httpClient = HttpClient.newHttpClient();
            HttpRequest req = HttpRequest.newBuilder()
                    .uri(URI.create(urlWithParams))
                    .header("Authorization", "Bearer " + accessToken)
                    .header("Content-Type", "application/json")	
                    .POST(HttpRequest.BodyPublishers.ofString(customerJson)) 
                    .build();

            HttpResponse<String> httpResponse = httpClient.send(req, HttpResponse.BodyHandlers.ofString());
            
            String responseData = httpResponse.body();
            int statusCode = httpResponse.statusCode();
            System.err.println("Add Cust Status: "+statusCode);
            if (statusCode == 200) {
            
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(statusCode);
                
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
