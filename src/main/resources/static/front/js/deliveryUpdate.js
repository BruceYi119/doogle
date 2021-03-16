
function update(){
	var addr_detail = $("input[name=addr_detail]").val();
	var receive_name = $("input[name=receive_name]").val();
	var phone = $("input[name=phone]").val();
	var dno = $("input[name=dno]").val();
	var mno = $("#mno").val();
	var data = {addr_detail:addr_detail,
				receive_name:receive_name,
				phone:phone,
				dno:dno,
				};
	$.get("deliveryUpdateOk?dno="+dno,data,function(){
		alert("배송지 수정 완료");
		window.close();
		opener.location.href = '/shop/deliveryList';
	});
	
}


function deliveryDelete(){
	
	var dno = $("input[name=dno]").val();
	$.ajax({
		url:"deliveryDelete?=dno"+dno,
		type : "get",
		data : {dno:dno},
		dataType: "text",
		success : function(){
			alert("배송지 삭제 완료")
			window.close();
			opener.location.href = '/shop/deliveryList';
		}
	})
//	location.href="/deliveryDelete?dno="+dno;
}















