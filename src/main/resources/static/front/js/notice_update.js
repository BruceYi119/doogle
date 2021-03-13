'use strict';
function initNoticeInsert() {
	$("#nState_YN").change(function(){
		if($("#nState_YN").is(":checked")){
			alert("공지사항으로 등록!");
			$("#idstate").val(1);
		}else{
			$("#idstate").val(0);
		};
	});

	var gongji = $("#uState").val();
	if(gongji==1){
		$("#nState_YN").prop("checked",true);
	};

	$("#type1").change(function(){
		if($("#type1").is(":checked")){
			$("#type").val("y");
		}else{
			$("#type").val("n");
		};
	});	
};
initNoticeInsert();
initEdit();