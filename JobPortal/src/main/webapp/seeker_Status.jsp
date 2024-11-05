<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@page import="Model.*"%>
<%@page import="Model.Registration"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Applications</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">	
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}
.Header {
	background-image: url("images/homebg.jpg");
	height: 300px;
	width: 100%;
	border-image: fill 0 linear-gradient(#0001, #000);
	background-attachment: fixed;
}

.main {
	justify-content: end;
	font-family: calibri;
	color: white;
	padding-top: 0px;
}
.cad {
  height: 200px; /* Fixed height */
  overflow-y: auto; /* Enable scrolling */
  border: 1px solid #ddd;
}
.search{
margin-left: 170px;
border-radius: 10px;
}


.progress-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 80%;
    position: relative;
    margin-top:20px;
    margin-left: -30px;
}

.progress {
    position: absolute;
    height: 50px;
    background-color: #4caf50;
    top: 0;
    left: 0;
    right: 0;
    z-index: 0;
}

.circle {
    width: 20px;
    height: 20px;
    background-color: orange;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1;
    position: relative;
    font-size: 12px;
}

.completed {
    background-color: #4caf50;
    color: #fff;
}

.active {
    background-color: #4caf50;
    color: #fff;
}

.lab {
    display: flex;
    
    margin-left: -40px;
   
}

.date-container span {
    font-size: 14px;
    color: #999;
    text-align: center;
    width: 100px;
}
.button {
	background-color: red;
	border: 1px solid #03BFCB;
	border-radius: 10px;
	color: #231E39;
	font-family: Montserrat, sans-serif;
	font-weight: 500;
	margin-top:25px;
	margin-left: -40px;
	padding: 7px 15px;
}
.button:hover{
background-color: #231E39;
color: #23c686;
}
/* Basic input styling */
#search {
    border: 2px solid transparent;
    padding: 10px;
    border-radius: 10px;
    width: 70%;
    outline: none;
    background-color: #fff;
    position: relative;
    z-index: 1;
}

/* Background with border gradient effect */
#search {
    background: linear-gradient(white, white) padding-box, /* To fill the input area */
                linear-gradient(to right,#212529, #23c686,#212529) border-box; /* Gradient border */
    transition: border 0.4s, background-position 0.4s ease-in-out;
}

/* Focus state to trigger the border animation */
#search:focus {
    background-position: 100% 0;
    border-color: transparent; /* Border still transparent as the gradient handles it */
    background-size: 300% 100%; /* To animate from left to right */
}
.job-card {
            border: none;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            
        }
        .job-card:hover{
        	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.5); /* Increase shadow for a popping effect */
   transform:scale(1.01);
  
        }
