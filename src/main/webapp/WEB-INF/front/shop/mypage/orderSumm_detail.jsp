<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script>
function cancelAll()
{
	confirm("주문을 정말 취소하시겠습니까?");
	
	var ono = document.getElementById("onoValue").value;
	var mno = document.getElementById("mnoValue").value;
	var url = "/shop/mypage/orderSummDetails/cancel?ono="+ono+"&mno="+mno;
	var chk = new XMLHttpRequest();
	chk.open("get",url);
	chk.send();
	chk.onreadystatechange=function()
	{
		if(chk.readyState==4)
		{
			if(chk.responseText == 1)
			{
				
				var progress = document.getElementsByClassName("progresss");
				for(i=0;i<progress.length;i++)
				{
					progress[i].innerHTML = "주문취소";	
				}			
				alert("주문이 취소되었습니다.");
			}
		}
	}
}
</script>
<div id="main">
        <div id="content">
            <div id="myPageTop" class="page_aticle mypage_top">
                <div class="mypagetop_user">
                    <div class="inner_mypagetop">
                        <div class="grade_user">
                            <div class="grade">
                                <span class="ico_grade class0">
                                    <span class="inner_grade">
                                        <span class="in_grade">일반</span>
                                    </span>
                                </span>
                                <div class="grade_bnenfit">
                                    <div class="user">
                                        <strong class="name">${mdto.name }</strong>
                                        <span class="txt">님</span>
                                    </div>
                                    <div class="benefit"><strong class="tit">
                                        </strong>적립 ${gmDTO.earn }%
                                    </div>
                                </div>
                            </div>
                            <div class="next">
                                <a href="/shop/event/lover" class="total_grade">전체등급 보기</a>
                                <a href="/shop/event/my_benefit" class="next_month">다음 달 예상등급 보기</a>
                            </div>
                            
                        </div>
                        <ul class="list_mypage">
                            <li class="user_reserve">
                                <div class="link">
                                    <div class="tit">적립금
                                        <!---->
                                    </div>
                                    <a href="/shop/mypage/mysaving" class="info"><fmt:formatNumber value="${sDTO.credit }" pattern="#,###"/> 원
                                        <img src="https://res.kurly.com/pc/service/common/1905/ico_arrow_56x56.png" alt="자세히 보기">
                                        <span class="date">소멸 예정<fmt:formatNumber value="${sDTO.exp_credit }" pattern="#,###"/> 원</span>
                                    </a>
                                </div>
                            </li>
                            <li class="user_coupon">
                                <div class="link">
                                    <div class="tit">쿠폰
                                        <!---->
                                    </div> <a href="/shop/mypage/mycoupon" class="info">${couponCnt } 개 <img
                                            src="https://res.kurly.com/pc/service/common/1905/ico_arrow_56x56.png" alt="자세히 보기"></a>
                                </div>
                            </li>
                            <li class="user_kurlypass">
                                <div class="link">
                                    <div class="tit">컬리패스</div>
                                    <!----> <a href="https://www.kurly.com/shop/mypage/kurlypass.php" class="info info_link"> 알아보기 <img
                                            src="https://res.kurly.com/pc/service/common/1905/ico_arrow_56x56.png" alt="자세히 보기"></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <a href="https://www.kurly.com/shop/main/html.php?htmid=event/kurly.htm&amp;name=friend" class="bnr_event" style="background-image: url(bnr_event.jpg);">
                        <img src="https://img-cf.kurly.com/shop/data/skin/designgj/img/banner/ae8763da478b227a3fdf0241c923f953.jpg" alt="할인혜택보러가기">
                    </a>
                </div>
            </div>
            <div class="page_aticle aticle_type2">
                <div id="snb" class="snb_my">
                    <h2 class="tit_snb">마이컬리</h2>
                    <div class="inner_snb">
                        <ul class="list_menu">
                            <li class="on">
                                <a href="/shop/mypage/orderSumm">주문 내역</a>
                            </li>
                            <li>
                                <a href="/shop/deliveryList">배송지 관리</a>
                            </li>
                            <li>
                                <a href="/shop/living">늘 사는 것</a>
                            </li>
                            <li>
                                <a >상품 후기</a>
                            </li>
                            <li>
                                <a href="/shop/mypage/mysaving">적립금</a>
                            </li>
                            <li>
                                <a href="/shop/mypage/mycoupon">쿠폰</a>
                            </li>
                            <li>
                                <a href="/member/info">개인 정보 수정</a>
                            </li>
                        </ul>
                    </div>
                    <a href="/shop/qna_register" class="link_inquire">
                        <span class="emph">도움이 필요하신가요 ?</span>
                        1:1 문의하기
                    </a>
                </div>
                <div id="viewOrderList" class="page_section section_orderview">
                    <div class="head_aticle">
                        <h2 class="tit">
                            주문 내역 상세
                        </h2>
                    </div>
                    <div class="head_section link_type">
                        <h3 class="tit">주문번호 ${oDTO.ono }</h3>
                        <span class="link">
                            배송 또는 상품에 문제가 있나요?
                            <a href="/shop/qna_register">1:1 문의하기</a>
                        </span>
                    </div>
                    <form name="frmOrdView" method="post">
                    	<input type="hidden" id="onoValue" value="${ono }">
                    	<input type="hidden" id="mnoValue" value="${mno }">
                        <table class="tbl tbl_type1">
                            <colgroup>
                                <col style="width:80px;">
                                <col style="width:auto">
                                <col style="width:100px;">
                                <col style="width:136px;">
                            </colgroup>
                            <c:forEach items="${summDetailArr }" var="olDTO">
                            <tr>
                                <td class="thumb">
                                    <img src="${olDTO.floc }${olDTO.fname }" alt="해당 주문 대표 상품 이미지">
                                </td>
                                <td class="info">
                                	<c:if test="${olDTO.pono lt 1}">
                                    <div class="name">
                                        <a href="#" class="link">${olDTO.pname }</a>
                                    </div>
                                    </c:if>
                                    
                                	<c:if test="${olDTO.pono gt 0 }">
                                    <div class="name">
                                        <a href="#" class="link">${olDTO.poname }</a>
                                    </div>
                                    <div class="name_package">
									<a href="#" class="link">${olDTO.pname }</a>
									</div>
                                    </c:if>
                                    <div class="desc">
                                    	<!-- 옵션이 있고 할인이 있고 -->
                                    	<c:if test="${olDTO.pono gt 0 && olDTO.discount gt 0}">
                                        <span class="price"><fmt:formatNumber value="${olDTO.poprice*olDTO.quantity }" pattern="#,###"/> 원</span>
                                        <span class="cost"><fmt:formatNumber value="${olDTO.poprice*olDTO.quantity-(olDTO.poprice*(olDTO.discount/100)*olDTO.quantity) }" pattern="#,###"/> 원</span>
                                        <span class="ea">${olDTO.quantity }개</span>
                                        </c:if>
                                        <!-- 옵션이 있고 할인이 없고 -->
                                    	<c:if test="${olDTO.pono gt 0 && olDTO.discount lt 1}">
                                        <span class="price"><fmt:formatNumber value="${olDTO.poprice*olDTO.quantity }" pattern="#,###"/> 원</span>
                                        <span class="ea">${olDTO.quantity }개</span>
                                        </c:if>
                                        <!-- 옵션이 없고 할인이 있고 -->
                                    	<c:if test="${olDTO.pono lt 1 && olDTO.discount gt 0}">
                                        <span class="price"><fmt:formatNumber value="${olDTO.pprice*olDTO.quantity }" pattern="#,###"/> 원</span>
                                        <span class="cost"><fmt:formatNumber value="${olDTO.pprice*olDTO.quantity-(olDTO.pprice*(olDTO.discount/100)*olDTO.quantity) }" pattern="#,###"/> 원</span>
                                        <span class="ea">${olDTO.quantity }개</span>
                                        </c:if>
                                        <!-- 옵션이 없고 할인이 없고 -->
                                    	<c:if test="${olDTO.pono lt 1 && olDTO.discount lt 1}">
                                        <span class="price"><fmt:formatNumber value="${olDTO.pprice*olDTO.quantity }" pattern="#,###"/> 원</span>
                                        <span class="ea">${olDTO.quantity }개</span>
                                        </c:if>
                                    </div>
                                </td>
                                <c:if test="${oDTO.type eq 'o' }">
                                <td class="progresss end">
                                    주문완료
                                </td>
                                </c:if>
                                <c:if test="${oDTO.type eq 's' }">
                                <td class="progresss end">
                                    배송완료
                                </td>
                                </c:if>
                                <c:if test="${oDTO.type eq 'c' }">
                                <td class="progresss end">
                                     주문취소
                                </td>
                                </c:if>
                                <c:if test="${oDTO.type eq 'ㅇ' }">
                                <td class="progresss end">
                                     배송중
                                </td>
                                </c:if>
                            </tr>
                            </c:forEach>
                        </table>
                    </form>
                    <div id="orderCancel" class="order_cancel">
                        <span class="inner_cancel">
                            <button type="button" class="btn btn_cancel" onclick="cancelAll()">전체 상품 주문 취소</button>
                        </span>
                        <p class="cancel_notice">직접 주문취소는 ‘입금확인’ 상태일 경우에만 가능합니다.</p>
                    </div>
                    <div class="head_section">
                        <h3 class="tit">
                            결제정보
                        </h3>
                    </div>
                    <table class="tbl tbl_type2 tbl_type3">
                        <colgroup>
                            <col style="width:160px">
                            <col style="width:auto">
                        </colgroup>
                        <tr>
                            <th>상품금액</th>
                            <td><span id="paper_goodsprice"><fmt:formatNumber value="${pDTO.productTotalPrice }" pattern="#,###"/></span>원
                            </td>
                        </tr>
                        <tr>
                            <th>배송비</th>
                            <td>
                                <div id="paper_delivery_msg1" style="">
                                    <span id="paper_delivery"><fmt:formatNumber value="${pDTO.deliveryPrice }" pattern="#,###"/></span>원
                                </div>
                                <div id="paper_delivery_msg2" style="display:none"></div>
                            </td>
                        </tr>
                        <tr>
                            <th>상품할인금액</th>
                            <td>- <span id="paper_goodsDc"><fmt:formatNumber value="${pDTO.productDisPrice }" pattern="#,###"/></span>원</td>
                        </tr>
                        <tr>
                            <th>쿠폰할인</th>
                            <td> <span id="paper_coupon"><fmt:formatNumber value="${pDTO.couponDisPrice }" pattern="#,###"/></span>원</td>
                        </tr>
                        <tr>
                            <th>적립금사용</th>
                            <td><span id="paper_emoney"><fmt:formatNumber value="${pDTO.saving }" pattern="#,###"/></span>원</td>
                        </tr>
                        <tr>
                            <th>결제금액</th>
                            <td>
                                <span id="paper_settlement"><fmt:formatNumber value="${pDTO.payment }" pattern="#,###"/></span>원
                            </td>
                        </tr>
                        <tr>
                            <th>적립예정금액</th>
                            <td>
                                <fmt:formatNumber value="${pDTO.savingPrice }" pattern="#,###"/>원
                            </td>
                        </tr>
                        <tr>
                            <th>결제방법</th>
                            <c:if test="${pDTO.type eq 'c' }">
                            <td>카드</td>
                            </c:if>
                            <c:if test="${pDTO.type eq 'h' }">
                            <td>CHAI결제</td>
                            </c:if>
                            <c:if test="${pDTO.type eq 't' }">
                            <td>TOSS결제</td>
                            </c:if>
                            <c:if test="${pDTO.type eq 'n' }">
                            <td>네이버페이</td>
                            </c:if>
                            <c:if test="${pDTO.type eq 'o' }">
                            <td>PAYCO결제</td>
                            </c:if>
                            <c:if test="${pDTO.type eq 's' }">
                            <td>SMILE결제</td>
                            </c:if>
                            <c:if test="${pDTO.type eq 'p' }">
                            <td>휴대폰결제</td>
                            </c:if>
                        </tr>
                    </table>
                    <div class="head_section">
                        <h3 class="tit">주문정보</h3>
                    </div>
                    <table class="tbl tbl_type2">
                        <colgroup>
                            <col style="width:160px">
                            <col style="width:auto">
                        </colgroup>
                        <tr>
                            <th>주문 번호</th>
                            <td>${ono }</td>
                        </tr>
                        <tr>
                            <th>주문자명</th>
                            <td>${mdto.name }</td>
                        </tr>
                        <tr>
                            <th>보내는 분</th>
                            <td>${mdto.name }</td>
                        </tr>
                        <tr>
                            <th>결제일시</th>
                            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pDTO.writedate}" /></td>
                        </tr>
                    </table>
                    <div class="head_section">
                        <h3 class="tit">배송 정보</h3>
                    </div>
                    <table class="tbl tbl_type2">
                        <colgroup>
                            <col style="width:160px">
                            <col style="width:auto">
                        </colgroup>
                        <tr>
                            <th>받는 분</th>
                            <td>${dvDTO.receive_name }</td>
                        </tr>
                        <tr>
                            <th>핸드폰</th>
                            <td>
                                ${dvDTO.phone }
                            </td>
                        </tr>
                        <tr>
                            <th>배송방법</th>
                            <c:if test="${dvDTO.type eq 't' }">
                            <td>
                            	택배배송
                            </td>
                            </c:if>
                            <c:if test="${dvDTO.type eq 's' }">
                            <td>
                            	샛별배송
                            </td>
                            </c:if>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td>
                                ${dvDTO.addr }
                                ${dvDTO.addr_detail }
                            </td>
                        </tr>
                        <!-- 문앞일때 -->
                        <c:if test="${dvDTO.pickuptype == '문앞' }">
                        <tr>
                            <th>받으실 장소</th>
                            <td>${dvDTO.pickuptype }</td>
                        </tr>
                        <tr>
                            <c:if test="${dvDTO.pickuptype_content == '공동현관비밀번호'}">
                            <th>공동현관 출입 방법</th>
                            <td>공동현관 비밀번호 (${dvDTO.pickuptype_detail })</td>
                            </c:if>
                            <c:if test="${dvDTO.pickuptype_content == '자유출입가능'}">
                            <th>출입 방법</th>
                            <td>자유 출입 가능</td>
                            </c:if>
                            <c:if test="${dvDTO.pickuptype_content == '기타'}">
                            <th>기타 내용</th>
                            <td>${dvDTO.pickuptype_detail}</td>
                            </c:if>
                        </tr>
                        </c:if>
                        <!-- 경비실 -->
                        <c:if test="${dvDTO.pickuptype == '경비실' }">
                        <tr>
                            <th>받으실 장소</th>
                            <td>경비실</td>
                        </tr>
                        <tr>
                            <th>경비실 특이사항</th>
                            <td>${dvDTO.pickuptype_detail}</td>
                        </tr>
                        </c:if>
                        <!-- 택배함 -->
                        <c:if test="${dvDTO.pickuptype == '택배함' }">
                        <tr>
                            <th>받으실 장소</th>
                            <td>${dvDTO.pickuptype }</td>
                        </tr>
                        <tr>
                            <c:if test="${dvDTO.pickuptype_content == '공동현관비밀번호'}">
                            <th>공동현관 출입 방법</th>
                            <td>공동현관 비밀번호 (${dvDTO.pickuptype_detail })</td>
                            </c:if>
                            <c:if test="${dvDTO.pickuptype_content == '자유출입가능'}">
                            <th>출입 방법</th>
                            <td>자유 출입 가능</td>
                            </c:if>
                            <c:if test="${dvDTO.pickuptype_content == '기타'}">
                            <th>기타 내용</th>
                            <td>${dvDTO.pickuptype_detail}</td>
                            </c:if>
                        </tr>
                        </c:if>
                        <!-- 기타장소 -->
                        <c:if test="${dvDTO.pickuptype == '기타장소' }">
                        <tr>
                            <th>받으실 장소</th>
                            <td>기타 장소</td>
                        </tr>
                        <tr>
                            <c:if test="${dvDTO.pickuptype_content == '공동현관비밀번호'}">
                            <th>내용</th>
                            <td>(${dvDTO.pickuptype_detail })</td>
                            </c:if>
                        </tr>
                        </c:if>
                    </table>
                    <div class="head_section">
                        <h2 class="tit">추가 정보</h2>
                    </div>
                    <table class="tbl tbl_type2">
                        <colgroup>
                            <col style="width:160px">
                            <col style="width:auto">
                        </colgroup>
                        <tr>
                            <th>메세지 전송 시점</th>
                            <td> ${dvDTO.delivery_msg } </td>
                        </tr>
                        <tr>
                            <th>미출시 조치방법</th>
                            <td>결제수단으로 환불</td>
                        </tr>
                    </table>
                    
                </div>
            </div>
        </div>
    </div>