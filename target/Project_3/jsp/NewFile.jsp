<%@page import="in.co.rays.util.ServletUtility"%>
<%@page import="in.co.rays.util.DataUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}

form {border: 3px solid #f1f1f1;}
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: auto;
}


button:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}





.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>

</head>

<body background="/Project_3/jsp/p3.png">

<% 	String uri = (String)request.getAttribute("uri");%>
<jsp:useBean id="dto" scope="request" class="in.co.rays.dto.UserDTO" />
<%@include file="Header.jsp" %>
<!-- <br><br> -->
<div align="center">
 <div class="col-lg-3"></div>
  <div class="col-lg-6">
  
  <h2 >Login Form</h2>


<form action="<%=ORSView.LOGIN_CTL %>" method="post">
       
                            		<%if(!ServletUtility.getSuccessMessage(request).equals("")){ %>
    <div class="alert alert-success alert-dismissible fade show">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Success!</strong><%=ServletUtility.getSuccessMessage(request) %>
    </div>
    <%} %>                            
	
	<%if(!ServletUtility.getErrorMessage(request).equals("")){ %>
<div class="alert alert-danger">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Error!</strong><font><%=ServletUtility.getErrorMessage(request) %></font>
  </div>
<%} %>             
  <div class="container">
  
    <label for="uname"><i class="fa fa-envelope"></i> <b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="login" value="<%=DataUtility.getStringData(dto.getLoginId())%>">
    <font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("login",request) %> </font>
    <label for="psw"><i class="fa fa-lock"></i> <b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" value="<%=DataUtility.getStringData(dto.getPassword())%>">
     <font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("password",request) %> </font>
   
   
    <button type="submit"  name="operation" value="<%=LoginCtl.OP_SIGN_IN%>">Login</button>
        <button type="submit" name="operation" value="<%=LoginCtl.OP_SIGN_UP%>">SingUp</button><br>
 <a href="<%=ORSView.FORGET_PASSWORD_CTL%>">Forgot password?</a>
    
 

  
  <input type="hidden" name="uri" value="<%=uri%>">
  <div class="col-lg-3"></div>
 </div>
</form>
</div>
<%@include file="Footer.jsp" %>

</body>
</html>