</style>
</head>
<body style="background-color: #f9f9f9">
	<%@include file="header.jsp"%>
	<div class="Header">
		<div class="main">
			<center>
				<h2
					style="padding-top: 150px; letter-spacing: 2px; font-size: 50px;">
					<b>Job Applications</b>
				</h2>
				<div class="row">
					<div class="col-5"></div>
					<div class="col-1">
						<a href="home.jsp"
							style="justify-content: end; font-family: calibri; color: white; margin-left: 0px;">Home</a>
					</div>
					<div class="col-2">
						<p style="margin-left: -130px;">>> Application Status</p>
					</div>
					<div class="col-4"></div>
				</div>

			</center>
		</div>
	</div>
	
	<div class="container-fluid mt-4 mb-4">
		<div class="row">			
			<div class="col-12">
				<div class="card" style="background-color: white; height: auto; box-shadow: 0px 10px 15px -10px rgba(0, 0, 0, 0.5),0px -5px 15px -5px rgba(0, 0, 0, 0.5); /* Top shadow */margin-left: 30px; margin-right: 30px; border-radius: 10px;" >
					
						<input class="form-control mt-3 search" id="search" type="text" placeholder="Search Application..." style="width:70%;">
					
					<div class="row  ml-3 mr-3 mb-3 mt-3" id="container">
						<div class="col-12">
							<div class="card cad p-1" style="background-color: #f9f9f9; height: 500px; border-radius: 10px;">
								<div style="height: 15px;"></div>
								<%
										
						Registration s1 = new Registration(session);
						
						ArrayList<Applications> ap=s1.getApplications();
							
						Iterator<Applications> itr = ap.iterator();
						while (itr.hasNext()) {
							System.out.println("iterator reg");
							Applications a = itr.next();
							System.out.println(a.getJobId());
							Jobs j = s1.getJobById(a.getJobId());
							String step = a.getStatus();
							int currentStep=1;
							
							
						%>
								
								<div class="card ml-4 mr-4 mt-2 job-card" style="background-color: white;" id="card">
									<div class="row">
										<div class="col-2">
											<img src="images/homebg.jpg" alt="Logo" class="m-1 mt-3 ml-3" width="70%" height="70%">
										</div>
										<div class="col-5 mt-1 mb-1 pr-0">
											<h5><%= j.getJobTitle() %></h5>
                        					<h6><%= j.getCompanyName() %></h6>
                        					<div class="company-info">
                        						<span class="mr-4"><i class="bi bi-calendar-check-fill"></i> <%= a.getApplied_date() %></span>
                            					<span class="mr-4"><i class="bi bi-calendar-x-fill"></i> <%= j.getApplicationDeadline() %></span>
                            					<span><i class="bi bi-cash-stack"></i> <%= j.getSalary() %> LPA</span>
                            				</div>
										</div>
										<div class="col-4">
											<div class="progress-container">
											<%switch (step) {
										    	case "accepted":%>
										    		<div class="progress" id="progress" style="background-color: green; height: 20px; border-radius: 10px; width: 53%;"></div>
    												<div class="circle completed"></div>
    												<div class="circle completed"></div>
    												<div class="circle"></div>
    												
								    				<% break;
								    			case "responed":%>
								    				<div class="progress" id="progress"  style="background-color: green; height: 20px; border-radius: 10px;"></div>
    												<div class="circle completed"></div>
    												<div class="circle completed"></div>
    												<div class="circle active"></div>
								        			<% break;
								    			case "cancelled":%>
							    					<div class="progress" id="progress bg-danger" style="background-color: red; height: 20px; border-radius: 10px;"></div>
													<div class="circle bg-danger"></div>
													<div class="circle bg-danger"></div>
													<div class="circle bg-danger"></div>
							        			<% break;
								    			default:%>
								    					<div class="progress" id="progress" style="height: 20px; border-radius: 10px;"></div>
    													<div class="circle completed"></div>
    													<div class="circle "></div>
    													<div class="circle "></div>
								        		<% break;
											} %>
    											
											</div>
											<%if(step.equals("cancelled")){ %>
											<div class="lab mt-0">
												<div class="" style="color:red; margin-left: 60px;"><span><b>Application Cancelled</b></span></div>
												
											</div>
											</div>
											<div class="col-1">
											<form action="register" method="post">
												<input type="hidden" value="<%=a.getAppId() %>" name="AppID">
												<button class="button" type="submit" name="DeleteApp"><b>Delete</b></button>
											</form>	
											</div>
											<%}else{ %>
											<div class="lab mt-0">
												<div ><span><b>Pending</b></span></div>
												<div class="ml-5"><span><b>Accepted</b></span></div>
												<div class="ml-5"><span><b>Responded</b></span></div>
											</div>
											</div>
											<div class="col-1">
											<form action="register" method="post">
												<input type="hidden" value="<%=a.getAppId() %>" name="AppID">
												<button class="button" type="submit" name="DeleteApp"><b>Delete</b></button>
											</form>
											</div>
											<%} %>
										
									</div>
								</div>
								<%} %>
							</div>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div>

</body>
<footer><%@include file="footer.jsp"%></footer>
<script>
$(document).ready(function(){
    $("#search").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $(".job-card").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });
});
</script>


</html>