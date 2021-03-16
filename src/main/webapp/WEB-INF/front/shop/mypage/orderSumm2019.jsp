<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script>
function view()
{
	for(i=1;i<$(".dateSearch").length;i++)
		$(".dateSearch").eq(i).slideDown(200);
	
	$(".on").eq(1).text("전체기간");
}

function hide(n)
{
	for(i=1;i<$(".dateSearch").length;i++)
		$(".dateSearch").eq(i).slideUp(200);
	document.getElementById("searchDateHiddenId").value=n;
	 
	$(".on").eq(1).text($(".dateSearch").eq(n).text());
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
                                <div class="grade_z`bnenfit">
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
                                        <span class="date">소멸 예정 <fmt:formatNumber value="${sDTO.exp_credit }" pattern="#,###"/> 원</span>
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
                                <a href="/shop/deliveryList" >배송지 관리</a>
                            </li>
                            <li>
                                <a href="/shop/living">늘 사는 것</a>
                            </li>
                            <li>
                                <a>상품 후기</a>
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
                <div id="viewOrderList" class="page_section section_orderlist">
                    <div class="head_aticle">
                        <h2 class="tit">
                            주문 내역 
                            <span class="tit_sub">지난 3년간의 주문 내역 조회가 가능합니다</span>
                        </h2>
                    </div>
                    <input id="searchDateHiddenId" type="hidden">
                    <div class="search_date">
                        <ul class="layer_search">
                            <li class="dateSearch" onclick="view()"><a class="on">기간선택</a></li>
                            <li class="dateSearch" onclick="hide(1)"><a href="/shop/mypage/orderSumm" >전체기간</a></li>
                            <li class="dateSearch" onclick="hide(1)"><a href="/shop/mypage/orderSumm2021" >2021 년</a></li>
                            <li class="dateSearch" onclick="hide(2)"><a href="/shop/mypage/orderSumm2020" >2020 년</a></li>
                            <li class="dateSearch" onclick="hide(3)"><a href="/shop/mypage/orderSumm2019" >2019 년</a></li>
                        </ul>
                    </div>
                    <ul class="list_order">
                    	<c:if test="${ordersArr.size() lt 1}">
                    	<li class="no_data">
						주문내역이 없습니다.
						</li>
                    	</c:if>
                    	<c:if test="${ordersArr.size() gt 0}">
                    	<c:forEach var="i" begin ="0" end="${ordersArr.size()-1}">
                        <li>
                            <div class="date"><fmt:formatDate pattern="yyyy.MM.dd (HH시mm분)" value="${ordersArr[i].writedate }" /></div>
                            <div class="order_goods">
                                <div class="name"><a href="/shop/mypage/orderSumm_detail?ono=${ordersArr[i].ono }">${firstName[i]} 외 ${ordersSize[i]-1 }건</a></div>
                                <div class="order_info">
                                    <div class="thumb">
                                    	<img src="${floc[i]}${fname[i]}" alt="해당 주문 대표 상품 이미지">
                                   	</div>
                                    <div class="desc">
                                        <dl>
                                            <dt>주문번호</dt>
                                            <dd>${ordersArr[i].ono }</dd>
                                        </dl>
                                        <dl>
                                            <dt>결제금액</dt>
                                            <dd>${ordersArr[i].payment }원</dd>
                                        </dl>
                                        <dl>
                                            <c:if test="${ordersArr[i].type eq 'o' }">
                                            <dt>주문상태</dt>
                                            <dd class="status end">주문완료</dd>
                                            </c:if>
                                            <c:if test="${ordersArr[i].type eq 's' }">
                                            <dt>주문상태</dt>
                                            <dd class="status end">배송완료</dd>
                                            </c:if>
                                            <c:if test="${ordersArr[i].type eq 'c' }">
                                            <dt>주문상태</dt>
                                            <dd class="status end">취소</dd>
                                            </c:if>
                                            <c:if test="${ordersArr[i].type eq 'd' }">
                                            <dt>주문상태</dt>
                                            <dd class="status end">배송중</dd>
                                            </c:if>
                                        </dl>
                                    </div>
                                </div>
                                <div class="order_status">
									<span class="inner_status">
                                        <!---->
                                        <!----> <a class="link ga_tracking_event" href="/shop/qna_register">1:1 문의</a>
                                    </span>
                                </div>
                            </div>
                        </li>
                        </c:forEach>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>