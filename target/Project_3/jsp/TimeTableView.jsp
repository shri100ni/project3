
<%@page import="in.co.rays.controller.FacultyCtl"%>
<%@page import="in.co.rays.controller.StudentListCtl"%>
<%@page import="in.co.rays.controller.MarksheetCtl"%>
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


function disableSunday(d){
	  var day = d.getDay();
	  if(day==0)
	  {
	   return [false];
	  }else
	  {
		  return [true];
	  }
}
$( function() {
  $( "#datepicker" ).datepicker({ 
  	beforeShowDay:disableSunday,
  	changeMonth :true,
		  changeYear :true,
		  yearRange: '0:+2',
		  dateFormat:'dd/mm/yy',
		  minDate:0
		 /*  endDate: '-9y' */  
		 }) ;
} );


  </script>


</head>
<body background="/Project_3/jsp/p3.png">

<% 	String uri = (String)request.getAttribute("uri");%>
<jsp:useBean id="dto" scope="request" class="in.co.rays.dto.TimeTableDTO" />
<%@include file="Header.jsp" %>
<br>
<div class="container">

<div class="card bg-secondary text-white mx-auto" style="max-width: 400px; " >
<article class="card-body mx-auto" style="max-width: 400px;">
	
	
	<form action="<%=ORSView.TIME_TABLE_CTL%>" method="post">
<%List courseList= (List)request.getAttribute("courseList"); 
List sujectList= (List)request.getAttribute("sujectList");
%> 
	<!-- getting role list for preload -->
	
	
                        <%long id=DataUtility.getLong(request.getParameter("id")); %>
                       
                           <h3 class="text-center default-text py-3"><%=(id==0)? "Add TimeTable": "Update TimeTable" %></h3>
                            
                          
                            <!--Body-->
                            
                            		<%if(ServletUtility.getSuccessMessage(request).length() > 0 && ServletUtility.getSuccessMessage(request) != null){ %>
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
         
          
    <%String course=HTMLUtility.getList("course",String.valueOf(dto.getCourseId()),courseList); %>
    
    <h6 style="color: #20B2AA">Course<font color="red">*</font></h6>
    
    <div class="input-group mb-3">
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-book"></i> </span>
		</div>
		<%=course%>
    </div> <font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("course",request) %> </font>
    </div>
    <!-- form-group// --> 
    
    <%String subject=HTMLUtility.getList("subject",String.valueOf(dto.getSubjectId()),sujectList); %>
    
    <h6 style="color: #20B2AA">Subject<font color="red">*</font></h6>
    
    <div class="input-group mb-3">
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-book"></i> </span>
		</div>
		<%=subject%>
    </div> <font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("subject",request) %> </font>
    </div>
    <!-- form-group// --> 
 
        
    <%HashMap<String,String> map=new HashMap<String,String>();
                           map.put("1", "1");
							map.put("2", "2");
							map.put("3", "3");
							map.put("4", "4");
							map.put("5", "5");
							map.put("6", "6");
							map.put("7", "7");
							map.put("8", "8");
							map.put("9", "9");
							map.put("10", "10");
                           String semester=HTMLUtility.getList("semester",dto.getSemester(), map);
                           %>
    <h6 style="color: #20B2AA">Semester<font color="red">*</font></h6>
    
    <div class="input-group mb-3">
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i  class="fa fa-columns"></i> </span>
		</div>
		<%=semester%>
	</div> <font color="red" class="ml-5"> <%=ServletUtility.getErrorMessage("semester", request) %></font>
	</div>
	<!-- form-group end.// -->
	
	 <h6 style="color: #20B2AA">Exam Date<font color="red">*</font></h6>
       
       <div class="input-group mb-3">
       <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-calendar"></i> </span>
		 </div>
        <input name="examdate" class="form-control"  placeholder="Enter Exam Date" readonly="readonly" type="text" id="datepicker" value="<%=DataUtility.getDateString(dto.getExamDate())%>">
    </div> 
    <font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("examdate",request) %> </font>
</div>
        <!-- form-group// -->
        
        <%HashMap<String,String> map1=new HashMap<String,String>();
            map1.put("08:00 AM to 11:00 AM", "08:00 AM to 11:00 AM");
			map1.put("12:00PM to 3:00PM", "12:00PM to 3:00PM");
			map1.put("3:00PM to 6:00PM", "3:00PM to 6:00PM");
             String examTime=HTMLUtility.getList("examTime", dto.getExamTime(), map1);
            		 %>        
         <h6 style="color: #20B2AA">Exam Time<font color="red">*</font></h6>
    
    <div class="input-group mb-3">
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i  class="fa fa-clock"></i> </span>
		</div>
		<%=examTime%>
	</div> <font color="red" class="ml-5"> <%=ServletUtility.getErrorMessage("examTime", request) %></font>
	</div>
	<!-- form-group end.// -->
        
    <h6 style="color: #20B2AA">Description<font color="red">*</font></h6>
         
         <div class="input-group mb-3">                   
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-align-left "></i> </span>
		 </div>
        <textarea name="description" class="form-control" placeholder="Enter description" type="text" value="<%=DataUtility.getStringData(dto.getDescription())%>"></textarea>
    </div>
    <font color="red" class="ml-5"><%=ServletUtility.getErrorMessage("description",request) %> </font>
    </div>
     <!-- form-group// --> 
  
      <%if (id>0){ %>                                   
    <div class="form-group " align="center">
        <input type="submit" class="bg-success text-white" name="operation" value="<%=FacultyCtl.OP_UPDATE%>">   
                <input type="submit" class="bg-warning text-white"  name="operation" value="<%=FacultyCtl.OP_CANCEL%>">
     </div> <!-- form-group// -->  
   
   <%}else{ %> 
   <div class="form-group " align="center">
        <input type="submit" class="bg-success text-white" name="operation" value="<%=FacultyCtl.OP_SAVE%>">   
                <input type="submit" class="bg-warning text-white"  name="operation" value="<%=FacultyCtl.OP_RESET%>">
     </div> <!-- form-group// -->  
   <%} %>
  
</form>
</article>
</div> <!-- card.// -->

</div> 
<!--container end.//-->

<br>
<%@include file="Footer.jsp" %>
</body>
</html>