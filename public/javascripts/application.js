fest_schedule = {};

$(document).ready(function(){

	fest_schedule.search.init();
	
});

fest_schedule.search = {
	
	timer: null,
	loading: false,
	
	init: function(){
		
		$("form.search_form input.text").attr("autocomplete", "off");
		
		$("form.search_form").keyup(function(){
			clearTimeout(this.timer);
			$("input.text", this).addClass("loading");
			this.timer = setTimeout(fest_schedule.search.submit_search, 500);
		});
	},
	
	submit_search: function(){
		$.get( location.href, { q:$("form.search_form input.text").val() }, function(html){
			$(".listings_table tbody").html( html );
			$("input.text").removeClass("loading");
		});	
		
	}
	
}