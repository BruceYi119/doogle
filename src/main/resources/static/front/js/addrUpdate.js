//$(function(){
//	var value = $('input:radio[name="pickUpType"]:checked').val();
////	alert(value);
//	if(value == 1) 
//	{
////		alert("Hello");
//	}
	
	
//});


//화면이 load되었을때 숨겨질 내용과 보여질 내용 
$(document).ready(function () {

    $(".place_doorstep").hide()
    $(".place_guard").hide()
    $(".place_delivery").hide()
    $(".place_etc").hide()

    $("#meansTypeTwoNotice").hide()
    $("#meansTypeTwoNoticePost").hide()
    $(".subRadio").hide();
    $(".subRadioPost").hide();
    $("#meansTypeThreeNotice").hide();
    $("#meansTypeThreeNoticePost").hide();

    //받으실 장소 옵션
    $("input:radio[name='pickUpType']").change(function () {
        // 문앞 선택시 공동현관 출입방법 보이기
        if ($(this).val() == "1") {
            $(".place_doorstepDoor").show();
			$(".placeGuardText").val("");		//경비실 특이사항		
			$(".placeDeliveryText").val("");	//택배함 정보
			$(".menasPostText").val("");			//택배함 공동현관 비밀번호 
			$(".subRadioPostText").val("");		//택배함 기타 선택
			$(".fieldText").val("");			//기타장소
        }
        else {
            $(".place_doorstepDoor").hide();
        }
        // 경비실 선택시
        if ($(this).val() == "2") {
            $(".place_guard").show();
			$(".doorPinDoorstep").val("");	//문앞 공동현관 비밀번호
			$(".subRadioText").val("");			//문앞 기타
			$(".placeDeliveryText").val("");	//택배함 정보
			$(".menasPostText").val("");			//택배함 공동현관 비밀번호 
			$(".subRadioPostText").val("");		//택배함 기타 선택
			$(".fieldText").val("");			//기타장소
        }
        else {
            $(".place_guard").hide();
        }
        // 택배함 선택시
        if ($(this).val() == "3") {
            $(".place_delivery").show();
            $(".place_doorstep").show();
			$(".doorPinDoorstep").val("");	//문앞 공동현관 비밀번호
			$(".subRadioText").val("");			//문앞 기타
			$(".placeGuardText").val("");		//경비실 특이사항
			$(".fieldText").val("");			//기타장소
        }
        else {
            $(".place_delivery").hide();
            $(".place_doorstep").hide();
        }
        // 기타장소 선택시
        if ($(this).val() == "4") {
            $(".place_etc").show();
			$(".doorPinDoorstep").val("");	//문앞 공동현관 비밀번호
			$(".subRadioText").val("");			//문앞 기타
			$(".placeGuardText").val("");		//경비실 특이사항		
			$(".placeDeliveryText").val("");	//택배함 정보
			$(".menasPostText").val("");			//택배함 공동현관 비밀번호 
			$(".subRadioPostText").val("");		//택배함 기타 선택
        }
        else {
            $(".place_etc").hide();
        }
    });

    // 공동현관 출입방법 3가지 옵션
    $("input:radio[name='meansType']").change(function () {
        // 공동현관 비밀번호 선택
        if ($(this).val() == "1") {
            $("#meansTypeOneNotice").show();
            $(".menas").show();
        }
        else {
            $("#meansTypeOneNotice").hide();
            $(".menas").hide();
        }
        //자유출입가능 선택
        if ($(this).val() == "2") {
            $("#meansTypeTwoNotice").show();
        }
        else {
            $("#meansTypeTwoNotice").hide();
        }
        //기타 선택
        if ($(this).val() == "3") {
            $(".subRadio").show();
            $("#meansTypeThreeNotice").show();
        }
        else {
            $(".subRadio").hide();
            $("#meansTypeThreeNotice").hide();
        }
    });

    // 택배함 공동현관 옵션
    $("input:radio[name='meansTypePost']").change(function () {
        //공동현관 비밀번호 선택
        if ($(this).val() == "1") {
            $("#meansTypeOneNoticePost").show();
            $(".menasPost").show();
        }
        else {
            $("#meansTypeOneNoticePost").hide();
            $(".menasPost").hide();
        }
        //자유출입가능 선택
        if ($(this).val() == "2") {
            $("#meansTypeTwoNoticePost").show();
        }
        else {
            $("#meansTypeTwoNoticePost").hide();
        }
        //기타 선택
        if ($(this).val() == "3") {
            $(".subRadioPost").show();
            $("#meansTypeThreeNoticePost").show();
        }
        else {
            $(".subRadioPost").hide();
            $("#meansTypeThreeNoticePost").hide();
        }
    });
});


