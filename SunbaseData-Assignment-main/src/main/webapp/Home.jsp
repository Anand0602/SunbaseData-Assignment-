
<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.viki.Customer" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="./Home.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/a2207303c3.js" crossorigin="anonymous"></script>
</head>
<body>
      <% boolean isAuthenticated = false;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
            	
                if (cookie.getName().equals("access_token")) {
                	System.out.println(cookie.getValue());
                    isAuthenticated = true;
                    break;
                }
            }
        }
        if(!isAuthenticated){
        	 response.sendRedirect("Login.jsp");
        }
        System.out.println(isAuthenticated);
        
    %>
    <div class="home-container">
    	<div class="top-con">
    		<button type="button" class="custom-btn" onclick="toggleForm()" id="addCustomer">Add Customer</button>
    		<h1 class="customer-list">Customer List</h1>
    	</div> 
    	<div  class="bottom-com">
	    	<div class="key-container">
	    		<p class="key-fname">First Name</p>
	    		<p class="key-lname">Last Name</p>
	    		<p class="key-address">Address</p>
	    		<p class="key-city">City</p>
	    		<p class="key-state">State</p>
	    		<p class="key-email">Email</p>
	    		<p class="key-phone">Phone</p>
	    		<p class="key-action">Action</p>
	    	</div>
	    	<div class="values-con" id="responseDiv">
		        <p class="loding-view">Loading customer data...</p>
		    </div>
    	</div>
    	<div class="form-container" >
    	<div class="form-sub-container" id="myForm" style="display: none;">
    		<h1 class="cust-details">Customer Details</h1>
	    	 <form class="form" action="" method="post" >
	    	  <div>
	        	<label for="fname" class="custom-label">First Name</label> <br>
		        <input id="fname" class="custom-input" placeHolder="First Name" type="text" name="firstname" /> <br>
		        </div>
		        <div>
		        <label for="lname" class="custom-label">Last Name</label> <br>
		        <input id="lname" class="custom-input" placeHolder="Last Name" type="text" name="lastname" /> <br>
		        </div>
		        <div>
		        <label for="street" id="fname" class="custom-label">Street</label> <br>
		        <input id="street" class="custom-input" placeHolder="Street" type="text" name="street" /> <br>
		        </div>
		        <div>
		        <label for="address" id="fname" class="custom-label">Address</label> <br>
		        <input id="address" class="custom-input" placeHolder="Address" type="text" name="address" /> <br>
		        </div>
		        <div>
		        <label for="city" id="fname" class="custom-label">City</label> <br>
		        <input id="city" class="custom-input" placeHolder="City" type="text" name="city"  /> <br>
		        </div>
		        <div>
		        <label for="state" id="fname" class="custom-label">State</label><br>
		        <input id="state" class="custom-input" placeHolder="State" type="text" name="state" /> <br>
		        </div>
		        <div>
		        <label for="email" id="fname" class="custom-label">Email</label> <br>
		        <input id="email" class="custom-input" placeHolder="Email" type="text" name="email"/> <br>
		        </div>
		        <div>
		        <label for="phone" id="fname" class="custom-label">Phone</label> <br>
		        <input id="phone" class="custom-input" placeHolder="Phone" type="text" name="phone" /> <br>
	        	</div>
	        	<button onclick="toggleForm()" class="custom-btn submit-btn" type="submit">Submit</button>
	    	</form>
	    </div>
    	</div>
 
	    <div class="update-form-container" id="updateFormContainer">
    	<div class="form-sub-container" id="updateForm" style="display: none;">
            		<h1 class="cust-details">Update Customer</h1>
        	    	<form class="form" action="" id="customerForm"  method="post">
        		        <div>
        		            <label for="u-fname" class="custom-label">First Name</label> <br>
        		            <input id="u-fname" class="custom-input" type="text" name="first_name" > <br>
        		        </div>
        		        <div>
        		            <label for="u-lname" class="custom-label">Last Name</label> <br>
        		            <input id="u-lname" class="custom-input" type="text" name="last_name" > <br>
        		        </div>
        		        <div>
        		            <label for="u-street" class="custom-label">Street</label> <br>
        		            <input id="u-street" class="custom-input" type="text" name="street" > <br>
        		        </div>
        		        <div>
        		            <label for="u-address" class="custom-label">Address</label> <br>
        		            <input id="u-address" class="custom-input" type="text" name="address" > <br>
        		        </div>
        		        <div> 
        		            <label for="u-city" class="custom-label">City</label> <br>
        		            <input id="u-city" class="custom-input" type="text" name="city" > <br>
        		        </div>
        		        <div>
        		            <label for="u-state" class="custom-label">State</label> <br>
        		            <input id="u-state" class="custom-input" type="text" name="state" > <br>
        		        </div>
        		        <div>
        		            <label for="u-email" class="custom-label">Email</label> <br>
        		            <input id="u-email" class="custom-input" type="text" name="email" > <br>
        		        </div>
        		        <div>
        		            <label for="u-phone" class="custom-label">Phone</label> <br>
        		            <input id="phone" class="custom-input" type="text" name="phone"> <br>
        		        </div>
        		        <button type="u-submit" onclick="toogleUpdareForm()" class="custom-btn submit-btn">Submit</button>
        		    </form>
        	      </div>
	    </div>
	    
	    
	    
    </div>
    <script>
        window.onload = function() {
            fetch('Home', {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json'
                }
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('API Request Failed with response code: ' + response.status);
                }
                
                return response.json();
            })
            .then(responseData => {
                console.log("Home Res:", responseData);
                
                <c:set var="customers" value="${responseData}" />
                updateContent(responseData);
            })
            .catch(error => {
                console.error('Error:', error);
                
                document.getElementById("responseDiv").innerHTML = "<p>Error fetching customer data</p>";
            });
        };
  
        function updateContent(customers) {
           
            var contentDiv = document.getElementById("responseDiv");
            
            if (customers.length > 0) {
                
                contentDiv.innerHTML = "";
               
                customers.forEach(function(customer) {
                	var contentSubDiv = document.createElement("div");
                    contentSubDiv.classList.add("content-sub-container");
                    
                    
                    var fName = document.createElement("p");
                    fName.classList.add("key-fname");
                    fName.textContent = customer.first_name;
                    contentSubDiv.appendChild(fName);
                    
                    var lName = document.createElement("p");
                    lName.classList.add("key-lname");
                    lName.textContent = customer.last_name;
                    contentSubDiv.appendChild(lName);
                    
                    var address = document.createElement("p");
                    address.classList.add("key-address");
                    address.textContent = customer.address;
                    contentSubDiv.appendChild(address);
                    
                    var city = document.createElement("p");
                    city.classList.add("key-city");
                    city.textContent = customer.city;
                    contentSubDiv.appendChild(city);

                    var state = document.createElement("p");
                    state.classList.add("key-state");
                    state.textContent = customer.state;
                    contentSubDiv.appendChild(state);
                    
                    var pEmail = document.createElement("p");
                    pEmail.classList.add("key-email");
                    pEmail.textContent =customer.email;
                    contentSubDiv.appendChild(pEmail);

                    var pPhone = document.createElement("p");
                    pPhone.classList.add("key-phone");
                    pPhone.textContent = customer.phone;
                    contentSubDiv.appendChild(pPhone);
                    
                    var iconContainer = document.createElement("div");
                    iconContainer.classList.add("key-action");
                    
                    var deleteIcon = document.createElement("i");
                    deleteIcon.classList.add("fa", "fa-minus-circle", "delete-icon");
                    deleteIcon.id= "delete";
                    iconContainer.appendChild(deleteIcon);
                    
                    
                    var editIcon = document.createElement("i");
                    editIcon.classList.add("fa", "fa-pencil", "edit-icon");
                    iconContainer.appendChild(editIcon);

                    editIcon.addEventListener('click', function() {
                    	toogleUpdareForm();
                    	updateCustomer(customer);	
                    })
                    
                    deleteIcon.addEventListener('click', function() {
                    	fetch('Delete', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'X-UUID': customer.uuid
                            }
                        })
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('API Request Failed with response code: ' + response.status);
                            }
                           
                            return response.json();
                        })
                        .then(responseData => {
                            console.log("Delete Res:", responseData);
                            contentDiv.removeChild(contentSubDiv);
                           
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            document.getElementById("responseDiv").innerHTML = "<p>Error fetching customer data</p>";
                        });
                     });
				   contentSubDiv.append(iconContainer);
                    
                    contentDiv.appendChild(contentSubDiv);
                });
            } else {
                
                contentDiv.innerHTML = "<p>No customer data available.</p>";
            }
        }
        
        function toggleForm() {
            var form = document.getElementById("myForm");
            if (form.style.display === "none") {
                form.style.display = "block";
            } else {
                form.style.display = "none";
            }
        }
        
        function toogleUpdareForm(){
        	 var form = document.getElementById("updateForm");
             if (form.style.display === "none") {
                 form.style.display = "block";
             } else {
                 form.style.display = "none";
             }
        }
        
        
        function updateCustomer(customer){
               
        	 document.getElementById("u-fname").value = customer.first_name;
             document.getElementById("u-lname").value = customer.last_name;
             document.getElementById("u-street").value = customer.street;
             document.getElementById("u-address").value = customer.address;
             document.getElementById("u-city").value = customer.city;
             document.getElementById("u-state").value = customer.state;
             document.getElementById("u-email").value = customer.email;
             document.getElementById("u-phone").value = customer.phone;
        }
        
        
        document.getElementById("customerForm").addEventListener("submit", function (event) {
        	  event.preventDefault(); 

        	 
        	  const formData = new FormData(event.target);

        	  
        	  fetch("<%= request.getContextPath() %>/Update", {
        	    method: "POST",
        	    body: formData,
        	  })
        	    .then((response) => {
        	      if (!response.ok) {
        	        throw new Error("API Request Failed with response code: " + response.status);
        	      }
        	      return response.json();
        	    })
        	    .then((responseData) => {
        	      console.log("API Response:", responseData);
 
        	    })
        	    .catch((error) => {
        	      console.error("Error:", error);
        	     
        	    });
        	});
        	
        document.getElementById("myForm").addEventListener("submit", function (event) {
      	  event.preventDefault(); 
      	  
      	  const formData = new FormData(event.target);

      	 
      	  fetch("<%= request.getContextPath() %>/Update", {
      	    method: "POST",
      	    body: formData,
      	  })
      	    .then((response) => {
      	      if (!response.ok) {
      	        throw new Error("API Request Failed with response code: " + response.status);
      	      }
      	      return response.json();
      	    })
      	    .then((responseData) => {
      	      
      	      
      	      console.log("API Response:", responseData);
      	      
      	    })
      	    .catch((error) => {
      	      console.error("Error:", error);
      	     
      	    });
      	});
     
    </script>
</body>
</html>
