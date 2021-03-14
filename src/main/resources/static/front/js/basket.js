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
	var disBno = $("input:checkbox[name=disBno]").length;
	
	
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
		$(".num:eq(" + n + ")").val(num);
		
	});
	
	$('.btn.minus').on('click',function () {
		var n = $('.btn.minus.off').index(this);
		var num = Number($(".num:eq(" + n + ")").val());
		if(num>1){
			num--;
			$(".num:eq(" + n + ")").val(num);
			
	    }
	});
	
	//수량 업데이트
	function chgQuantity(quantity,index){
		var price = Number($(".onePrice:eq(" + n + ")").val());
		var total = price*quantity;
		total=addComma(total);
		$(".selling:eq(" + n + ")").val(total);
		alert(total);
/*		$.ajax({
			url: 'chgQuantity'
			, type: 'post'
			,traditional : true
			, data: {
				quantity:quantity,
				bno:bno
			},success: function(result){
				
				alert('성공');
				
			}, error: function(error){
				console.log("에러 : " + error);
           	}
		});*/
	}
	//숫자콤마추가
	function addComma(value){
		value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		return value; 
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
					delChkBasket(chkArr);
				}
			}
		}else{
			deleteOne($(this).val());
		}
	});
	
	//구매불가 삭제
	$(".btn_shown").click(function(){
		var chkArr = [];
		$("input:checkbox[name=disBno]").each(function() {
			chkArr.push($(this).val()); 
		});
		$(this).remove();
		delChkBasket(chkArr);
	});
	
	//선택된 값 삭제
	function delChkBasket(chkArr){
		$.ajax({
			url: 'delChkBasket'
			, type: 'post'
			,traditional : true
			, data: {
				bnoArr : chkArr
			},success: function(result){
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
	function deleteOne(bno){
		$.ajax({
			url: 'deleteBasket'
			, type: 'post'
			,traditional : true
			, data: {
				bno:bno
			},success: function(result){
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


});