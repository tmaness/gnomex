<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<link rel="stylesheet" href="css/login.css" type="text/css" />
	<title>GNomEx Account Created</title>
</head>

<%
String message = (String) ((request.getAttribute("message") != null)?request.getAttribute("message"):"");
%>

<body>

<div class="header-bar" >
  <div class="left"><h1>GNomEx</h1></div>
  <div class="rightMenu" >
      <a href="login.jsp">Login</a>  | 
      <a href="change_password.jsp">Change password</a> |    
      <a href="reset_password.jsp">Reset password</a>            
  </div>
</div>

<div id="content" align="center" bgcolor="white">
 <div class="containerMessage">
    <h3>Account Registered.</h3>
    Your account has been created.  Please check your email for additional information.
 </div> 
</div>
</body>
</html>