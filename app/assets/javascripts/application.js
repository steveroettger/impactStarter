// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap
//= require_tree .

$(document).ready(function(){
	
	// DROPDOWN SEARCH BAR
	$("#search-btn").click(function(e){
		e.preventDefault();
		$("#search-bar").slideToggle("slow");
	});
	
	// ABOUT PAGE SIDEBAR TAB NAVIGATION
	$('a#default').click(function(){
		$('a#default').addClass('active');
		$('a#start').removeClass('active');
		$('a#invest').removeClass('active');
		$('a#return').removeClass('active');
		
		$('#default-content').show();
		$('#start-project').hide();
		$('#invest-project').hide();
		$('#return-project').hide();
		
		return false;
	});
	
	$('a#start').click(function(){
		$('a#default').removeClass('active');
		$('a#start').addClass('active');
		$('a#invest').removeClass('active');
		$('a#return').removeClass('active');
		
		$('#default-content').hide();
		$('#start-project').show();
		$('#invest-project').hide();
		$('#return-project').hide();
		
		return false;
	});
	
	$('a#invest').click(function(){
		$('a#default').removeClass('active');
		$('a#start').removeClass('active');
		$('a#invest').addClass('active');
		$('a#return').removeClass('active');
		
		$('#default-content').hide();
		$('#start-project').hide();
		$('#invest-project').show();
		$('#return-project').hide();
		
		return false;
	});
	
	$('a#return').click(function(){
		$('a#default').removeClass('active');
		$('a#start').removeClass('active');
		$('a#invest').removeClass('active');
		$('a#return').addClass('active');
		
		$('#default-content').hide();
		$('#start-project').hide();
		$('#invest-project').hide();
		$('#return-project').show();
		
		return false;
	});
	

});

  
	