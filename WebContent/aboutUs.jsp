<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@page import="com.UTC.dto.MemberDto"%> 

<!DOCTYPE html>
<html lang="en">
<head>
  <title>UTC About Us</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <style type="text/css">
  
  body {
      font: 400 20px/1.8 Lato, sans-serif;
      color: black;
  }
  h3, h4 {
      margin: 10px 0 30px 0;
      letter-spacing: 10px;      
      font-size: 30px;
      color: black;
  }
  
  .carousel-inner img {
      -webkit-filter: grayscale(90%);
      filter: grayscale(90%); /* make all photos black and white */ 
      width: 100%; /* Set width to 100% */
      margin: auto;
  }

  textarea {
      resize: none;
  }
  
  </style>
</head>



<body id="myPage" data-spy="scroll">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
  <a class="navbar-brand" href="admin_main.jsp">UTC</a>
 </nav>


<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="img/kh1.jpg" style="width:100%">
        <div class="carousel-caption">
          <h3 style="color:black;">A Lot of Fun</h3>
          <p style="color:black;">We had a lot of fun having this project done.</p>
        </div>      
      </div>

      <div class="item">
        <img src="img/kh2.jpg" style="width:100%">
        <div class="carousel-caption">
          <h3 style="color:black;">Too Fun to Go to Sleep</h3>
          <p style="color:black;">Thanks to this project, we have not ready gone to sleep well. But after few tries, I found it is fun.
          From those days we're trying, we got way better than before.
          </p>
        </div>      
      </div>
	</div>
	
    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>

<!-- Container (The Band Section) -->
<div id="band" class="container text-center">
  <h3>Semi-colon</h3>
  <p><em>Our Name</em></p>
  <p>
  Our name doesn't mean anything actually. We didn't want to spend too much time naming ourselves.
  I hope someday this name will mean something as we saved our time a bit.
  <br/>
  As we were learning UI(user interface), we wished that there would be good sources to show us some codes that help us understand.
  We didn't really find really good one. And after some discussion and talks we decided to make that site by ourselves.
  And now we are seeing this as an awesome idea. If it gets better than it is now, that would be way greater for students out there who wish to learn about UI, codes and tags.
  Please encourage us to make it better. Thanks!
  </p>
  <br>
</div>

<!-- Container (Contact Section) -->
<div id="contact" class="container">
  
  
    <h3 class="text-center">From The Blog</h3>  
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">WonSil</a></li>
    <li><a data-toggle="tab" href="#menu1">DongMin</a></li>
    <li><a data-toggle="tab" href="#menu2">SeongEun</a></li>
    <li><a data-toggle="tab" href="#menu3">KyeongSoo</a></li>
    <li><a data-toggle="tab" href="#menu4">KangIll</a></li>
    <li><a data-toggle="tab" href="#menu5">WooJoo</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
		<div class="container-fluid" style="margin-top:30px">
			<div class="row">
				<div class="col-md-4">
					<div align="left">
						<img class="img-circle" src="img/kh1.jpg" style="width:300px; height:300px" >
					</div>
				</div>
				<div class="col-md-8">
					<div>
						<h2>WonSil</h2>
      					<p>Man, we've been on the road for some time now. Looking forward to lorem ipsum.</p>
					</div>
				</div>
			</div>
		</div>
      
    </div>
    <div id="menu1" class="tab-pane fade">
    	<div class="container-fluid" style="margin-top:30px">
			<div class="row">
				<div class="col-md-4">
					<div align="left">
						<img class="img-circle" src="img/kh1.jpg" style="width:300px; height:300px" >
					</div>
				</div>
				<div class="col-md-8">
					<div>
						<h2>DongMin</h2>
      					<p>Always a pleasure people! Hope you enjoyed it as much as I did. Could I BE.. any more pleased?</p>
					</div>
				</div>
			</div>
		</div>
     
    </div>
    <div id="menu2" class="tab-pane fade">
    	<div class="container-fluid" style="margin-top:30px">
			<div class="row">
				<div class="col-md-4">
					<div align="left">
						<img class="img-circle" src="img/kh1.jpg" style="width:300px; height:300px" >
					</div>
				</div>
				<div class="col-md-8">
					<div>
						<h2>SeongEun</h2>
      					<p>I mean, sometimes I enjoy the show, but other times I enjoy other things.</p>
					</div>
				</div>
			</div>
		</div>
      
    </div>
    <div id="menu3" class="tab-pane fade">
    	<div class="container-fluid" style="margin-top:30px">
			<div class="row">
				<div class="col-md-4">
					<div align="left">
						<img class="img-circle" src="img/kh1.jpg" style="width:300px; height:300px" >
					</div>
				</div>
				<div class="col-md-8">
					<div>
						<h2>KyeongSoo</h2>
      					<p>I mean, sometimes I enjoy the show, but other times I enjoy other things like... you know when you are alone and ..</p>
						
					</div>
				</div>
			</div>
		</div>
      
    </div>
    <div id="menu4" class="tab-pane fade">
    	<div class="container-fluid" style="margin-top:30px">
			<div class="row">
				<div class="col-md-4">
					<div align="left">
						<img class="img-circle" src="img/kh1.jpg" style="width:300px; height:300px" >
					</div>
				</div>
				<div class="col-md-8">
					<div>
						<h2>KangIll</h2>
      					<p>Something you say</p>
					</div>
				</div>
			</div>
		</div>
      
    </div>
    <div id="menu5" class="tab-pane fade">
       	<div class="container-fluid" style="margin-top:30px">
			<div class="row">
				<div class="col-md-4">
					<div align="left">
						<img class="img-circle" src="img/kh1.jpg" style="width:300px; height:300px" >
					</div>
				</div>
				<div class="col-md-8">
					<div>
						<h2>WooJoo</h2>
      					<p>Put some words here</p>
					</div>
				</div>
			</div>
		</div>
    </div>
  </div>



	<br>
	<br>
	<br>
	<br>
	<hr>
	
	<h3 class="text-center">Contact</h3>
  <p class="text-center"><em>We love our fans! And there is no such thing like fans for us! They never existed in the first place!</em></p>
  <div class="row">
    <div class="col-md-4">
      <p>User? Drop a note.</p>
      <p><span class="glyphicon glyphicon-map-marker"></span>Gangnam, Seoul</p>
      <p><span class="glyphicon glyphicon-phone"></span>Phone: +82 01093629318</p>
      <p><span class="glyphicon glyphicon-envelope"></span>Email: mandoo180@gmail.com</p>
    </div>
    <div class="col-md-8">
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea>
      <br>
      <div class="row">
        <div class="col-md-12 form-group">
          <button class="btn pull-right" type="submit">Send</button>
        </div>
      </div>
    </div>
  </div>
  <br>
</div>



<!-- Footer -->
<footer class="text-center">
  <a class="up-arrow" href="#myPage" data-toggle="tooltip" title="TO TOP">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a><br><br>
  <p>Bootstrap Theme Made By <a href="https://www.w3schools.com" data-toggle="tooltip" title="Visit w3schools">www.w3schools.com</a></p> 
</footer>

<script type="text/javascript">
</script>

</body>
</html>
