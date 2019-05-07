$(function() {

	// solving the active menu problem
	switch (menu) {

	case 'About Us':
		$('#about').addClass('active');
		break;
	case 'Contact Us':
		$('#contact').addClass('active');
		break;
	case 'All Products':
		$('#listProducts').addClass('active');
		break;
	default:
		if (menu == "Home")
			break;
		$('#listProducts').addClass('active');
		$('#a_' + menu).addClass('active');
		break;

	}

	// ocde for jquery datatable



	var $table = $('#productListTable');

	if ($table.length) {
		// console.log('inside the table');
		
		var jsonUrl = '';
		if (window.categoryId == '') {
			jsonUrl = window.contextRoot + '/json/data/all/products';
		} else {
			jsonUrl = window.contextRoot + '/json/data/category/'
					+ window.categoryId + '/products';
		}
		
		
		$table.DataTable({
			lengthMenu: [[3,5,10,-1],['3 Records','5 Records','10 Records','ALL']],
			pageLength: 5,
			ajax : {
				url : jsonUrl,
				dataSrc : ''
			},
			columns : [
				
				{
					data : 'name'
				},
				{
					data : 'brand'
				},
				{
					data : 'unitPrice',
					mRender : function(data, type, row) {
						return '&#8377; ' + data
					}
				},
				{
					data : 'quantity'
				},
				
				{
					data : 'id',
					bSortable : false,
					mRender : function(data, type, row) {

						var str = '';
						str += '<a href="'+ window.contextRoot+ '/show/'+ data+'/product" class="btn btn-primary"><i class="fas fa-eye fa-3x"></i></a>  &#160;';
						str += '<a href="'+ window.contextRoot+ '/cart/add'+ data+ '/product" class="btn btn-success"><i class="fas fa-cart-plus fa-3x"></i></a>';
						
									
							return str;	
					
					}
					}
			]
			
			
			
			
		});
		

	
	}
});