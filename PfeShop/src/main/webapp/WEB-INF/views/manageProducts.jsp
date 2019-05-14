<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="container">
	<div class="row">


		<c:if test="${not empty message}">

			<div class="col-xs-12 ">
				<div class="alert alert-success alert-dismissible">
					<button type="button" clase="close" data-dismiss="alert">&times;</button>
					${message}
				</div>
			</div>
		</c:if>

		<div class="col-md-10">

			<div class="panel default">

				<div class="panel-heading">
<br/>
					<h4>Product Management</h4>

				</div>

				<div class="panel-body">

					<sf:form class="form-horizontal" modelAttribute="product"
						action="${contextRoot}/manage/products" method="POST"
						enctype="multipart/form-data">
						<div class="form-group">
							<label class="control-label col-md-3">Name</label>
							<div class="col-md-8">
								<sf:input type="text" path="name" id="name" class="form-control"
									placeholder="Product Name" />
								<sf:errors path="name" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-3">Brand</label>
							<div class="col-md-8">
								<sf:input type="text" path="brand" id="brand"
									class="form-control" placeholder="Brand Name" />
								<sf:errors path="brand" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-3">Description</label>
							<div class="col-md-8">
								<sf:textarea path="description" id="description"
									class="form-control" placeholder="Enter your description here!" />
								<sf:errors path="description" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-3">Unit Price</label>
							<div class="col-md-8">
								<sf:input type="number" path="unitPrice" id="unitPrice"
									class="form-control" placeholder="Enter Unit Price" />
								<sf:errors path="unitPrice" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-3">Quantity</label>
							<div class="col-md-8">
								<sf:input type="number" path="quantity" id="quantity"
									class="form-control" placeholder="Enter Quantity" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-3">Enter an image</label>
							<div class="col-md-8">
								<sf:input type="file" path="file" id="file" class="form-control" />
								<sf:errors path="file" cssClass="help-block" element="em" />
							</div>
						</div>


						<div class="form-group">
							<label class="control-label col-md-3" for="categoryId">Category</label>
							<div class="col-md-8">
								<sf:select id="categoryId" path="categoryId"
									items="${categories}" itemLabel="name" itemValue="id"
									class="form-control" />
								<c:if test="${product.id == 0 }">
									<div class="text-right">
										<br />
										<button type="button" class="btn btn-warning btn-xs"
											data-toggle="modal" data-target="#myCategoryModal">Add
											New Category</button>
								</c:if>

							</div>
						</div>



						<div class="form-group">

							<div class="col-md-offset-3 col-md-8">
								<input type="submit" name="submit" id="submit"
									class="btn btn-primary" />


								<sf:hidden path="id" />
								<sf:hidden path="code" />
								<sf:hidden path="supplierId" />
								<sf:hidden path="purchases" />
								<sf:hidden path="active" />
								<sf:hidden path="views" />

							</div>
						</div>
						
						</sf:form>
				</div>




				


			</div>
		</div>
	</div>
	

	<br /> <br />

	<div class="row">


		<div class='col-xs-12'>

			
				<h3><br/>
					<b>Available products</b>
					<br/>
				</h3>
			

		</div>
		<div class='col-xs-10'>
			<div class="overflow-auto">


				<table id="adminProductsTable"
					class="table table-striped table-bordered">

					<thead>
						<tr>
							<th>Id</th>
							<th>&#160;</th>
							<th>Brand</th>
							<th>Name</th>

							<th>Qty. Avail</th>
							<th>Unit Price</th>
							<th>Activate</th>
							<th>Edit</th>
						</tr>
					</thead>


					<tfoot>
						<tr>
							<th>Id</th>
							<th>&#160;</th>
							<th>Brand</th>
							<th>Name</th>
							<th>Qty. Avail</th>
							<th>Unit Price</th>
							<th>Activate</th>
							<th>Edit</th>
						</tr>
					</tfoot>


				</table>

			</div>
		</div>
	</div>
</div>