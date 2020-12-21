<%@page import="in.co.rays.controller.MyProfileCtl"%>
<%@page import="in.co.rays.util.DataUtility"%>
<%@page import="java.util.List"%>
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
<script>
  $( function() {
    $( "#datepicker" ).datepicker({ 
    	changeMonth :true,
		  changeYear :true,
		  yearRange :'1980:2030',
		  dateFormat:'mm/dd/yy',
		  endDate: '-18y'	 
		
    	
		 }) ;
  } );
  </script>
</head>
<body background="/Project_3/jsp/p3.png">

<% 	String uri = (String)request.getAttribute("uri");%>
<jsp:useBean id="dto" scope="request" class="in.co.rays.dto.UserDTO" />
<%@include file="Header.jsp" %>
<br>
<div class="container">

<div class="card bg-secondary text-white mx-auto" style="max-width: 400px; " >
<article class="card-body mx-auto" style="max-width: 400px;">
	
	
	<form action="<%=ORSView.MY_PROFILE_CTL %>" method="post">
	<!-- getting role list for preload -->
<%List list= (List)request.getAttribute("roleList"); %>
	
	
                        <%long id=DataUtility.getLong(request.getParameter("id")); %>
                       
                           <h3 class="text-center default-text py-3">My Profile: </h3>
                            
                          
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
       
        
     <h6 style="color: #20B2AA">Email<font color="red">*</font></h6>
    
    <div class="input-group mb-3">
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
		 </div>
        <input name="login" class="form-control" placeholder="Enter Email address" type="email" value="<%=DataUtility.getStringData(dto.getLoginId())%>">
    </div> <font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("login",request) %> </font>
    </div>
    <!-- form-group// -->
    
         
         <h6 style="color: #20B2AA">First Name<font color="red">*</font></h6>
         
         <div class="input-group mb-3">                   
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input name="firstName" class="form-control" placeholder="Enter first name" type="text" value="<%=DataUtility.getStringData(dto.getFirstName())%>">
    </div>
    <font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("firstName",request) %> </font>
    </div>
     <!-- form-group// -->
    
    <h6 style="color: #20B2AA">Last Name<font color="red">*</font></h6>
        
    <div class="input-group mb-3">
    <div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input name="lastName" class="form-control" placeholder="Enter last name" type="text" value="<%=DataUtility.getStringData(dto.getLastName())%>" >
    </div>
    <font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("lastName",request) %> </font>
</div>     <!-- form-group// -->
    
    <h6 style="color: #20B2AA">Mobile Number<font color="red">*</font></h6>
    
    <div class="input-group mb-3">
     <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
		</div>
    	<input name="mobileNo" class="form-control" placeholder="Enter mobile number" type="text"value="<%=DataUtility.getStringData(dto.getMobileNo())%>" >
    </div><font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("mobileNo",request) %> </font> 
    </div>
    <!-- form-group// -->
       
    <%HashMap<String,String> map=new HashMap<String,String>();
                           map.put("male", "male");
                           map.put("female","female");
                           String gender=HTMLUtility.getList("gender",dto.getGender(), map);
                           %>
    <h6 style="color: #20B2AA">Gender<font color="red">*</font></h6>
    
    <div class="input-group mb-3">
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i  class="fa fa-venus-mars"></i> </span>
		</div>
		<%=gender%>
	</div> <font color="red" class="ml-5"> <%=ServletUtility.getErrorMessage("gender", request) %></font>
	</div>
	<!-- form-group end.// -->
	
	<%-- 
     <%String role=HTMLUtility.getList("role",String.valueOf(dto.getRoleId()),list); %>
    
    <h6 style="color: #20B2AA">Role<font color="red">*</font></h6>
    
    <div class="input-group mb-3">
    <div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-venus"></i> </span>
		 </div>
<%=role%>
    </div> 
    <font color="red" class="ml-5"> <%=ServletUtility.getErrorMessage("role", request) %></font>
</div> 
        <!-- form-group// --> --%>
    
    <h6 style="color: #20B2AA">Date Of Birth<font color="red">*</font></h6>
       
       <div class="input-group mb-3">
       <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-calendar"></i> </span>
		 </div>
		 <%System.out.print(dto.getDob()); %>
        <input name="dob" class="form-control"  placeholder="Enter date of birth" readonly="readonly" type="text" id="datepicker" value="<%=DataUtility.getDate(dto.getDob())%>">
    </div> 
    <font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("dob",request) %> </font>
</div>
        <!-- form-group// -->
    
    
                                        
   
   
   <div class="form-group " align="center">
        <input type="submit" class="bg-success text-white" name="operation" value="<%=MyProfileCtl.OP_SAVE%>">   
                <input type="submit" class="bg-success text-white"  name="operation" value="<%=MyProfileCtl.OP_CHANGE_MY_PASSWORD%>">
     </div> <!-- form-group// -->  
   
       
</form>
</article>
</div> <!-- card.// -->

</div> 
<!--container end.//-->
<br><br><br>

<%@include file="Footer.jsp" %>
</body>
</html>