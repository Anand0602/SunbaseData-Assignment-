package com.viki;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

public class Customer {
	 	private String uuid;
	    private String firstName;
	    private String lastName;
	    private String street;
	    private String address;
	    private String city;
	    private String state;
	    private String email;
	    private String phone;
	    
	    public Customer() {
	    
	    }
	    
	    @JsonIgnore
	    public String getUuid() {
	        return this.uuid;
	    }

	    public void setUuid(String uuid) {
	        this.uuid = uuid;
	    }
	    @JsonProperty("first_name")
	    // Getter and Setter for "first_name"
	    public String getFirstName() {
	        return this.firstName;
	    }

	    public void setFirstName(String firstName) {
	        this.firstName = firstName;
	    }
	    
	    @JsonProperty("last_name")
	    // Getter and Setter for "last_name"
	    public String getLastName() {
	        return this.lastName;
	    }

	    public void setLastName(String lastName) {
	        this.lastName = lastName;
	    }

	    // Getter and Setter for "street"
	    public String getStreet() {
	        return this.street;
	    }

	    public void setStreet(String street) {
	        this.street = street;
	    }

	    // Getter and Setter for "address"
	    public String getAddress() {
	        return this.address;
	    }

	    public void setAddress(String address) {
	        this.address = address;
	    }

	    // Getter and Setter for "city"
	    public String getCity() {
	        return this.city;
	    }

	    public void setCity(String city) {
	        this.city = city;
	    }

	    // Getter and Setter for "state"
	    public String getState() {
	        return this.state;
	    }

	    public void setState(String state) {
	        this.state = state;
	    }

	    // Getter and Setter for "email"
	    public String getEmail() {
	        return email;
	    }

	    public void setEmail(String email) {
	        this.email = email;
	    }

	    // Getter and Setter for "phone"
	    public String getPhone() {
	        return phone;
	    }

	    public void setPhone(String phone) {
	        this.phone = phone;
	    }
	    
	    public String toString() {
	        return "Customer{" +
	                "first_name='" + firstName + '\'' +
	                ", last_name='" + lastName + '\'' +
	                ", state='" + state + '\'' +
	                ", address='" + address + '\'' +
	                ", city='" + city + '\'' +
	                ", email='" + email + '\'' +
	                ", phone='" + phone + '\'' +
	                '}';
	    }
	   
}
