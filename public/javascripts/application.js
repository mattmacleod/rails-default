fest_schedule = {};

$(document).ready(function(){

	fest_schedule.search.init();
	fest_schedule.booking.init();
	
});

fest_schedule.search = {
	
	timer: null,
	loading: false,
	
	init: function(){
		
		$("form.search_form input.text").attr("autocomplete", "off");
		
		$("form.search_form").submit(function(){ fest_schedule.search.submit_search(); return false;});
		$("form.search_form").keyup(function(){
			clearTimeout(this.timer);
			$("input.text", this).addClass("loading");
			this.timer = setTimeout(fest_schedule.search.submit_search, 500);
		});
		
		$("a.toggle_link").live("click", function(){
			var _link = $(this);
			$.post( $(this).attr("href"), {}, function(data){
				if( data=="true" ){
					_link.removeClass("false").addClass("true");
				} else {
					_link.removeClass("true").addClass("false");
				}
			});
			return false;
		});
		
	},
	
	submit_search: function(){
		$.get( location.href, { q:$("form.search_form input.text").val() }, function(html){
			$(".listings_table tbody").html( html );
			$("input.text").removeClass("loading");
		});	
		
	}
	
};


fest_schedule.booking = {
	
	init: function(){
	
		// Setup booking process
		$("#performance_select input").change(function(){
			if( $("#performance_select input:checked").length>0){
				$("#writer_select").show();
				$("#writer_select select").change();
			} else {
				$("#writer_select").hide();
			}
		}).change();
		
		// Handle writer select
		$("#writer_select select").change(function(){
			if( $(this).val()!=""){
				$.get( "/bookings/check_writer", { performance_id: $("#performance_select input:checked").val(), writer_id: $(this).val()}, function(data){
					$("#writer_data").html( data );
					$("#confirm_booking").show();
				});
			} else {
				$("#confirm_booking").hide();
			}
		}).change();

		$("#confirm_booking input").click(function(){
			if($("p.overbooked, p.doublebooked, p.nearbooked").length > 0){
				return confirm("Are you sure you want to make this booking? The selected writer may be over-booked!");
			} else {
				return true
			}
		});
	}
	
}