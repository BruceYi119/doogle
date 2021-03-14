<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div id="main">
       <div id="content">
           <div class="page_aticle section_end">
               <div class="order_result">
                    <div class="delivery_check">
                        <img src="https://res.kurly.com/mobile/service/order/1909/img_success_order_end.gif" alt="아이콘" class="ico">
                        <div class="check">
                            <p class="tit"><span class="name">${name }님의</span> <span class="name">주문이 완료되었습니다.</span></p>
                            <strong>내일 아침</strong>에 만나요!
                        </div>
                    </div>
                    <div class="amount_money ">
                        <strong class="tit">결제금액</strong>
                        <div class="money_point">
                            <strong class="money"><fmt:formatNumber value="${payment}" pattern="#,###"/> <span class="won">원</span></strong>
                            <a class="point" href="https://www.kurly.com/shop/main/html.php?htmid=event/kurly.htm&name=lovers">
                                <strong class="amount"><fmt:formatNumber value="${creditEarned}" pattern="#,###"/> 원 적립*</strong>
                                <span class="grade">(${gDTO.name } ${gDTO.earn }%)</span>
                            </a>
                        </div>
                        <p class="desc ">
                            * 적립금은 배송당일에 적립됩니다.
                        </p>
                        <a class="btn btn_positive" href="/shop">홈으로 이동</a>
                        <a href=""
                            class="btn btn_orderlist">주문내역 상세보기</a>
                        <p class="txt_cancel">
                            <strong class="emph">‘입금확인’</strong> 상태일 때는 주문내역 상세 페이지에서 직접 주문 취소가 가능합니다.
                        </p>
                    </div>
                    <span class="bg"></span>
                    <span class="bg lst"></span>
               </div>
                <a class="take_away" href="https://www.kurly.com/shop/event/kurlyEvent.php?htmid=event/2020/0303/paper">
                    <strong class="tit">종이 박스, 컬리가 회수해드려요.</strong>
                    <div class="desc">
                        다음 주문 시, 펼쳐서 문 앞에 놓아 주세요. (최대 3개)
                    </div>
                    <span class="link">자세히 보러가기</span>
                </a>
                <div class="inquiry_check">
                    주문 / 배송 및 기타 문의가 있을 경우, 1:1문의에 남겨주시면 신속히 해결해드리겠습니다.
                </div>
           </div>
       </div>
   </div> 