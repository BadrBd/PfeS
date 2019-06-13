<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
	<div class="container">
	   
		<a class="navbar-brand" href="${contextRoot}/home"> <img src="${images}/logooo.JPG"  height="35px"  width="120px" /> </a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">

				<li class="nav-item" id="about"><a class="nav-link"
					href="${contextRoot}/about"><span style="color: Green;"><i class="fab fa-autoprefixer"></i></span>bout</a></li>

				<li class="nav-item" id="contact"><a class="nav-link"
					href="${contextRoot}/contact"><span style="color: Green;"><i class="fab fa-cuttlefish"></i></span>ontact</a></li>
				<li class="nav-item" id="listProducts"><a class="nav-link"
					href="${contextRoot}/show/all/products"><span style="color: Green;"><i class="fas fa-eye"></i></span>&nbsp;View Products</a></li>
                
                
                <security:authorize access="hasAuthority('ADMIN')">
				<li class="nav-item" id="manageProducts"><a class="nav-link"
					href="${contextRoot}/manage/products"><span style="color: Green;"><i class="fas fa-tasks"></i></span>&nbsp;Manage Products</a></li>
                	</security:authorize>

			</ul>



			<ul class="nav navbar-nav navbar-right">
			<security:authorize access="isAnonymous()">
			<li class="nav-item" id="register"><a class="nav-link"
					href="${contextRoot}/register"><span style="color: Green;"><i class="fas fa-user-plus"></i></span>&nbsp;SignUP</a></li>

				<li class="nav-item" id="login"><a class="nav-link"
					href="${contextRoot}/login"><span style="color: Green;"><i class="fas fa-sign-in-alt"></i></span>&nbsp;LOGIN</a></li>
				</security:authorize>	
					
			
			
				<security:authorize access="isAuthenticated()">
						<li class="dropdown" id="userCart">
						  <a class="btn btn-default dropdown-toggle" href="javascript:void(0)" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
						   <span style="color: Green;"><i class="fas fa-user"></i></span>
						   &nbsp;${userModel.fullName}
						    <span class="caret"></span>
						  </a>
						  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
		                    <security:authorize access="hasAuthority('USER')">
			                    <li id="cart">
			                        <a href="${contextRoot}/cart/show">
			                 &#160;&#160; &#160;&#160;	${userModel.cart.cartLines}&#160;<span class="fas fa-shopping-cart"></span> - ${userModel.cart.grandTotal} DH 
			                        </a>
			                    </li>		     
			                	<li role="separator" class="divider"></li>	                                   
		                    </security:authorize>
							<li id="logout">
		                      </br>&#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160;&#160; <a href="${contextRoot}/perform-logout"><i class="fas fa-sign-out-alt"></i>Logout</a>
		                    </li>                    			    	
						  </ul>		
						</li>    			    
			    	</security:authorize>     	
			
			
			</ul>
		</div>
	</div>
</nav>

<script>
window.userRole = '${userModel.role}';
</script>









