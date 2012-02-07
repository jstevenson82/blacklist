function notify(flash_message){
	// jQuery: reference div, load in message, and fade in
	var flash_div = $("#flash")
	flash_div.html(flash_message);
	flash_div.fadeIn(400);
	// use Javascript timeout function to delay calling
	// our jQuery fadeOut, and hide
	setTimeout(function(){
	flash_div.fadeOut(1000,
	function(){
		flash_div.html("");
		flash_div.hide()}
		)},
		5400);
}

$(function(){ // &lt;&lt;JQUERY after dom is loaded event
	// hide our container div
	$("#flash").hide();
	// grab flash message from our div
	var flash_message = $("#flash").html().trim();
	// call our flash display function
	if(flash_message != ""){
		notify(flash_message);
	}
});

//$(function() {
//    $("#business_parent_cat_id").change(function() {
//        $.ajax({url: '/manager/business_sub_cats',
//        data: 'id=' + this.value,
//        dataType: 'script'})
//    });
//});
$(function() {
    $('#business_parent_cat_id').change(function(event) {
        $.post('/manager/business_sub_cats?id='+$(this).val(), { selected: $('#business_parent_cat_id').val() },
            function(data) {
                $('#sub_cat').html(data);
            }
        );            
    }); 
});