const jusoPopup = (func = null) => {
	const popupWidth = 570;
	const popupHeight = 420;
	const left = Math.ceil((window.screen.width - popupWidth) / 2);
	const top = Math.ceil((window.screen.height - popupHeight) / 2);

	if (func === 'showUpdateAddrBtns')
		window.open(`/jusoPopup?func=${func}`, 'pop', `width=${popupWidth},height=${popupHeight}, scrollbars=yes, resizable=yes, left=${left}, top=${top}`);
	else
		window.open('/jusoPopup', 'pop', `width=${popupWidth},height=${popupHeight}, scrollbars=yes, resizable=yes, left=${left}, top=${top}`);
};

function jusoCallBack(roadAddrPart1, addrDetail, zipNo, func = null) {
	if (func !== null && func === 'showUpdateAddrBtns') {
		const spanZipcode = document.querySelector('#zipcode');
		const spanAddr = document.querySelector('#addr');
		const spanAddr_detail = document.querySelector('#addr_detail');

		spanAddr_detail.innerHTML = addrDetail;
		spanZipcode.innerHTML = zipNo;
		spanAddr.innerHTML = roadAddrPart1;
		showUpdateAddrBtns();
	} else {
		const zipcode = document.querySelector('input[name=zipcode]');
		const addr = document.querySelector('input[name=addr]');
		const addr_detail = document.querySelector('input[name=addr_detail]');

		data1 = zipNo;
		data2 = roadAddrPart1;
		data3 = addrDetail;
		openWin = window.open("/delivery_pop?zipNo=" + data1 + "&roadAddrPart1=" + data2 + "&addrDetail=" + data3, "", 'width=800,height=430', "_black");
		window.close();
		//addr.value = roadAddrPart1;
		//addr_detail.value = addrDetail;
		//zipcode.value = zipNo;	
	}
};

function updatePop() {

	$(".dno").click(function() {
		var dno = $(this).find(".dno1").val();
		window.open("/deliveryUpdate?dno=" + dno, "주소수정", "width=500, height=500");
	})
}

$(function(){
	$(".checkbox_class").each(function(i) {
		var value = $(this).val();
		console.log(value);
		if (value == 'y'){
			$(".checkbox_class").eq(i).attr("checked", true);
		}
	});
})
//function check() {
//	$(".checkbox_class").each(function(i) {
//		var value = $(this).val();
//		console.log(value);
//		alert(value);
//		if (value == 'y'){
//			$(".checkbox_class").eq(i).attr("checked", true);
//		}
//	});
//};
//
//check();


function update() {
	$(".dno").click(function() {
		var default_yn = $(this).find(".checkbox_class").val();
		var dno = $(this).find(".dno1").val();
		$.ajax({
			url: "/delivery_defaultUpdate?dno=" + dno,
			type: "post",
			data: {
				default_yn: default_yn,
			},
			dataType: "text",
			success: function() {
				console.log("기본배송지 변경완료");
			}

		});
	});
	alert("기본배송지 변경 완료")

}














