'use strict';

$(function() {
	$("#state_register").change(function() {
		if ($('#state_register').is(":checked")) {
			$("#idstate").val(1);
		} else {
			$("#idstate").val(0);
		}
	});
	initEdit();
});



