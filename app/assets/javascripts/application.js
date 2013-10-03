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
//= require cocoon
//= require ckeditor/init
//= require_tree .

$(document).ready(function(){
	
	// HOME PAGE PROJECT OVERLAY
	$(".project").hover(function(){
		$(this).find(".project-overlay").fadeIn(400);
	},
	function(){
		$(this).find(".project-overlay").fadeOut(100);
	});
	
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

	// USER PROFILE TOGGLE BETWEEN 'overview' AND 'activity'
	$('a#profile-overview').click(function(){
		$('a#profile-overview').addClass('active');
		$('a#profile-activity').removeClass('active');

		$('#overview').show();
		$('#activity').hide();

		return false;
	});

	$('a#profile-activity').click(function(){
		$('a#profile-overview').removeClass('active');
		$('a#profile-activity').addClass('active');

		$('#overview').hide();
		$('#activity').show();

		return false;
	});

	// USER PROFILE EDIT 'account settings' AND 'profile-details'
	$('a#settings').click(function(){
		$('a#settings').addClass('active');
		$('a#details').removeClass('active');
		$('a#investor').removeClass('active');

		$('#profile-settings').show();
		$('#profile-details').hide();
		$('#investor-status').hide();

		return false;
	});

	$('a#details').click(function(){
		$('a#settings').removeClass('active');
		$('a#details').addClass('active');
		$('a#investor').removeClass('active');

		$('#profile-settings').hide();
		$('#profile-details').show();
		$('#investor-status').hide();

		return false;
	});

	$('a#investor').click(function(){
		$('a#settings').removeClass('active');
		$('a#details').removeClass('active');
		$('a#investor').addClass('active');

		$('#profile-settings').hide();
		$('#profile-details').hide();
		$('#investor-status').show();

		return false;
	});

	// PROJECT FORM 'details' || 'objectives' || 'tags'
	// DETAILS
	$('a#details').click(function(){
		$('a#details').addClass('active');
		$('a#objectives').removeClass('active');
		$('a#tags').removeClass('active');
		$('a#team').removeClass('active');

		$('#project-form-details').show();
		$('#project-form-objectives').hide();
		$('#project-form-tags').hide();
		$('#project-form-team').hide();

		return false;
	});
	// OBJECTIVES
	$('a#objectives').click(function(){
		$('a#details').removeClass('active');
		$('a#objectives').addClass('active');
		$('a#tags').removeClass('active');
		$('a#team').removeClass('active');

		$('#project-form-details').hide();
		$('#project-form-objectives').show();
		$('#project-form-tags').hide();
		$('#project-form-team').hide();

		return false;
	});
	// TAGS
	$('a#tags').click(function(){
		$('a#details').removeClass('active');
		$('a#objectives').removeClass('active');
		$('a#tags').addClass('active');
		$('a#team').removeClass('active');

		$('#project-form-details').hide();
		$('#project-form-objectives').hide();
		$('#project-form-tags').show();
		$('#project-form-team').hide();

		return false;
	});
	// TEAM
	$('a#team').click(function(){
		$('a#details').removeClass('active');
		$('a#objectives').removeClass('active');
		$('a#tags').removeClass('active');
		$('a#team').addClass('active');

		$('#project-form-details').hide();
		$('#project-form-objectives').hide();
		$('#project-form-tags').hide();
		$('#project-form-team').show();

		return false;
	});

});



