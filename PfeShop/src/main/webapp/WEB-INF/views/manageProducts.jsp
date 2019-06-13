<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="container">
	<div class="row">

</br>
		<c:if test="${not empty message}">

			<div class="col-xs-12 ">
				<div class="alert alert-dismissible alert-info">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					${message}
				</div>
			</div>
			
			
			
			
			
		</c:if>

		<div class=" container">

			<div class="card ">

				<div class="card-header text-white bg-success mb-3">
					<br />
					<center><h3>Add a Product</h3></center>

				</div>

				<div class="card-body">

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
							<label class="control-label col-md-3">Price</label>
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
								<sf:input type="file" path="file" id="file" class="form-control-file" aria-describedby="fileHelp" />
								<small id="fileHelp" class="form-text text-muted">Make sure to choose an image "jpg"</small>
								<sf:errors path="file" cssClass="help-block" element="em" />
							</div>
						</div>


						<div class="form-group">
							<label class="control-label col-md-3" for="categoryId">Category</label>
							<div class="col-md-8">
								<sf:select id="categoryId" path="categoryId"
									items="${categories}" itemLabel="name" itemValue="id"
									class="custom-select" />
								<c:if test="${product.id == 0 }">
									<div class="text-right">
										<br />
										<button type="button" class="btn btn-warning btn-sm"
											data-toggle="modal" data-target="#myCategoryModal">Add
											New Category</button>
								</c:if>

							</div>
						</div>



						<div class="form-group">

							<div class="col-md-offset-3 col-md-8">
								<input type="submit" name="submit" id="submit"
									class="btn btn-info" />


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

<br /><br />
			<h3>
				<br />  <u><b>Available products Management</b></u>&nbsp;<i class="fas fa-tools"></i><br />
			</h3>
<br />

		</div>
		<div class='col-xs-10 d-flex justify-content-center align-items-center container'>
			<div class='container-fluid'>
				<div class='table-responsive'>
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


	<div class="modal fade" id="myCategoryModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">


						<h5 class="modal-title" id="myModalLabel">New Category</h5>
					  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
				


				</div>

				<div class="modal-body">
					<sf:form id="categoryForm" class="form-horizontal"
						modelAttribute="category" action="${contextRoot}/manage/category"
						method="POST">

						<div class="form-group">


							<label class="control-label col-md-4">Name</label>
							<div class="col-md-8">
								<sf:input type="text" path="name"  id="category_name" class="form-control"
									placeholder="Category Name" />

							</div>
						</div>
						
						
						<div class="form-group">


							<label class="control-label col-md-4">Description</label>
							<div class="col-md-8">
								<sf:textarea cols="" rows="5" type="text" path="description"  id="category_description" class="form-control"
									placeholder="Enter category description here!" />

							</div>
						</div>
						
						
						<div class="modal-footer">

							
							
							<button type="submit" name="submit" value="Save" class="btn btn-primary">Save changes</button>
                             <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						</div>
						
						
					</sf:form>
				</div>
			</div>
		</div>

	</div>


</div>