// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-material-design
//= require turbolinks
//= require moment-with-locales.js
//= require bootstrap-datetimepicker.js
//= require welcome.js
//= require jquery.validate.js
//= require_tree .

function sideBarHeight(){
	var winHeight = $(window).height();
	var navBar = $(".navbar-default").height();
	$(".side-bar").height(winHeight-1);
}


// to hide the timpicker once clicked outside the time picker block 

function plansList(){

	$( "#renew_plan_" ).change(function() {
		if ($(this).val()=="") {
			$("#renew_amount").val("");
		}
		else
		{
			var planSelected = $(this).val();
			var tax = (planSelected*15)/100;
			var monthlyPay = parseInt(planSelected) + parseInt(tax);
			$("#renew_amount").val(monthlyPay);
		}
		
	});

	$( "#customer_net_plan" ).change(function() {
		if ($(this).val()=="") {
			$("#customer_payment_detail_attributes_plan_tax").val("");
			$("#customer_payment_detail_attributes_plan_cost").val("");
			$("#customer_payment_detail_attributes_monthly_payment_cost").val("");
		}
		else
		{
			var planSelected = $(this).val();
			var tax = (planSelected*15)/100;
			var monthlyPay = parseInt(planSelected) + parseInt(tax);
			
			var planCharge = $("#customer_payment_detail_attributes_plan_tax").val(tax);
			// console.log(planCharge)
			var planTax = $("#customer_payment_detail_attributes_plan_cost").val(planSelected);
			// console.log(planTax)
			$("#customer_payment_detail_attributes_monthly_payment_cost").val(monthlyPay);
		}
		
	});



	// $("#customer_net_plan").focus(function(){
	// 	 // $("html, body").animate({ scrollTop:  }, "fast");
	// 	$("#plan-list").fadeIn();
	// 	$("#plan-list li").each(function(){
	// 		$(this).click(function(){
	// 			$("#customer_net_plan").val($(this).text());
	// 			$("#plan-list").fadeOut('fast');
	// 			var planSelected = $(this).val();
	// 			var tax = (planSelected*15)/100;
	// 			var monthlyPay = planSelected + tax;
				
	// 			var planCharge = $("#customer_payment_detail_attributes_plan_tax").val(tax);
	// 			// console.log(planCharge)
	// 			var planTax = $("#customer_payment_detail_attributes_plan_cost").val(planSelected);
	// 			// console.log(planTax)
	// 			$("#customer_payment_detail_attributes_monthly_payment_cost").val(monthlyPay);
	// 		});
	// 	});

	// });


}


function addressCheckBox() {
	$("#planned_checked").change(function()
	 {
	      if($(this).prop('checked') == true)
	    {		
	    	  //BILLING ADDRESS
	          var addr = $("#customer_billing_address").val();
	          var pin_code = $("#customer_pin_no").val();
	          var telephone_no = $("#customer_billing_telephone_no").val();
	          var mobile_no = $("#customer_billing_mobile_no").val();
	          var email = $("#customer_billing_email").val();

	          //INSTALLATION ADDRESS
	          $("#customer_installation_address").val(addr);
	          $("#customer_installation_pin_no").val(pin_code);
	          $("#customer_installation_telephone_no").val(telephone_no);
	          $("#customer_installation_mobile_no").val(mobile_no);
	          $("#customer_installation_email").val(email);
	    }
	   else
	   {
	         $("#customer_installation_address").val("");
	         $("#customer_installation_pin_no").val("");
	         $("#customer_installation_telephone_no").val("");
	         $("#customer_installation_mobile_no").val("");
	         $("#customer_installation_email").val("");
	   } 
	});
}

 
 function totalBillCalculate() {
 	$("#calculate_total_amount").click(function(){
	 	var monthlyPlanCost = $("#customer_payment_detail_attributes_monthly_payment_cost").val();
	 	var noOfMonth = $("#customer_payment_detail_attributes_no_of_months_paid").val();
	 	var installationCharge = $("#customer_payment_detail_attributes_installation_charge").val();
	 	var otherCharge = $("#customer_payment_detail_attributes_company_material_cost").val();
         var planvalue = parseInt(monthlyPlanCost*noOfMonth)
         var otherTotalCharge = parseInt(installationCharge) + parseInt(otherCharge);
	 	var totalPay = planvalue + otherTotalCharge;
	 	if (isNaN(totalPay)) {
	 		$("#total-amount-div").hide();
	 		$("#calc-error").show();
	 		$("#bill_book, #submit-btn").hide();
	 	}
	 	else
	 	{
	 		$("#total-amount-div").fadeIn();
	 		$("#customer_payment_detail_attributes_total_amount").val(totalPay);
	 		
	 		$("#bill_book, #submit-btn").fadeIn();
	 		$("#calc-error").hide();
	 	}
 	});
 }
 

