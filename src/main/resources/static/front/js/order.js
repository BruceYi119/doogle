$(function()
{
	
    //주문상품 자세히 보기 & 간략하게 보기
    $("#upDown").click(function()
    {
        $("#upDown").toggleClass("spinEffect");
        $("#itemList").toggleClass("page_aticle on order_goodslist").toggleClass("page_aticle order_goodslist")
        
    });
    
    $("#btnLayerInfo").click(function()
    {
        $("#layerInfo").show()
    });
    $("#addrMsgClose").click(function()
    {
        $("#layerInfo").hide()
    });

    //친환경 포장 배너 표시
    $(".btn_layershow").click(function(){
        $(".bg_dim").show();
        $(".layer.layer_agree").show();
    })

    $(".btn_ok").click(function(){
        $(".bg_dim").hide();
        $(".layer.layer_agree").hide();
    })
	
	//쿠폰창 누르면 사용가능한 쿠폰 뿌리기
	$("#popselboxView").click(function(){
		$("#popSelbox").show();
	})
	
	//클릭하면 숫자에 콤마 추가해주는 함수
	$.fn.digits = function()
	{ 
    	return this.each(function()
		{ 
        	$(this).text( $(this).text().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") ); 
		})
	}
	
	//쿠폰적용안함 부분
	var addpopSelListFst = document.getElementById("addpopSelList").getElementsByClassName("fst");
	$(addpopSelListFst).on({
		//마우스 올라가면 배경색 변경
		mouseenter: function()
		{
			$(this).css("background-color","#FAFAFA");
		},
		mouseleave: function()
		{
			$(this).css("background-color","#fff");
		},
		
		//쿠폰 또는 선택안함을 선택하면 쿠폰창 숨김
		click: function()
		{
			var indexNum = $(this).index(); //인덱스 번호 가져오기
						
			$("#popSelbox").css("display","none"); //클릭하면 쿠폰 창 닫기
			//클릭을 하면 체크 사진이 왼쪽에 생기게 하는 스크립트
			for(i=0;i<addpopSelListFst.length;i++)
			{
				$(addpopSelListFst).removeClass("checked");
			}			
			$(this).addClass("checked");
			
			var discountPrice = document.getElementsByClassName("discountPrice"); //쿠폰 할인 값이 저장되어 있는 class 배열 가져오기
			var valueofdiscountPrice = $(discountPrice).eq(indexNum).val(); //클릭하는 배열의 순서의 할인 값을 가져오기
			var getMcnoArr = document.getElementsByClassName("getMcno"); //쿠폰 mcno 번호를 가져올 수 있는 배열 가져오기
			var getMcno = $(getMcnoArr).eq(indexNum).val();
			$("#mcnoHidden").val(getMcno); //mcno를 가져와서 hidden 값에 저장
			$("#apr_coupon_data").text(valueofdiscountPrice); //쿠폰의 할인 값을 추가
			$("#coupon_hidden").val(valueofdiscountPrice); //쿠폰 할인 값이 숨겨져 있는 곳에 추가
			$("#apr_coupon_data").digits(); //쿠폰 할인의 값을 가져와 콤마 추가
			
			var paper_settlement_hidden = $("#paper_settlement_hidden").val(); //상품의 최종 계산된 가격 가져오기
			var credit = $("#credit_hidden").val(); //적립금 할인이 적용된 값 가져오기
			var couponDiscountPrice = $("#coupon_hidden").val(); //쿠폰이 적용된 할인의 값 가져오기
			var paperSettlementNum = Number(paper_settlement_hidden); //숫자로 형변환
			var creditNum = Number(credit); //숫자로 형변환
			var couponDiscountPriceNum = Number(couponDiscountPrice); //숫자로 형변환
			
			//쿠폰이 선택되었을때 할인금액 & 적립금 금액 & 최종금액을 가져와서 계산
			var totalFinal= paperSettlementNum - couponDiscountPriceNum - creditNum;
			if(totalFinal < 0)
			{
				totalFinal=0
			}
//			alert(totalCouponSettlement);
//			alert(typeof(totalCouponSettlement));
			
			$("#paper_settlement").text(totalFinal); //최종 결제금액 삽입
			$("#paper_settlement").digits(); //콤마 삽입
			$("#totalFinal").val(totalFinal); //최종 결제금액 hidden 값에 삽입
			
			//적립률 계산
			var totalForGrade = $("#totalFinal").val();
			var earn = $(".ratio").text();
			var totalForGradeNum = Number(totalForGrade);
			var earnNum = Number(earn);
			var calcEarn = parseInt(totalForGradeNum*(earnNum/100));
			$("#expectAmount").text(calcEarn);
			$("#calcEarn").val(calcEarn);
		}
	});
	
	//적립금 가져오기
	$("#emoney").on({
		keyup: function(){
          if(event.keyCode != 8)
          { 
			this.value=this.value.replace(/[^0-9]/g,""); //숫자만 입력할 수 있게 설정
			
			//0.5초 이후 값이 입력되게 설정
			setTimeout(function()
			{
				var credit = $("#emoney_hidden").val(); //보유 적립금을 가져온다
				var creditUsed = $("#emoney").val(); //입력된 적립금 가져오기
				var creditNum = Number(credit); //넘버로 형변환
				var creditUsedNum = Number(creditUsed); //넘버로 형변환
				
				
				
				//만약에 보유 적립금보다 사용한 적립금이 더 많다면
				if(creditUsedNum > creditNum)
				{
					$("#emoney").val(0);
				}
				//보유 적립금 이하를 사용했다면
				else
				{
					$("#paper_reserves").text(creditUsedNum); //사용금액을 삽입
					$("#paper_reserves").digits(); //콤마 추가
					$("#credit_hidden").val(creditUsedNum); //사용할 적립금 hidden에 추가
//					alert($("#credit_hidden").val());
					
					var paper_settlement_hidden = $("#paper_settlement_hidden").val(); //상품의 최종 계산된 가격 가져오기
					var couponDiscountPrice = $("#coupon_hidden").val(); //쿠폰이 적용된 할인의 값 가져오기
					var credit = $("#credit_hidden").val(); //적립금 할인이 적용된 값 가져오기
					var totalFinal = paper_settlement_hidden - couponDiscountPrice - credit;
					
					
					$("#paper_settlement").text(totalFinal); //최종 결제금액 삽입
					$("#paper_settlement").digits(); //콤마 삽입
					$("#totalFinal").val(totalFinal); //최종 결제금액 hidden 값에 삽입
//					alert(totalFinal);
					
					//적립률 계산
					var totalForGrade = $("#totalFinal").val();
					var earn = $(".ratio").text();
					var totalForGradeNum = Number(totalForGrade);
					var earnNum = Number(earn);
					var calcEarn = parseInt(totalForGradeNum*(earnNum/100));
					$("#expectAmount").text(calcEarn);
					$("#calcEarn").val(calcEarn);
					
				}
			},500);
		  }
		}
	});
	
	//쿠폰창에서 마우스가 벗어나면 쿠폰창 숨기기
	$("#popSelbox").on({
		mouseleave: function()
		{
			$("#popSelbox").css("display","none");
		}
	})
	
	//결제수단 부분
	$("input[name='settlekind']").on({
		change: function()
		{
			var settlekind = $("input[name='settlekind']:checked").val(); //선택된 결제수단 가져오기
			var infoBenefitChai = document.getElementsByClassName("info_benefit")[0]; //차이 부가설명 부분
			var infoBenefitPayco = document.getElementsByClassName("info_benefit")[3]; //페이코 부가설명 부분
			//카드선택 되어 있을때
			if(settlekind == 'card')
			{
				$(".card_detail").show(); //카드 선택&할부 부분 보이기
				$(infoBenefitChai).hide(); //차이 부가설명 숨기기
				$(infoBenefitPayco).hide(); //페이코 부가설명 숨기기
			}
			//차이가 선택되었을때
			else if(settlekind == 'chai')
			{
				$(infoBenefitChai).show();
				$(".card_detail").hide();
			}
			//페이코가 선택되었을때
			else if(settlekind == 'payco')
			{
				$(infoBenefitPayco).show();
				$(".card_detail").hide();
				$(infoBenefitChai).hide();
			}
			
		}
	})
	
	var cardshow = $("input[name='settlekind']:checked").val(); //선택된 결제수단 가져오기
	if(cardshow == 'card')
	{
		$(".card_detail").show(); //카드 선택&할부 부분 보이기
	}
	
});


//배송지 수정 부분 창 띄우기
var popupWindow = null;
function centeredPopup(url, winName, w, h, scroll) {
    LeftPosition = (screen.width) ? (screen.width - w) / 2 : 0;
    TopPosition = (screen.height) ? (screen.height - h) / 2 : 0;
    settings =
        'height=' + h + ',width=' + w + ',top=' + TopPosition + ',left=' + LeftPosition + ',scrollbars=' + scroll + ',resizable'
    popupWindow = window.open(url, winName, settings)
}

//카드사 & 할부 기간 선택 5만원 이하
var monthLists = new Array(29)
    monthLists["현대 (무이자)"] =
        ["일시불",
            "2개월 (무이자)",
            "3개월 (무이자)",
            "4개월 (무이자)",
            "5개월 (무이자)",
            "6개월 (무이자)",
            "7개월 (무이자)",
            "8개월",
            "9개월",
            "10개월",
            "11개월",
            "12개월"];

    monthLists["신한"] =
        ["일시불"];

    monthLists["비씨"] =
            ["일시불"];
    
    monthLists["KB국민"] =
            ["일시불"];
    
    monthLists["삼성"] =
            ["일시불"];
    
    monthLists["씨티"] =
            ["일시불"];

    monthLists["롯데"] =
            ["일시불"];

    monthLists["하나(외환)"] =
        ["일시불"];

    monthLists["NH채움"] =
        ["일시불"];

    monthLists["우리"] =
        ["일시불"];

    monthLists["수협"] =
       ["일시불"];
    
    monthLists["광주"] =
           ["일시불"];

    monthLists["전북"] =
       ["일시불"];

    monthLists["제주"] =
        ["일시불"];

    monthLists["신협체크"] =
        ["일시불"];

    monthLists["MG새마을체크"] =
        ["일시불"];

    monthLists["저축은행체크"] =
        ["일시불"];

    monthLists["우체국카드"] =
        ["일시불"];

    monthLists["KDB산업은행"] =
       ["일시불"];

    monthLists["카카오뱅크"] =
        ["일시불"];

//카드 & 할부 선택 5만원 이상일때 
	monthLists["현대 (무이자)"] =
        ["일시불",
            "2개월 (무이자)",
            "3개월 (무이자)",
            "4개월 (무이자)",
            "5개월 (무이자)",
            "6개월 (무이자)",
            "7개월 (무이자)",
            "8개월",
            "9개월",
            "10개월",
            "11개월",
            "12개월"];

    monthLists["신한 (무이자)"] =
        ["일시불",
            "2개월 (무이자)",
            "3개월 (무이자)",
            "4개월 (무이자)",
            "5개월 (무이자)",
            "6개월 (무이자)",
            "7개월",
            "8개월",
            "9개월",
            "10개월",
            "11개월",
            "12개월"];

    monthLists["비씨 (무이자)"] =
            ["일시불",
            "2개월 (무이자)",
            "3개월 (무이자)",
            "4개월 (무이자)",
            "5개월 (무이자)",
            "6개월 (무이자)",
            "7개월",
            "8개월",
            "9개월",
            "10개월",
            "11개월",
            "12개월"];
    
    monthLists["KB국민 (무이자)"] =
            ["일시불",
            "2개월 (무이자)",
            "3개월 (무이자)",
            "4개월 (무이자)",
            "5개월 (무이자)",
            "6개월 (무이자)",
            "7개월",
            "8개월",
            "9개월",
            "10개월",
            "11개월",
            "12개월"];
    
    monthLists["삼성 (무이자)"] =
            ["일시불",
            "2개월 (무이자)",
            "3개월 (무이자)",
            "4개월 (무이자)",
            "5개월 (무이자)",
            "6개월 (무이자)",
            "7개월",
            "8개월",
            "9개월",
            "10개월",
            "11개월",
            "12개월"];
    
    monthLists["씨티 (무이자)"] =
            ["일시불",
            "2개월 (무이자)",
            "3개월 (무이자)",
            "4개월 (무이자)",
            "5개월 (무이자)",
            "6개월 (무이자)",
            "7개월",
            "8개월",
            "9개월",
            "10개월",
            "11개월",
            "12개월"];

    monthLists["롯데 (무이자)"] =
            ["일시불",
            "2개월 (무이자)",
            "3개월 (무이자)",
            "4개월 (무이자)",
            "5개월",
            "6개월",
            "7개월",
            "8개월",
            "9개월",
            "10개월",
            "11개월",
            "12개월"];

    monthLists["하나(외환) (무이자)"] =
        ["일시불",
            "2개월 (무이자)",
            "3개월 (무이자)",
            "4개월 (무이자)",
            "5개월 (무이자)",
            "6개월 (무이자)",
            "7개월 (무이자)",
            "8개월 (무이자)",
            "9개월",
            "10개월",
            "11개월",
            "12개월"];

    monthLists["NH채움 (무이자)"] =
        ["일시불",
            "2개월 (무이자)",
            "3개월 (무이자)",
            "4개월 (무이자)",
            "5개월 (무이자)",
            "6개월 (무이자)",
            "7개월",
            "8개월",
            "9개월",
            "10개월",
            "11개월",
            "12개월"];

    monthLists["우리 (무이자)"] =
        ["일시불",
            "2개월 (무이자)",
            "3개월 (무이자)",
            "4개월 (무이자)",
            "5개월 (무이자)",
            "6개월 (무이자)",
            "7개월 (무이자)",
            "8개월",
            "9개월",
            "10개월",
            "11개월",
            "12개월"];

    monthLists["수협"] =
        ["일시불"];
    
    monthLists["광주 (무이자)"] =
            ["일시불",
            "2개월 (무이자)",
            "3개월 (무이자)",
            "4개월 (무이자)",
            "5개월 (무이자)",
            "6개월",
            "7개월",
            "8개월",
            "9개월",
            "10개월",
            "11개월",
            "12개월"];

    monthLists["전북 (무이자)"] =
        ["일시불",
            "2개월 (무이자)",
            "3개월 (무이자)",
            "4개월",
            "5개월",
            "6개월",
            "7개월",
            "8개월",
            "9개월",
            "10개월",
            "11개월",
            "12개월"];

    monthLists["제주"] =
        ["일시불"];

    monthLists["신협체크"] =
        ["일시불"];

    monthLists["MG새마을체크"] =
        ["일시불"];

    monthLists["저축은행체크"] =
        ["일시불"];

    monthLists["우체국카드"] =
            ["일시불"];

    monthLists["KDB산업은행"] =
            ["일시불"];

    monthLists["카카오뱅크"] =
            ["일시불"];

		

function cardMonthChange(selectObj) {
    var idx = selectObj.selectedIndex;
    var which = selectObj.options[idx].value;
    mList = monthLists[which];
    var months = document.getElementById("months");

    while (months.options.length > 0) {
        months.remove(0);
    }
    var newOption;
    // create and add new options 
    for (var i = 0; i < mList.length; i++) {
        newOption = document.createElement("option");
        newOption.value = mList[i];
        newOption.text = mList[i];
        try {
            months.add(newOption);
        }
        catch (e) {
            months.appendChild(newOption);
        }
    }
}

//약관 보기
var modal = document.getElementById("orderAgreeOne");
var btn = document.getElementsByClassName("link_terms")[0];
var span = document.getElementsByClassName("close")[0];
btn.onclick = function(){modal.style.display = "block"};
span.onclick = function(){modal.style.display = "none"};
window.onclick = function(event){
    if(event.target == modal)
    {
        modal.style.display = "none";
    }
}

var modal = document.getElementById("orderAgreeTwo");
var btn = document.getElementsByClassName("link_terms")[1];
var span = document.getElementsByClassName("close")[1];
btn.onclick = function(){modal.style.display = "block"};
span.onclick = function(){modal.style.display = "none"};
window.onclick = function(event){
    if(event.target == modal)
    {
        modal.style.display = "none";
    }
}

function validate(){
	var ordAgree = document.frmOrder.ordAgree;
	if(ordAgree.checked == false){
		alert("결제 진행 필수 동의 내용에 동의하셔야 결제가 가능합니다.");
		return false;
	}
	else{
		return true;
	}
}



    



