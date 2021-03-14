<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="/static/front/img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="/static/front/img/favicon.ico" type="image/x-icon" />
<title>Doogle</title>
<link rel="stylesheet" href="/static/front/css/addrUpdate.css">
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
<script defer type="text/javascript" src="/static/front/js/addrUpdate.js"></script>
<script>
$(function(){
    var name='${ddto.receive_name}';
    var phone = '${ddto.phone}';
    //받으실 분 | 휴대폰 번호가 변경되었을때 checked = false
    $('#receiverName').keydown(function() {
        document.getElementById("putUserInfo").checked=false;
    });
    $('input[name=receiverPhoneNumber]').keydown(function() {
        document.getElementById("putUserInfo").checked=false;
    });

    //
    $("input:checkbox[name='putUserInfo']").change(function () {
        if ($(this).prop("checked")) {
            document.getElementById("receiverName").value=name;
            document.getElementById("receiverPhoneNumber").value=phone;
        } else {
            $('input[name=receiverName]').attr('value','');
            $('input[name=receiverPhoneNumber]').attr('value','');
            $('input[name=receiverName]').attr('placeholder', '이름을 입력해 주세요');
            $('input[name=receiverPhoneNumber]').attr('placeholder', '숫자만 입력해주세요');
        }
    }); 
});
</script>
</head>
<body>
	<section id="kAticle">
		<div id="kMain">
			<div id="root">
				<div id="header" class="header only_pc">
					<h2 class="tit_header">배송정보</h2>
					<div class="label_block">
						<input name="putUserInfo" id="putUserInfo" type="checkbox" checked> <span
							class="ico"></span> 주문자 정보와 동일
					</div>
				</div>
				<div class="receive_info reception_info only_pc">
					<form name="form" action="/order/addrUpdate/ok" onsubmit="return validate()">
						<div class="info">
							<h3 class="tit">
								<label for="receive_name"> 받으실 분 <span class="ico">*</span>
								</label>
							</h3>
							<div class="field">
								<!-- 이름 -->
								<input type="text" name="receive_name" id="receiverName" data-max-length="20" class="inp" placeholder="이름을 입력해 주세요" value="${ddto.receive_name}">
							</div>
						</div>
						<div class="info">
							<h3 class="tit">
								<label for="phone"> 휴대폰 <span class="ico">*</span>
								</label>
							</h3>
							<div class="field">
								<input type="text" name="phone" id="receiverPhoneNumber" class="inp" maxlength="11" placeholder="숫자만 입력해주세요" value="${ddto.phone}">
							</div>
						</div>
						<div class="info info_place">
							<h3 class="tit">
								<label for="pickUpType"> 받으실 장소 <span class="ico">*</span>
								</label>
							</h3>
							<div class="radio-group">
								<label class="radio">
									<input type="radio" value="1" name="pickUpType" checked>
									<div class="radioText">문앞</div>
									<span></span>
								</label>
							</div>
							<div class="radio-group">
								<label class="radio">
								<input type="radio" value="2" name="pickUpType">
									<div class="radioText">경비실</div>
									<span></span>
								</label>
							</div>
							<div class="radio-group">
								<label class="radio">
								<input type="radio" value="3" name="pickUpType">
									<div class="radioText">택배함</div>
									<span></span>
								</label>
							</div>
							<div class="radio-group">
								<label class="radio">
								<input type="radio" value="4" name="pickUpType">
									<div class="radioText">기타장소</div>
									<span></span>
								</label>
							</div>
						</div>
	
						<!-- 문앞 선택시 -->
						<div class="info place_doorstepDoor">
							<h3 class="tit">
								<label for="">공동현관 출입방법<span class="ico">*</span></label>
							</h3>
							<div class="field">
								<div class="radio-group">
									<label class="radio">
										<input type="radio" value="1" name="meansType" checked>
										<div class="radioText">공동현관 비밀번호</div>
										<span></span>
									</label>
								</div>
								<!-- 문 앞 선택 시 공동현관 비밀번호 선택 -->
								<div class="menas">
									<input type="text" name="doorPinDoorstepDoor" class="inp doorPinDoorstep" placeholder="예: #1234*">
									<p class="notice">특수문자를 포함한 정확한 비밀번호를 입력해 주세요.</p>
								</div>
								<div class="radio-group">
									<label class="radio">
									<input type="radio" value="2" name="meansType">
										<div class="radioText">자유 출입 가능</div> <span></span>
									</label>
								</div>
								<div class="radio-group">
									<label class="radio">
										<input type="radio" value="3" name="meansType">
										<div class="radioText">기타</div> <span></span>
									</label>
								</div>
								<!-- 공동현과 비밀번호 선택시 확인해주세요 -->
								<div id="meansTypeOneNotice" class="notcie_field">
									<strong class="tit_notice">확인해주세요!</strong>
									<ul class="list_notice ">
										<li>비밀번호가 정확하지 않을 경우, 부득이하게 1층 공동현관 앞 또는 경비실 앞에 배송될 수
											있습니다.</li>
									</ul>
								</div>
								<!-- 자유출입가능 선택 -->
								<div id="meansTypeTwoNotice" class="notcie_field">
									<strong class="tit_notice">확인해주세요!</strong>
									<ul class="list_notice ">
										<li>자유출입이 불가능한 경우, 부득이하게 1층 공동현관 앞 또는 경비실 앞에 배송될 수 있습니다.</li>
									</ul>
								</div>
								<!-- 기타 선택 -->
								<div class="subRadio">
									<textarea class="subRadioText" name="means" maxlength="100" data-max-length="100"
										data-format="text"
										placeholder="예: 연락처로 전화, 경비실로 호출  (배송 시간은 별도로 지정할 수 없습니다)"></textarea>
								</div>
								<div id="meansTypeThreeNotice" class="notcie_field">
									<strong class="tit_notice">확인해주세요!</strong>
									<ul class="list_notice multiple">
										<li>요청하신 방법으로 출입이 어려운 경우, 부득이하게 1층 공동현관 앞 또는 경비실 앞에 배송될 수
											있습니다.</li>
										<li>배송 받으실 시간은 별도로 지정하실 수 없으며, 밤 11시까지 주문 시 오전 7시까지 배송이
											완료됩니다.</li>
									</ul>
								</div>
							</div>
						</div>
	
						<!-- 택배함 선택 -->
						<div class="info place_delivery">
							<h3 class="tit">
								<label for="pBoxInfo">택배함 정보<span class="ico">*</span></label>
							</h3>
							<div class="field">
								<input type="text" class="placeDeliveryText" name="pickUpDetailPost" maxlength="100" data-max-length="100" data-format="text" placeholder="택배함 위치 / 택배함 번호 · 비밀번호" value="">
								<p class="notice">
									・ 지정되지 않은 택배함은 위치만 적어주세요.<br>・ 배송완료 후 택배함 번호와 비밀번호를 알려드려요.
								</p>
							</div>
						</div>
	
						<!-- 택배함 선택시 -->
						<div class="info place_doorstep">
							<h3 class="tit">
								<label for="">공동현관 출입방법<span class="ico">*</span></label>
							</h3>
							<div class="field">
								<div class="radio-group">
									<label class="radio">
										<input type="radio" value="1" name="meansTypePost" checked>
										<div class="radioText">공동현관 비밀번호</div>
										<span></span>
									</label>
								</div>
								<!-- 공동현관 비밀번호 선택 -->
								<div class="menasPost">
									<input type="text" name="doorPinDoorstepPost" maxlength="100"
										class="inp menasPostText" placeholder="예: #1234*" value="">
									<p class="notice">특수문자를 포함한 정확한 비밀번호를 입력해 주세요.</p>
								</div>
								<div class="radio-group">
									<label class="radio">
										<input type="radio" value="2" name="meansTypePost">
										<div class="radioText">자유 출입 가능</div> <span></span>
									</label>
								</div>
								<div class="radio-group">
									<label class="radio">
									<input type="radio" value="3" name="meansTypePost">
										<div class="radioText">기타</div> <span></span>
									</label>
								</div>
								<!-- 공동현과 비밀번호 선택시 확인해주세요 -->
								<div id="meansTypeOneNoticePost" class="notcie_field">
									<strong class="tit_notice">확인해주세요!</strong>
									<ul class="list_notice ">
										<li>비밀번호가 정확하지 않을 경우, 부득이하게 1층 공동현관 앞 또는 경비실 앞에 배송될 수
											있습니다.</li>
									</ul>
								</div>
								<!-- 자유출입가능 선택 -->
								<div id="meansTypeTwoNoticePost" class="notcie_field">
									<strong class="tit_notice">확인해주세요!</strong>
									<ul class="list_notice ">
										<li>자유출입이 불가능한 경우, 부득이하게 1층 공동현관 앞 또는 경비실 앞에 배송될 수 있습니다.</li>
									</ul>
								</div>
								
								<!-- 기타 선택 -->
								<div class="subRadioPost">
									<textarea class="subRadioPostText" name="meansPost" maxlength="100" data-max-length="100"
										data-format="text"
										placeholder="예: 연락처로 전화, 경비실로 호출  (배송 시간은 별도로 지정할 수 없습니다)"></textarea>
								</div>
								<div id="meansTypeThreeNoticePost" class="notcie_field">
									<strong class="tit_notice">확인해주세요!</strong>
									<ul class="list_notice multiple">
										<li>요청하신 방법으로 출입이 어려운 경우, 부득이하게 1층 공동현관 앞 또는 경비실 앞에 배송될 수
											있습니다.</li>
										<li>배송 받으실 시간은 별도로 지정하실 수 없으며, 밤 11시까지 주문 시 오전 7시까지 배송이
											완료됩니다.</li>
									</ul>
								</div>
							</div>
						</div>
	
						<!-- 경비실 선택시 -->
						<div class="info place_guard">
							<h3 class="tit">
								<label for="pickUpDetailSec">경비실 특이사항</label>
							</h3>
							<div class="field">
								<textarea class="placeGuardText" maxlength="100" name="pickUpDetailSec" data-max-length="100" data-format="text" placeholder="경비실 위치 등 특이사항이 있을 경우 작성해주세요"></textarea>
							</div>
							<div class="notcie_field">
								<strong class="tit_notice">확인해주세요!</strong>
								<ul class="list_notice ">
									<li>경비 부재로 출입이 불가능한 경우, 부득이하게 1층 공동현관 앞 또는 경비실 앞에 배송될 수
										있습니다.</li>
								</ul>
							</div>
						</div>
	
						<!-- 기타장소 선택 -->
						<div class="info place_etc">
							<h3 class="tit">
								<label for="pickUpDetailOther"> 기타 장소 세부 사항 <span class="ico">*</span>
								</label>
							</h3>
							<div class="field">
								<textarea class="fieldText" maxlength="100" name="pickUpDetailOther"
									data-max-length="100" data-format="text"
									placeholder="예 : 계단 밑, 주택단지 앞 경비초소를 지나 A동 출입구 (배송 시간은 별도로 지정할 수 없습니다)"></textarea>
							</div>
							<div class="notcie_field">
								<strong class="tit_notice">확인해주세요!</strong>
								<ul class="list_notice multiple">
									<li>정확한 배송을 위해 장소의 특징 또는 출입 방법 등을 자세하게 작성해주세요.</li>
									<li>보일러 실, 양수기 함, 소화전 앞 또는 위탁배송은 불가능 합니다.</li>
									<li>요청하신 장소로 배송이 어려운 경우, 부득이하게 1층 공동현관 앞 또는 경비실 앞에 배송될 수
										있습니다.</li>
									<li>배송 받으실 시간은 별도로 지정하실 수 없으며, 밤 11시까지 주문 시 오전 7시까지 배송이
										완료됩니다.</li>
								</ul>
							</div>
						</div>
	
	
						<div class="info info_msg">
							<h3 class="tit">
								<label for="deliveryMessageSendAt"> 배송 완료 메시지 전송 <span
									class="ico">*</span>
								</label>
								<div class="radio-group">
									<label class="radio orderMsg">
									<input type="radio" value="1" name="deliveryMessageSendAt" checked>
										<div class="radioText">배송직후</div> <span></span>
									</label>
									<label class="radio orderMsg">
										<input type="radio" value="2" name="deliveryMessageSendAt">
										<div class="radioText">오전7시</div> <span></span>
									</label>
								</div>
							</h3>
						</div>
						<div class="submit double">
							<button type="button" class="btn default"
								onclick="closeCurrentWindow()">취소</button>
							<button id="btnSubmit" class="btn active" type="submit">저장</button>
						</div>
					</form>
				</div>
	
			</div>
		</div>
	</section>
</body>
</html>