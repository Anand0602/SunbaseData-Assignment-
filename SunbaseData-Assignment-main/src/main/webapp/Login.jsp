<html>
<head> 
  <title>My JSP Page</title>
  <link rel="stylesheet" type="text/css" href="./Login.css"></head>
<body>
<div class="login-container">
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
        if(isAuthenticated){
        	 response.sendRedirect("Home.jsp");
        }
        System.out.println(isAuthenticated);
        
    %>
	<div class="form-container">
		<h2 class="login-heading">Login Page</h2>
		<form action="Authentication" class="form" mothod="get">
			<label class="custom-label" for="username">Username</label>
			<input id="username" class="custom-input" type="text" placeholder="Username" name="username"/>
			<label class="custom-label" for="password">Password</label>
			<input id="password" class="custom-input"  type="password" placeholder="Password" name="password"/>
			<button class="login-button" type="submit">Login</button>
		</form>
	
	</div>
</div>

</body>
</html>
