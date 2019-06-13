<%@include file="../../shared/flows-header.jsp" %>	
<div class="container">

	<div class="row">
			<!--  To display all the goods -->
			<div class="col-md-6">
				
				<div class="row">
				
				
				
					<c:forEach items="${checkoutModel.cartLines}" var="cartLine">
					<div class="col-xs-12">
						<div class="card" style="width: 15rem;">
						
						<div class="card-header">
							<h3>${cartLine.product.name}</h3>
							</div>
							
							<div class="card-body">
							<h4>Quantity -${cartLine.productCount}</h4>
							<h5>Price -${cartLine.buyingPrice} DH</h5>							
							</div>					
						
						<div class="card-footer text-muted">
							<h3> ${cartLine.total} DH</h3>
							</div>
							
						
						</div>					
					</div>
					</c:forEach>
				</div>
				
				
			</div>
			
			<div class="col-md-6">
	            <div class="card border-success mb-3">
	                <div class="card-header">
	                    <h3 class="card-title">
	                        Payment Details
	                    </h3>
	                </div>
	                <div class="card-body text-primary">
	                    <form role="form">
	                    <div class="form-group">
	                        <label for="cardNumber">
	                            CARD NUMBER</label>
	                        <div class="input-group">
	                            <input type="text" class="form-control" id="cardNumber" placeholder="Valid Card Number"
	                                required autofocus />
	                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
	                        </div>
	                    </div>
	                    <div class="row">
	                        <div class="col-xs-7 col-md-7">
	                            <div class="form-group">
	                                <label for="expityMonth">EXPIRY DATE</label>
	                                <br/>
	                                <div class="col-xs-6 col-lg-6 pl-ziro">
	                                    <input type="text" class="form-control" id="expityMonth" placeholder="MM" required />
	                                </div>
	                                <div class="col-xs-6 col-lg-6 pl-ziro">
	                                    <input type="text" class="form-control" id="expityYear" placeholder="YY" required /></div>
	                            </div>
	                        </div>
	                        <div class="col-xs-5 col-md-5 pull-right">
	                            <div class="form-group">
	                                <label for="cvCode">
	                                    CV CODE</label>
	                                <input type="password" class="form-control" id="cvCode" placeholder="CV" required />
	                            </div>
	                        </div>
	                    </div>
	                    </form>
	                </div>
	                
	                
	                
	                
	                <div class="card-footer text-muted">
                    <ul class="nav nav-pills nav-stacked">
	                <li class="active"><a href="#"><span class="badge pull-right"> &#8377; ${checkoutModel.checkoutTotal}/-</span> Final Payment</a></li>
	            </ul>
                    </div>
                    
                    
                    
	            </div>
	           
	            <br/>
	            <a href="${flowExecutionUrl}&_eventId_pay" class="btn btn-success btn-lg btn-block" role="button">Pay</a>
			
			</div>

	</div>
</div>
<%@include file="../../shared/flows-footer.jsp" %>	