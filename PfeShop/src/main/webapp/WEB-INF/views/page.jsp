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
	<div class="wrapper">

		<!-- Navigation -->

		<%@include file="./shared/navbar.jsp"%>


		<!-- Page Content -->
		<div class="content">
			<c:if test="${userClickHome == true }">
				<%@include file="home.jsp"%>
			</c:if>


			<c:if test="${userClickAbout == true }">
				<%@include file="about.jsp"%>
			</c:if>


			<c:if test="${userClickContact == true }">
				<%@include file="contact.jsp"%>
			</c:if>

			<c:if
				test="${userClickAllProducts == true or userClickCategoryProducts == true }">
				<%@include file="listProducts.jsp"%>
			</c:if>

			<!-- Load only when user clicks show product -->
			<c:if test="${userClickShowProduct == true}">
				<%@include file="singleProduct.jsp"%>
			</c:if>

			<!-- Load only when user clicks manage product -->
			<c:if test="${userClickManageProducts == true}">
				<%@include file="manageProducts.jsp"%>
			</c:if>

		</div>

		<!-- Footer -->
		<%@include file="./shared/footer.jsp"%>


		<!-- JQuery -->
		<script src="${js}/jquery.js"></script>


		<!-- Bootstrap core JavaScript -->
		<script src="${js}/bootstrap.bundle.min.js"></script>

		<!-- Datatable plugin -->
		<script src="${js}/jquery.dataTables.js"></script>

		<!-- Datatable plugin -->
		<script src="${js}/dataTables.bootstrap4.js"></script>
		
		<!-- DataTable Bootstrap Script -->
		<script src="${js}/bootbox.min.js"></script>
		

		<!-- Self coded javascript -->
		<script src="${js}/myapp.js"></script>
		
		


	</div>
</body>

</html>