//취소버튼 클릭시 창 닫기
function closeCurrentWindow()
{
    window.close();
}


//유효성 검사
function validate()
{
    
    //받으실 장소 radio names
    var pickUpType = document.form.pickUpType;
    //공동현관비밀번호 radio name
    var meansType = document.form.meansType;
    //공동현관비밀번호 radio name
    var meansTypePost = document.form.meansTypePost;

    
    //받으실 분 성함 입력 확인
    if(document.form.receiverName.value == "")
    {
        alert("받으실 분의 성함을 입력 바랍니다.");
        return false;
    }

    //휴대폰 번호 입력 확인
    if(document.form.receiverPhoneNumber.value == "")
    {
        alert("휴대폰 번호를 입력 바랍니다.");
        return false;
    }
    
    //문앞이 선택되었을때
    if(pickUpType[0].checked == true)
    {
        //공동현관비밀번호가 선택되었을때
        if (meansType[0].checked == true)
        {
            //비밀번호 text가 입력되었는지 확인
            if(document.form.doorPinDoorstepDoor.value == "")
            {
                alert("공동현관 비밀번호를 입력바랍니다.");
                return false;
            }
        }

        //기타가 선택되었을때
        if(meansType[2].checked == true)
        {
            if(document.form.doorPinDoorstepPost.value == "")
            {
                alert("기타 내용을 입력 바랍니다.");
                return false;
            }
        }
    }

    //경비실이 선택되었을때
    if(pickUpType[1].checked == true)
    {
        //경비실 특이사항 내용 입력 확인
        if(document.form.pickUpDetailSec.value == "")
        {
            alert("경비실 특이사항을 입력바랍니다.");
            return false;
        }
    }

    //택배함이 선택되었을때
    if(pickUpType[2].checked == true)
    {
        //택배함 정보 내용 입력 확인
        if(document.form.pickUpDetailPost.value == "")
        {
            alert("택배함 정보를 입력바랍니다.");
            return false;
        }

        //공동현관비밀번호가 선택되었을때
        if (meansTypePost[0].checked == true)
        {
            //비밀번호 text가 입력되었는지 확인
            if(document.form.doorPinDoorstepPost.value == "")
            {
                alert("공동현관 비밀번호를 입력바랍니다.");
                return false;
            }
        }

        //기타가 선택되었을때
        if(meansTypePost[2].checked == true)
        {
            if(document.form.meansPost.value == "")
            {
                alert("기타 내용을 입력 바랍니다.");
                return false;
            }
        }
    } 

    //기타가 선택되었을때
    if(pickUpType[3].checked == true)
    {
        if(document.form.pickUpDetailOther.value == "")
        {
            alert("기타장소 세부사항을 입력 바랍니다.");
            return false;
        }
    }

    //배송 완료 메시지 전송 선택
    var deliveryMessageSendAt = document.form.deliveryMessageSendAt;
    for(i=0; i < deliveryMessageSendAt.length; i++)
    {
        if(deliveryMessageSendAt[i].checked == true)
        {
            return true;
        }
    }
}

$(function(){
	$("#receiverPhoneNumber").on({
		keyup: function(){
			this.value=this.value.replace(/[^0-9]/g,""); //숫자만 입력할 수 있게 설정
		}
	});
});









