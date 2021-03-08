<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="base_wrap mt65 mb120">
	<div id="bulk">
		<h2>대량주문 문의</h2>
		<div>
			<ul class="gray-list">
				<li>최소 구매금액 100만원 이상 시 해당 서비스를 이용할실 수 있습니다.( 기준 충족 시 다중배송가능)</li>
				<li>여러 주소지에 배송 주문 시,주소지 1곳 당 결제금액이 4만원 미만일 경우 주소지당 개별 배송비가 발생됩니다.</li>
				<li>문의를 남겨주시면 빠른 시간 내에 상담 전화 드립니다.( 1644-1108,메일: kurlygift@kurlycorp.com )</li>
				<li>배송관련,주문(취소/교환/환불)관련 문의 및 요청사항은 1:1문의/카카오톡/고객센터(1644-1107)로 문의바랍니다.</li>
			</ul>
			<form method="post" action="bulkOrderOk" onsubmit="return bulkCheck()" >
			<div class="section-wrap">
				<table class="table">
					<tr>
						<th>신청자 이름*</th>
						<td><input type="text" name="name" placeholder="  신청자 이름"></td>
					</tr>
					<tr>
						<th>신청자 연락처*</th>
						<td><input type="text" name="phone" placeholder="  신청자 연락처"></td>
					</tr>
					<tr>
						<th>신청자 이메일*</th>
						<td>
							<input type="text" name="email" placeholder="  신청자 이메일"><p>
							<span>이메일 주소를 작성해 주시면 원할한 소통이 가능합니다.</span>
						</td>
					</tr>
					<tr>
						<th>수령 희망일</th>
						<td>
							<div id="cal">
								<div class="cal-input" onclick="calendar(event)"></div>
								<img src="//res.kurly.com/pc/ico/1117/btn_calendar.png" id="calImg">
								<input type="hidden" name="hopedate"> 
							</div>
							<div class="red">
								수령 희망일이 정확하지 않으실 경우, 가장 빠른 예상 일자를 선택해주세요.<p>
								택배배송으로 진행되며, 일요일 및 공휴일은 배송이 어려울 수 있습니다.
							</div>	
						</td>
					</tr>
					<tr>
						<th>배송지</th>
						<td>
							<input type="radio" name="type" value="m" checked>여러 곳으로 수령
							<input type="radio" name="type" value="o">한 곳으로 수령
						</td>
					</tr>
					<tr>
						<th>문의사항</th>
						<td>
							<textarea name="question" cols="100" rows="5" id="summernote"></textarea><p>
							<span class="red">원할한 상담을 위해 상품명,수량,상담전화 희망 시간 등을 적어주세요.</span>						
						</td>
					</tr>
					<tr>
						<th>주의사항</th>
						<td id="disable"> 
							아래 경우 배송이 불가합니다.<p>
							<ul>
								<li>- 수령 배송지가 불명확한 경우</li>
								<li>- 제주도 및 도서산간 일부 지역</li>
							</ul>
						</td>
					</tr>
				</table>
			</div>
				<h2>약관 동의*</h2>
				<div class="section-wrap">
					<div>
						<input type="checkbox"> <span class="font13">개인정보 수집이용 동의</span><span id="gray">(필수)</span> <span id="purple">약관보기 ></span>
					</div>
					<hr>
					<div align="center"><input type="submit" value="문의하기" id="mun" onmouseenter="getWhite()" onmouseout="getPurple()"></div>
				</div>
				
			</form>
		</div>
	</div>
</div>