$(function(){
	$("#type1").change(function(){
		if($("#type1").is(":checked")){
			$("#type").val("y");
		}else{
			$("#type").val("n");
		}
	});
	
	var type = $("#type").val();
	if(type=="y"){
		$("#type1").prop("checked",true);
	}
	
	var ctno = $("#ctno").val();
	$("#sel1").val(ctno).prop("seleceted",true);
});
initEdit();