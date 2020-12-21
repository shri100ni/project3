<%@page import="in.co.rays.controller.ChangePasswordCtl"%>
<%@page import="in.co.rays.util.DataUtility"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.controller.UserCtl"%>
<%@page import="in.co.rays.util.ServletUtility"%>
<%@page import="in.co.rays.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

<style  >
.divider-text {
    position: relative;
    text-align: center;
    margin-top: 15px;
    margin-bottom: 15px;
}
.divider-text span {
    padding: 7px;
    font-size: 12px;
    position: relative;   
    z-index: 2;
}
.divider-text:after {
    content: "";
    position: absolute;
    width: 100%;
    border-bottom: 1px solid #ddd;
    top: 55%;
    left: 0;
    z-index: 1;
}

.btn-facebook {
    background-color: #405D9D;
    color: #fff;
}
.btn-twitter {
    background-color: #42AEEC;
    color: #fff;
}
</style>
</head>
<body background="/Project_3/jsp/p3.png">

<% 	String uri = (String)request.getAttribute("uri");%>
<jsp:useBean id="dto" scope="request" class="in.co.rays.dto.UserDTO" />
<%@include file="Header.jsp" %>
<br>
<div class="container">

<div class="card bg-secondary text-white mx-auto" style="max-width: 400px; " >
<article class="card-body mx-auto" style="max-width: 400px;">
	
	
	<form action="<%=ORSView.CHANGE_PASSWORD_CTL %>" method="post">
	<!-- getting role list for preload -->
<%List list= (List)request.getAttribute("roleList"); %>
	
	
                        <%long id=DataUtility.getLong(request.getParameter("id")); %>
                       
                           <h3 class="text-center default-text py-3"><%=(id==0)? "Add User": "Update User" %></h3>
                            
                          
                            <!--Body-->
                            
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
		
            <input type="hidden" name="id" value="<%=dto.getId()%>">
            <input type="hidden" name="createdBy" value="<%=dto.getCreatedBy()%>">
            <input type="hidden" name="modifiedBy" value="<%=dto.getModifiedBy()%>">
            <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(dto.getCreatedDateTime())%>">
            <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(dto.getModifiedDateTime())%>">


         <h6 >Old Password:<font color="red">*</font></h6>           
         <div class="input-group mb-3">                   
	<div class="form-group input-group">
		<div class="input-group-prepend">
		
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input name="oldPassword" class="form-control" placeholder="Enter Your Password" type="password" value="<%=DataUtility.getString(request.getParameter("oldPassword") == null ? "" : DataUtility.getString(request.getParameter("oldPassword")))%>">
    </div>
    <font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("oldPassword",request) %> </font>
    </div>
     <!-- form-group// -->
    

    <h6 >New Password:<font color="red">*</font></h6>  
    <div class="input-group mb-3">
    <div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		 </div>
        <input name="newPassword" class="form-control" placeholder="Enter New Password" type="password" value="<%=DataUtility.getString(request.getParameter("newPassword") == null ? "" : DataUtility.getString(request.getParameter("newPassword")))%>">
    </div>
    <font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("newPassword",request) %> </font>
</div>     <!-- form-group// -->


    <h6 >Confirm Password:<font color="red">*</font></h6>  
    <div class="input-group mb-3">
     <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
    	<input name="confirmPassword" class="form-control" placeholder="Re-Enter Password" type="password" value="<%=DataUtility.getString(request.getParameter("confirmPassword") == null ? "" : DataUtility.getString(request.getParameter("confirmPassword")))%>">
    </div><font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("confirmPassword",request) %> </font> 
    </div>
    <!-- form-group// -->
    
    
                                       
    <div class="form-group " align="center">
        <input type="submit" class="bg-success text-white" name="operation" value="<%=ChangePasswordCtl.OP_SAVE%>">   
                <input type="submit" class="bg-success text-white"  name="operation" value="<%=ChangePasswordCtl.OP_CHANGE_MY_PROFILE%>">
     </div> <!-- form-group// -->  
   
  
</form>
</article>
</div> <!-- card.// -->

</div> 
<!--container end.//-->
<br>

<%@include file="Footer.jsp" %>
</body>
</html>