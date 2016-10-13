var init_friend_lookup;

init_friend_lookup = function(){
	$("#look-up-friend-form").on('ajax:before', function(event, data, status){
		$('#spin-lookup').show(); 
		$('#search-friend-cont').hide();
	});
	$("#look-up-friend-form").on('ajax:after', function(event, data, status){
		$('#spin-lookup').hide(); 
		$('#search-friend-cont').show();
	});
	$("#look-up-friend-form").on('ajax:success', function(event, data, status){
		$('#customer-main-block').replaceWith(data);
		$('#customer-lookup-results').addClass('animated fadeIn');
		init_friend_lookup(); 
	});
	$("#look-up-friend-form").on('ajax:error', function(event, xhr, status, error){
		$('#customer-lookup-results').replaceWith(' ');
		$('#lookup-errors').text('Data Not Found');
		$('#spin-lookup').hide(); 
		$('#search-friend-cont').show();
	});
}
$(document).on('turbolinks:load', init_friend_lookup);
$(document).ready(init_friend_lookup);
$(document).bind('page:change', init_friend_lookup);


var init_employee_lookup;

init_employee_lookup = function(){
	$("#look-up-employee-form").on('ajax:before', function(event, data, status){
		$('#spin-employee-lookup').show(); 
		$('#search-employee-cont').hide();
	});
	$("#look-up-employee-form").on('ajax:after', function(event, data, status){
		$('#spin-employee-lookup').hide(); 
		$('#search-employee-cont').show();
	});
	$("#look-up-employee-form").on('ajax:success', function(event, data, status){
		$('#employee-main-block').replaceWith(data);
		$('#employee-lookup-results').addClass('animated fadeIn');
		init_employee_lookup(); 
	});
	$("#look-up-employee-form").on('ajax:error', function(event, xhr, status, error){
		$('#employee-lookup-results').replaceWith(' ');
		$('#employee-lookup-errors').text('Data Not Found');
		$('#spin-employee-lookup').hide(); 
		$('#search-friend-cont').show();
	});
}
$(document).on('turbolinks:load', init_employee_lookup);
$(document).ready(init_employee_lookup);
$(document).bind('page:change', init_employee_lookup);