$(function(){
	$("#idemail_yn").change(function(){
		if($("#idemail_yn").is(":checked")){
			$("#email").val("y");
		}else{
			$("#email").val("n");
		}
	});
	
	$("#idphono_yn").change(function(){
		if($("#idphono_yn").is(":checked")){
			$("#phone").val("y");
		}else{
			$("#phone").val("n");
		}
	});
	
	var ctno = $("#ctnoval").val();
	$(".select").val(ctno).prop("selected",true);
	
initEdit();
});

function order_open(){
	var mno=111;
	window.open("/shop/qnaOrderList?mno="+mno,"PopupWin","width=900,height=400,top=300,left=600");
}