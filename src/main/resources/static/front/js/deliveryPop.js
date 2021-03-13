function aa(){
	alert("test");
		var mno = $('input[name=mno]').val();
		var phone = $('input[name=phone]').val()
		var addr = $('input[name=addr]').val()
		var addr_detail = $('input[name=addr_detail]').val()
		var receive_name = $('input[name=receive_name]').val()
		var default_yn = $('input[name=default_yn]').val()

		$.ajax({
			url: "delivery_ok",
			type: "post",
			data: {
				mno: mno,
				phone: phone,
				addr: addr,
				addr_detail: addr_detail,
				receive_name: receive_name,
				default_yn: default_yn,
			},
			dataType: "text",
			success: function() {
				alert("dd");
				window.close();
			},
			error: function(request, status, error) {
				alert(error);
			}
		})
};

function deliveryInsert() {
   var mno = $('input[name=mno]').val();
   var phone = $('input[name=phone]').val()
   var addr = $('input[name=addr]').val()
	if(addr.match(/서울/)||addr.match(/경기/)||addr.match(/인천/)){
		$('input[name=type]').val('s');
	}else{
		$('input[name=type]').val('t');
	}
   var type = $('input[name=type]').val();
   var addr_detail = $('input[name=addr_detail]').val()
   var receive_name = $('input[name=receive_name]').val()
   var default_yn = $("#default_yn").val()
   var data = {
	  type: type,
      mno: mno,
      phone: phone,
      addr: addr,
      addr_detail: addr_detail,
      receive_name: receive_name,
      default_yn: default_yn
   };
   $.post('delivery_ok', data, function(res) {
		console.log(data);
		alert("배송지 추가 완료")
		window.close();
		opener.location.href = '/shop/deliveryList';
   });
};

function beasong(){
	
	$("#default_set").change(function(){
		if($("#default_set").is(":checked")){
			$("#default_yn").val('y');
		}else{
			$("#default_yn").val('n');
		}
	})
};	
