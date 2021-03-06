<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">




<title>Online Shopping - ${title}</title>


<script>
	window.menu = '${title}'
	window.contextRoot = '${contextRoot}'
</script>

<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- FONTS AWESOME CSS -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">



<!-- Custom styles for this template -->
<link href="${css}/bootstrap-readable-theme.css" rel="stylesheet">


<!-- Datatables styling-->
<link href="${css}/dataTables.bootstrap4.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/myapp.css" rel="stylesheet">


</head>

<body>

	<div class="wrapper ">

		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<a class="navbar-brand" href="${contextRoot}/home"><img src="${images}/logooo.JPG"  height="50px"  width="120px"  /></a>
				</div>
			</div>
		</nav>

		<!-- Page Content -->
		<div class="content ">
		
			
   <div class="container">
  <%--display when credentials are wrong --%>
       <c:if test="${not empty message}">
		<div class="row">
			<div class="col-xs-12 col-md-offset-2 col-md-8">
				<div class="alert alert-danger">${message}</div>
			</div>
		</div>
	</c:if>
	<%--display when userr logged out --%>
	<c:if test="${not empty logout}">
		<div class="row">
			<div class="col-xs-12 col-md-offset-2 col-md-8">
				<div class="alert alert-success">${logout}</div>
			</div>
		</div>
	</c:if>
	
	
    <div class="row">
     
     <div class="col-md-offset-3 col-md-6">
      
     
    
    
    
    
    
    
    
    
    <div class="card mb-3" style="max-width: 540px;">
  <div class="row no-gutters">
    <div class="col-md-4">
      <img src="${images}/logi.jpg" class="card-img" alt="...">
    </div>
    <div class="col-md-8">
    
      <div class="card-body">
        <form action="${contextRoot}/login" method="POST" class="form-horizontal"
         id="loginForm"
        >
         <div class="form-group">
          <label for="username" class="col-md-4 control-label">Email: </label>
          <div class="col-md-8">
           <input type="text" name="username" id="username" class="form-control"/>
          </div>
         </div>
         <div class="form-group">
          <label for="password" class="col-md-4 control-label">Password: </label>
          <div class="col-md-8">
           <input type="password" name="password" id="password" class="form-control"/>
          </div>
         </div>
         <div class="form-group">
          <div class="col-md-offset-4 col-md-8">
           <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
           <input type="submit" value="Login" class="btn btn-primary"/>
           <div class="text-right">
                <a href="${contextRoot}/register" >Register </a>
        </div>
               
          </div>
         </div>
        </form>
      </div>
    </div>
  </div>
</div>
    
    
    
    
    
    
    
     </div>
     
    </div>    
   
   </div>

			
		</div>
		</div>
		
		<!-- Footer -->
		<%@include file="./shared/footer.jsp"%>


		<!-- JQuery -->
		<script src="${js}/jquery.js"></script>

		<!-- jquery validation Script -->
		<script src="${js}/jquery.validate.js"></script>

		<!-- Bootstrap core JavaScript -->
		<script src="${js}/bootstrap.bundle.min.js"></script>




		<!-- Self coded javascript -->
		<script src="${js}/myapp.js"></script>




	</div>
</body>

</html>