function tableHeight() {
	if ($(window).width() >= 991) {
		var navHeight = $(".main-navbar").height();
		var headHeight = $("#page-heading").height();
		var innerNav = $(".customer-navbar").height();
	    var winHeight = $(window).height();
	    var offsetHeight = navHeight+headHeight+innerNav;
	    var finalTableHeight = winHeight-offsetHeight;
		$(".resp-table").height(finalTableHeight-54);
	}
	
}

function calculateTotalAmount(){
	    $("input:radio[name='asd[custom_address_proof]']").each(function(){
	        $(this).change(function(){
	            if($(this).prop('checked') == true) {
	                var valuetrac = $(this).val()
	                $("#customer_address_proof_type").val(valuetrac);
	                $("input:radio[name='xyz[custom_address_proof_other]']").prop('checked', false);
	                $(".text_field_address_proof").hide();
	            }
	            else
	            {
	               $("#customer_address_proof_type").val("");
	            }
	        });
	    });
	    $("input:radio[name='xyz[custom_address_proof_other]']").change(function(){
	            if($(this).prop('checked') == true) {
	                $(".text_field_address_proof").show();
	                $("#customer_address_proof_type").val("").focus();
	                $("input:radio[name='asd[custom_address_proof]']").prop('checked', false);

	            }
	    });
	// for identity proof
	    $("input:radio[name='asd[custom_id_proof]']").each(function(){
	        $(this).change(function(){
	            if($(this).prop('checked') == true) {
	                var identityValue = $(this).val()
	                $("#customer_identity_proof_type").val(identityValue);
	                $("input:radio[name='xyz[custom_id_proof_other]']").prop('checked', false);
	                $(".text_field_id_proof").hide();
	            }
	            else
	            {
	               $("#customer_address_proof_type").val("");
	            }
	        });
	    });
	    $("input:radio[name='xyz[custom_id_proof_other]']").change(function(){
	            if($(this).prop('checked') == true) {
	                $(".text_field_id_proof").show();
	                $("#customer_identity_proof_type").val("").focus();
	                $("input:radio[name='asd[custom_id_proof]']").prop('checked', false);
	            }
	    });

	    // radio buttons for billing details 
	    $("input:radio[name='asd[custom_cash_proof]']").each(function(){
	        $(this).change(function(){
	            if($(this).prop('checked') == true) {
	                var identityValue = $(this).val()
	                $("#customer_bill_books_attributes_0_bill_paid_by").val(identityValue);
	            }
	            else
	            {
	               $("#customer_bill_books_attributes_0_bill_paid_by").val("");
	            }
	        });
	    });
	    $("input:radio[name='asd[custom_cash_proof_show]']").each(function(){
	        $(this).change(function(){
	            if($(this).prop('checked') == true) {
	                var identityValue = $(this).val()
	                $("#bill_book_bill_paid_by").val(identityValue);
	            }
	            else
	            {
	               $("#bill_book_bill_paid_by").val("");
	            }
	        });
	    });
}

// function customTab() {
// 	$("#tab-list-item li").each(function(){
// 		$(this).click(function(){
// 			$("#tab-list-item li").removeClass('active');
// 			$(this).addClass('active');
// 		});
// 	});
// 	// $("#row-two").hide();
// 	$("#row-three").hide();
// 	$("#tab-list-item li:first-child").click(function(){
// 		$("#row-two").hide();
// 		$("#row-one").fadeIn();
// 	});
// 	$("#tab-list-item li:nth-child(2)").click(function(){
// 		$("#row-two").fadeIn();
// 		$("#row-one").hide();
// 	});
// }

