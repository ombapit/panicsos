//tambahan david	
function write_error_html(json) {
	$.each(json, function(i, item) {
		$("#"+item.name).parent().removeClass('state-success');
		$("#"+item.name).parent().addClass('state-error');
		$("#"+item.name).removeClass('valid');
		$("#"+item.name).addClass('invalid');
		$("em[for="+ item.name +"]").remove();
		$("#"+item.name).parent().after('<em for="'+ item.name +'" class="invalid" style="display: inline;">'+ item.message + '</em>');
	});
}

function confirm_delete(module,id) {
	var r = confirm("Are you sure to delete this data?");
	if (r == true) {
		delete_data(module,id);
	}
	return false;
}

function delete_data(module,id) {
	$.ajax({
		type : "POST",
		url : base_url + module + '/delete/' + id,
		dataType : 'json',
		beforeSend : function() {
			// cog placed
			$("#block_msg").html('Deleting data, please wait..');
		},
		success : function(data) {
			if (data.success) {
				window.location = site_url + module;
			} else {
				$("#alert_table").css('display',"");
				$(".alert_msg").html(data.msg);
			}
		},
		error : function(xhr, ajaxOptions, thrownError) {
			$("#alert_table").css('display',"");
			$(".alert_msg").html('Deleting data failed, contact administrator..');
		},
		async : false
	});
	return false;
}