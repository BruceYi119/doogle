$(function(){
	// 배송 및 결제금액 스크롤시 위치조정
	$(window).scroll(function(){
		var chk= document.documentElement.scrollTop;

		if(chk<400){
			$(".cart_result").css("position","absolute");
			$("#pkc").css("position","absolute");
			$(".cart_result").css("top","340px");
		}else if(chk>=400){
			$("#pkc").css("position","fixed");
			$("#pkc").css("left","1300px");
			$(".cart_result").css("position","fixed");
			$(".cart_result").css("top","-70px");
		}
	});
	
	//체크박스 관련
	var chkAll = $("input:checkbox[name=bno]").length;
	
	//체크된상품 따라 버튼 값 변경
	function btnChk(chkedNum){
		if(chkAll==0){
				$("#submit").attr("class","btn disable");
				$("#submit").prop("disabled",true)
				$("#submit").text("상품을 담아주세요");
		}else{
			if(chkedNum==0){
				$("#submit").attr("class","btn disable");
				$("#submit").prop("disabled",true);
				$("#submit").text("상품을 선택해주세요");
			}else{
				$("#submit").attr("class","btn active");
				$("#submit").prop("disabled",false);
				$("#submit").text("주문하기");
			}
		}
	}
	
	//구매할 수 있는 상품이 없을 때 전체선택 막기
	if(chkAll==0){
		$(".check-all").each(function() {
			$(this).prop("checked",false);
			$(this).prop("disabled",true);
		});
		btnChk(chkAll);
	}else{
		$(".check-all").each(function() {
			$(this).prop("checked",true);
			$(this).prop("disabled",false);
		});
	}
	//체크박스 하나 선택
	$("input:checkbox[name=bno]").on("change",function(){
		var chkedNum = $("input:checkbox[name=bno]:checked").length;
		$(".check-num").text(chkedNum);
		
		if(chkAll==chkedNum){
			$(".check-all").prop("checked", true);
			btnChk(chkedNum);
		}else{
			$(".check-all").prop("checked", false);
			btnChk(chkedNum);
		}
	});
	
	//전체해제 & 체크
	$(".check-all").click(function(){
		var isChk = $(this).is(":checked");
		if(isChk){
			$("input:checkbox[name=bno]").each(function() {
				$(this).prop("checked", true);
				$(".check-all").prop("checked", true);
			});
			$(".check-num").text(chkAll);
			btnChk(chkAll);
		}else{
			$("input:checkbox[name=bno]").each(function() {
				$(".check-all").prop("checked", false);
				$(this).prop("checked", false);
			});
			$(".check-num").text(0);
			btnChk(0);
		}
		
	});
	
	//수량
	$('.btn.plus').on('click',function () {
		var n = $('.btn.plus').index(this);
		var num = Number($(".num:eq(" + n + ")").val());
		
		num++;
		
		$('.num').eq(n).attr("readonly",false);
		$(".num:eq(" + n + ")").val(num);
		$('.num').eq(n).attr("readonly",true);
		$('.quantity').eq(n).val(num);
		chgQuantity(num,n);
	});
	
	$('.btn.minus').on('click',function () {
		var n = $('.btn.minus.off').index(this);
		var num = Number($(".num:eq(" + n + ")").val());
		if(num>1){
			num--;
			$('.num').eq(n).attr("readonly",false);
			$(".num:eq(" + n + ")").val(num);
			$('.num').eq(n).attr("readonly",true);
			$('.quantity').eq(n).val(num);
			chgQuantity(num,n);
	    }
	});

	//수량 db업데이트
	function chgQuantity(quantity,index){
		var bno = Number($("input[name=bno]").eq(index).val());

		$.ajax({
			url: '/front/shop/basket/chgQuantity'
			, type: 'post'
			,traditional : true
			, data: {
				quantity:quantity,
				bno:bno
			},success: function(result){
				//$(".totalPrice").eq(index).val(total);
				changePrice();
				changeTotalPrice();
				
			}, error: function(error){
				console.log("에러 : " + error);
           	}
		});
	}
	function changePrice(){
		var price = 0;	//원래가격
		var discount = 0; //할인율
		var total = 0; //할인미적용 총금액
		var earn = 0; //적립률
		var quantity = 0;	//수량
		
		var disPrice = 0;	//한개 할인금액
		var totalDisPrice = 0;	//할인후총금액
		var totalEarn = 0;	//할인 후 적립금
		var totalDiscount = 0;	//총 할인가격
		var payment = 0;	
		$("input:checkbox[name=bno]").each(function(index) {
			price = $(".onePrice").eq(index).val()!=null ? parseInt(Number($(".onePrice").eq(index).val())) : 0;
			discount = $(".discount").eq(index).val()!=null ? Number($(".discount").eq(index).val()) : 0;
			earn = $(".earn").eq(index).val()!=null ? Number($(".earn").eq(index).val()) :0 ;
			quantity = $(".quantity").eq(index).val()!=null ? Number($(".quantity").eq(index).val()) : 0;
			
			total = parseInt(price*Number(quantity));
			totalPrice=addComma(total);	//할인미적용 총가격 콤마추가
			
			$(".totalPrice").eq(index).val(total);
			//alert(price);
			if(discount>0){	//할인하면
				disPrice = price*(1-discount/100)	//1개 할인 후 가격
				totalDisPrice = disPrice*quantity	//할인 후 총 가격
				totalEarn = totalDisPrice*earn/100;		//할인 후 적립금
				totalDiscount = price*discount/100*quantity;	//총 할인가격
				payment = addComma(totalDisPrice);
				
				$(".selling").eq(index).text(payment+'원');
				$(".cost").eq(index).text(totalPrice+'원');
				
				$(".totalDiscount").eq(index).val(totalDiscount);
				$(".totalEarn").eq(index).val(Math.round(totalEarn));
			
			}else{	//안하면
				totalEarn = total*earn/100;
				$(".selling").eq(index).text(totalPrice+'원');
				
				$(".totalDiscount").eq(index).val(0);
				$(".totalEarn").eq(index).val(Math.round(totalEarn));
			}
			
				
		});		
	}
	//전체값 변경
	function changeTotalPrice(){
		var totalPrice = 0;	//총상품금액
		var totalDiscount = 0;	//총 할인금액
		var totalEarn = 0;	//총 적립금
		var payment = 0;	//결제예정금액
		$("input:checkbox[name=bno]").each(function(index) {
			if(Number($(".totalPrice").eq(index).val())!=null){
				totalPrice += Number($(".totalPrice").eq(index).val());
			}
			if(Number($(".totalDiscount").eq(index).val())!=null){
				totalDiscount += Number($(".totalDiscount").eq(index).val());
			}
			totalEarn += Number($(".totalEarn").eq(index).val());
		});
		payment=totalPrice-totalDiscount;
		totalPrice = addComma(totalPrice);
		totalDiscount = addComma(totalDiscount);
		totalEarn = addComma(totalEarn);
		if(payment<40000){
			$(".fee").text("+3,000");
			payment=addComma(payment+3000);
			$(".payment").text(payment);
			$(".free-limit").remove();
			
		}else if(payment>=40000){
			$(".fee").text("0");
			payment=addComma(payment);
			$(".payment").text(payment);
			
		}
		$(".total").text(totalPrice);
		$(".totalDisPrice").text(totalDiscount);
		$(".totalEarn").text(totalEarn);
	}

	//숫자콤마추가
	function addComma(x) {
    	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	//장바구니 비었을 때
	function itemChk(){
		if($(".box").length==0){
			var div = $(".cart-item").parent();
			div.prop("class","empty");
			
			var html ='<div class="inner-empty">'
			html += '<span class="bg"></span><p class="txt">장바구니에 담긴 상품이 없습니다</p></div>'
			$(".cart-item>div:first").after(html);
		}
	}
	itemChk();
	
	//삭제버튼 클릭
	$(".btn-delete").click(function(){
		var answer;
		var chkArr = [];
		if($(this).val()=="선택삭제"){
			$("input:checkbox[name=bno]:checked").each(function() {
				
				chkArr.push($(this).val()); 
			});
			if(chkArr.length==0){
				alert("삭제할 상품을 선택해주세요.");
			}else{
				answer = confirm("선택한 상품을 삭제하시겠습니까?");
				if(answer == true){
					delChkBasket(1,chkArr);
				}
			}
		}else{
			var bno = $(this).val();
			
			var isChk = $("#bno"+bno).is(":checked");
			if(isChk){
				deleteOne(1,bno);
			}else{
				deleteOne(0,bno);
			}
		}
	});
	
	//구매불가 삭제
	$(".btn_shown").click(function(){
		var chkArr = [];
		$("input:checkbox[name=disBno]").each(function() {
			chkArr.push($(this).val()); 
		});
		$(this).remove();
		delChkBasket(0,chkArr);
	});
	
	//선택된 값 삭제
	function delChkBasket(chk,chkArr){
		$.ajax({
			url: '/shop/delChkBasket'
			, type: 'post'
			,traditional : true
			, data: {
				bnoArr : chkArr
			},success: function(result){
				changePrice();
				changeTotalPrice();
				var all = Number($(".all-num").text());
				if(chk==1){
					$(".check-num").text(0);
					$(".all-num").text(all-chkArr.length);
				}
				
				for(i=0 ;  i<chkArr.length ; i++){
					var box = $('#bno'+chkArr[i]).parents('.box')
					var li = $('#bno'+chkArr[i]).parents('li').remove();
					var liCnt = box.find("li").length;
					if(liCnt==0){
						box.remove();
						itemChk();
					}
				}
				
			}, error: function(error){
				console.log("에러 : " + error);
           	}
		});
	}
	
	//상품 1개 삭제
	function deleteOne(chk,bno){
		
		$.ajax({
			url: '/shop/deleteBasket'
			, type: 'post'
			,traditional : true
			, data: {
				bno:bno
			},success: function(result){
				var all = Number($(".all-num").text());
				var chkedNum = $("input:checkbox[name=bno]:checked").length;
				changePrice();
				changeTotalPrice();
				if(chk==1){
					$(".check-num").text(chkedNum-1);
				}
				$(".all-num").text(all-1);

				var box = $('#bno'+bno).parents('.box')
				var li = $('#bno'+bno).parents('li').remove();
				var liCnt = box.find("li").length;
				if(liCnt==0){
					box.remove();
					itemChk();
				}
			}
		});
	}
	
	//리스트 드롭업다운
	$(".btn_dropup").click(function(){
		var index = $(".btn_dropup").index(this);
		var list = $(".list").eq(index);
		if(list.css("display") == "none"){
			$(".btn_dropup").eq(index).css("background-image","url('/static/front/img/shop/basket/bdropup.JPG')");
		    list.css("display","block");
		} else {
			$(".btn_dropup").eq(index).css("background-image","url('/static/front/img/shop/basket/bdropdown.JPG')");
			list.css("display","none");
		}
	});
	
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
			var mno = $(".session").val();
			window.open("/deliveryUpdate?dno=" + dno + "&mno="+mno, "주소수정", "width=500, height=500");
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
			var mno = $(".session").val();
			
			$.ajax({
				url: "/delivery_defaultUpdate?dno=" + dno +"&mno="+mno,
				type: "get",
				data: {
				},
				dataType: "text",
				success: function() {
					console.log("기본배송지 변경완료");
				}
	
			});
		});
		alert("기본배송지 변경 완료")

}
















});