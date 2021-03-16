
$(function() {

	//체크박스 하나 선택
	$(".ico_check").on("change", function() {
		var chkAll = $(".ico_check").length;
		var chkedNum = $(".ico_check:checked").length;

		if (chkAll == chkedNum) {
			$("#chkBox").prop("checked", true);
		} else {
			$("#chkBox").prop("checked", false);
		}
	});

	//전체해제 & 체크
	$("#chkBox").click(function() {
		var isChk = $(this).is(":checked");
		var chkAll = $(".ico_check").length;
		if (chkAll > 0) {
			if (isChk) {
				$(".ico_check").each(function() {
					$(this).prop("checked", true);
					$("#chkBox").prop("checked", true);
				});

			} else {
				$(".ico_check").each(function() {
					$(this).prop("checked", false);
					$("#chkBox").prop("checked", false);
				});
			};
		} else {
			$(this).prop("checked", false);
		}
	});

	//장바구니 추가 모달
	$('#basket-modal').on('show.bs.modal', function(event) {
		var td = $(this).parents('tr').find('td:eq(0)')
		alert(td);
		var pno = td.find('input[name=pno]').val();
		alert(pno);
		var brand = td.find('input[name=brand]').val();
		var pname = td.find('input[name=pname]').val();
		//var pono = $('input[name=pono]').eq(index).val();
		var oname = td.find('input[name=oname]').val();
		var quantity = td.find('input[name=quantity]').val();
		var dis_yn = td.find('input[name=dis_yn]').val();
		var discount = td.find('input[name=discount]').val();
		var earn_yn = td.find('input[name=earn_yn]').val();
		var earn = td.find('input[name=earn]').val();
		var pprice = td.find('input[name=pprice]').val();
		var oprice = td.find('input[name=oprice]').val();
		
		var modal = $(this);
		var button = $(event.relatedTarget);
		var lno = button.data('whatever');

		//hidden에 값부여
		/*modal.find("#mno").val(mno);
		modal.find("#pno").val(mno);
		modal.find("#pono").val(pono);
		modal.find("#price").val(price);
		
		modal.find(".name").val(brand+pname);
		
		switch(dis_yn){
		case "y":
			modal.find(".dc_price").val(pprice*(1-discount/100));
			modal.find(".original_price").val(pprice);
			break;
		case "n":
			modal.find(".dc_price").val(pprice);
			break;
		}
		
		
		var pono = form.get("pono")
		var brand = from.get("brand")
		var pname = from.get("pname")
		var oname = from.get("oname")
		alert(pono+brand+pname+oname)
		for (i = 0; i < dataArray.length; i++) {
			var name = dataArray[i].name;
			var value = dataArray[i].value;
			//			alert(name+" "+value);
		}
		//var param = $("form[name=livingFrm]").serialize();
		var button = $(event.relatedTarget);
		var pno = button.data('whatever');
		var modal = $(this);
		var modal = $(this);
		
		modal.find(".name").text(brand+" "+pname);
		switch(dis_yn){
		case "y":
			modal.find(".dc_price").val(pprice*(1-dto.discount/100));
			modal.find(".original_price").val(pprice);
			break;
		case "n":
			modal.find(".dc_price").val(pprice);
			break;
		}*/
	});
	
	/*창이 떠있을 때*/
	$("#basket-modal").on('shown.bs.modal', function() {
		var modal = $(this);
		//수량버튼
		$('.btn.up.on').on('click', function() {
			var n = $('.btn.up.on').index(this);
			var num = Number($(".inp:eq(" + n + ")").val());
			var onePrice = Number($(".one-price").eq(n).val());
			var earn = $(".earn").eq(n).val();
			num++;

			$('.inp').eq(n).attr("readonly", false);
			$(".inp:eq(" + n + ")").val(num);
			$('.inp').eq(n).attr("readonly", true);
			chgTotalPrice(onePrice, num,earn);
			alert(earn);
		});

		$('.btn.down.on').on('click', function() {
			var n = $('.btn.down.on').index(this);
			var num = Number($(".inp:eq(" + n + ")").val());
			var onePrice = Number($(".one-price").eq(n).val());
			var earn = $(".earn").eq(n).val();
			if(num>0){
				num--;
				$('.inp').eq(n).attr("readonly", false);
				$(".inp:eq(" + n + ")").val(num);
				$('.inp').eq(n).attr("readonly", true);
				chgTotalPrice(onePrice, num, earn);
			}
		});

		$('.btn_type1 .txt_type').on('click', function() {
			if($(".inp").val()>0){
				var form = $("#addBasket")[0];
				//값넣어주기
				const ajax = axios(
					{
						method: 'post',
						url: '/shop/addBasket',
						data: new FormData(form)
					}
				);
	
				ajax.then((res) => {
					if (res.data) {
						var name = modal.find(".name").text();
						/*$(this).popover({
	           				 html:true	//<p><br>태그 읽히는 조건 툴팁에 설정해야함
	       				 });*/
						var msg = "장바구니에 상품을 담았습니다"
						if(res.data>0){
							msg+="이미 담으신 상품이 있어 추가되었습니다."
						}
						showBasket(name+"\n"+msg);
						
					}
				});
			}

		});
	});
	//총합계 계산
	function chgTotalPrice(price, quantity, earn) {
		var total = Number(price) * Number(quantity);
		var totalEarn = Math.round(total*Number(earn)/100);
		alert(totalEarn);
		total = addComma(total);
		totalEarn = addComma(totalEarn);
		$(".num").text(total);
		$("#saving").text(totalEarn);
	}
	//숫자콤마추가
	function addComma(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	//

	//늘사는것 추가 모달
	$('#living-Modal').on('show.bs.modal', function(event) {
		var button = $(event.relatedTarget);
		var pno = button.data('whatever');
		var modal = $(this);

		$.ajax({
			url: 'putOnLiving'
			, type: 'post'
			, traditional: true
			, data: {
				pno: pno
			}, success: function(data) {
				if (data != 0) {
					modal.find('.msg').text("이미 늘 사는 리스트에 존재하는 상품입니다.");
				} else {
					modal.find('.msg').text("늘 사는 리스트에 추가했습니다.");
				}

			}, error: function(error) {
				console.log("에러 : " + error);
			}
		});
	});
});