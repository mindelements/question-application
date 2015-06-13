(function($){
	$(window).load(function(){
		$("#content-1").mCustomScrollbar({
			theme:"dark"
		});
	});
})(jQuery);


$(document).ready(function() {
	var windoHeight = $(window).height();
	var headerHeight = $('header').outerHeight();
	var footerHeight = $('footer').outerHeight();
	var diff=83;
	if($('.pageTitle').length)
	{	
		diff=120;
	}
	var setHeight = windoHeight - headerHeight - footerHeight - diff;
	
	$('.content').css('height',setHeight+'px');
	
});