<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@include file="../shared/flows-header.jsp"%>

<div class="container">


	<div class="row">

		<div class="col-md-6 col-md-offset-3">

			<div class="card">

				<div class="card-header">
					<h4>Sign Up - Personal</h4>
				</div>

				<div class="card-body">

					<sf:form method="POST" modelAttribute="user"
						class="form-horizontal" id="registerForm">


						<div class="form-group">
							<label>First Name</label>
							<div class="col-md-8">
								<sf:input type="text" path="firstName" class="form-control"
									placeholder="First Name" />
								<sf:errors path="firstName" cssClass="help-block" element="em" />
							</div>
						</div>


						<div class="form-group">
							<label class="control-label col-md-4">Last Name</label>
							<div class="col-md-8">
								<sf:input type="text" path="lastName" class="form-control"
									placeholder="Last Name" />
								<sf:errors path="lastName" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Email</label>
							<div class="col-md-8">
								<sf:input type="email" path="email" class="form-control"
									placeholder="abc@zyx.com" />
								<sf:errors path="email" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Contact Number</label>
							<div class="col-md-8">
								<sf:input type="text" path="contactNumber" class="form-control"
									placeholder="XXXXXXXXXX" maxlength="10" />
								<sf:errors path="contactNumber" cssClass="help-block"
									element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Password</label>
							<div class="col-md-8">
								<sf:input type="password" path="password" class="form-control"
									placeholder="Password" aria-describedby="passwordHelpBlock"/>
									<small id="passwordHelpBlock" class="form-text text-muted">
  Your password must be 8-20 characters long, contain letters and numbers, and must not contain spaces, special characters, or emoji.
</small>
								<sf:errors path="password" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Confirm Password</label>
							<div class="col-md-8">
								<sf:input type="password" path="confirmPassword"
									class="form-control" placeholder="Re-type password" />
								<sf:errors path="confirmPassword" cssClass="help-block"
									element="em" />
							</div>
						</div>


						<div class="form-group">
							<label class="control-label col-md-4">Select Role</label>
							<div class="col-md-8">
								<label class="radio-inline"> <sf:radiobutton path="role"
										value="USER" checked="checked" /> User
								</label> <label class="radio-inline"> <sf:radiobutton
										path="role" value="SUPPLIER" /> Supplier
								</label>
							</div>
						</div>


						<div class="form-group form-check">
							<input type="checkbox" class="form-check-input"
								id="exampleCheck1"> <label class="form-check-label"
								for="exampleCheck1">&nbsp; I've read and accepted the terms</label>
						</div>


						<div class="form-group">
							<div class="col-md-offset-4 col-md-8">
								<button type="submit" name="_eventId_billing"
									class="btn btn-success">
									Next <span class="fas fa-chevron-right"></span>
								</button>
							</div>
						</div>



					</sf:form>


				</div>


			</div>


		</div>


	</div>



</div>

<%@include file="../shared/flows-footer.jsp"%>