function datePicker(){
	$('#complaint_closed_date').datetimepicker({
		format: 'DD-MM-YYYY'
	});
	$('#customer_date').datetimepicker({
		format: 'DD-MM-YYYY'
	});
	$('#customer_date_of_birth').datetimepicker({
		format: 'DD-MM-YYYY'
	});
	$('#customer_bill_books_attributes_0_bill_book_date').datetimepicker({
		format: 'DD-MM-YYYY'
	});
	$('#bill_book_bill_book_date').datetimepicker({
		format: 'DD-MM-YYYY'
	});
	$('#user_date_of_birth').datetimepicker({
		format: 'DD-MM-YYYY'
	});
	$('#renew_date').datetimepicker({
		format: 'DD-MM-YYYY'
	});
	$("#customer-seach-box").hide();
	$("#search-item").click(function(){
		$("#customer-seach-box").slideDown();
	});
	$("#employee-seach-box").hide();
	$("#search-employee-item").click(function(){
		$("#employee-seach-box").slideDown();
	});
}

 function currentPage(){
 	$(".page-links tr td a[href]").each(function() {
 	if (this.href == window.location.href) {
 	    $(this).addClass("current");
 	    console.log(window.location.href);
 	}
 	});
 	if (this.href == window.location.href) {
 	    $(this).addClass("current");
 	    console.log(window.location.href);
 	}
 	
 }

function roles() {
	$(".roles").each(function(){
		$(this).click(function(){
			// 	$(".roles").removeAttr('checked');
			// 	$(this).attr('checked','checked')
			$(this).attr('checked','checked');
			$(".roles").not(this).removeAttr('checked')
			
		});
	});
}
function sideBarToggle() {
	$('#menu-toggle, #menu-toggle-complaint').click(function(){
		// alert("jjjjjjjjjjj")
	  $("#mob-overlay, #mob-overlay-complaint").fadeIn();
	  $('#side-bar-toggle,#side-bar-toggle-complaint').addClass('open-menu');
	  if($('#side-bar-toggle, #side-bar-toggle-complaint').hasClass('open-menu')){
	      $(document).mouseup(function (e)
	      {
	          var containernav = $("#side-bar-toggle, #side-bar-toggle-complaint");

	          if (!containernav.is(e.target) // if the target of the click isn't the container...
	              && containernav.has(e.target).length === 0) // ... nor a descendant of the container
	          {
	              containernav.removeClass('open-menu');
	              $("#mob-overlay, #mob-overlay-complaint").fadeOut();
	          }
	      });
	  }
	});
}
$(document).ready(function(){
	$("#bill_book,#submit-btn").hide();
	$.material.init();
	sideBarHeight();
	plansList()
	currentPage()
	sideBarToggle()
	// addressCheckBox()
	
	// alert(finalTableHeight)
	$('[data-toggle="offcanvas"]').click(function(){
       $("#navigation").toggleClass("hidden-xs");
   	});
	$("#navigation").height($(window).height());

});

$(document).on('turbolinks:load', function(){
	$.material.init();
	sideBarHeight();
	plansList()
	addressCheckBox()
	totalBillCalculate()
	tableHeight()
	calculateTotalAmount()
	$("#navigation").height($(window).height());
	// customTab()
	datePicker()
	$("#new_bill_book").validate();
	$("#new_customer").validate();
	$("#new_employee_detail").validate();
	$("#renew-form").validate();
	$("#new_gcn_plan").validate();
	$(".edit_complaint").validate();
	currentPage()
	$("#bill_book, #submit-btn").hide();
	roles()
	sideBarToggle()
});


// ************************************** Ajax for customer search **************************************************//

// var init_friend_lookup;

// init_friend_lookup = function(){
// 	$("#look-up-friend-form").on('ajax:before', function(event, data, status){
// 		$('#spin-lookup').show(); 
// 		$('#search-friend-cont').hide();
// 	});
// 	$("#look-up-friend-form").on('ajax:after', function(event, data, status){
// 		$('#spin-lookup').hide(); 
// 		$('#search-friend-cont').show();
// 	});
// 	$("#look-up-friend-form").on('ajax:success', function(event, data, status){
// 		$('#customer-main-block').replaceWith(data);
// 		$('#customer-lookup-results').addClass('animated fadeIn');
// 		init_friend_lookup(); 
// 	});
// 	$("#look-up-friend-form").on('ajax:error', function(event, xhr, status, error){
// 		$('#customer-lookup-results').replaceWith(' ');
// 		$('#lookup-errors').replaceWith('friend Not Found');
// 		$('#spin-lookup').hide(); 
// 		$('#search-friend-cont').show();
// 	});
// }
// $(document).on('turbolinks:load', init_friend_lookup);
// $(document).ready(init_friend_lookup);
// $(document).bind('page:change', init_friend_lookup);


// ************************************** Ajax for customer search completed **************************************************//