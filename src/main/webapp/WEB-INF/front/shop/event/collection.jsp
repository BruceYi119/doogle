<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"> 
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script> 
<div class="base_wrap" align="center">
	<div id="container">
		<div id="event_tit" align="left">
			<div class="view_event1">
				<h4 class="brand_tit">
					<strong>두글쇼핑</strong>
				</h4>
				<a href="/terms/" class="btn_link" style="text-decoration: none;">
					<div class="box_btn">가입하고 혜택받기 ></div>
				</a>
			</div>
			<div class="view_event2" align="center">
				<ul>
					<li></li>
					<li class="li_click" onclick="fnMove('1')">Welcome Gift</li>
					<li class="li_click" onclick="fnMove('2')">첫 구매 무료배송</li>
					<li class="li_click" onclick="fnMove('3')">한달동안 5% 적립</li>
					<li></li>
				</ul>
			</div>
		</div>
		<div class="event_benefit" id="benefit1"></div>
		<div class="event_goods">
			<div class="wellcome">
				<div class="wellcome_goods" id="w_goods1">
					<div data-aos="fade-right" data-aos-duration="1500"> 
						<div class="example"><span>→</span><strong>100원</strong> </div> 
					</div>
				</div>
				<div class="wellcome_goods" id="w_goods2">
					<div data-aos="fade-right" data-aos-duration="1500"> 
						<div class="example">
						<span>→</span><strong>1000원</strong> </div> 
					</div>
				</div>
				<div class="wellcome_goods" id="w_goods3">
					<div data-aos="fade-right" data-aos-duration="1500"> 
						<div class="example"><span>→</span><strong>100원</strong> </div> 
					</div>
				</div>
			</div>
			<div class="clear_div"></div>
			<div class="wellcome">
				<div class="wellcome_goods" id="w_goods4">
					<div data-aos="fade-right" data-aos-duration="1500"> 
						<div class="example"><span>→</span><strong>100원</strong> </div> 
					</div>				
				</div>
				<div class="wellcome_goods" id="w_goods5">
					<div data-aos="fade-right" data-aos-duration="1500"> 
						<div class="example"><span>→</span><strong>100원</strong> </div> 
					</div>				
				</div>
				<div class="wellcome_goods" id="w_goods6">
					<div data-aos="fade-right" data-aos-duration="1500"> 
						<div class="example"><span>→</span><strong>100원</strong> </div> 
					</div>				
				</div>
			</div>
			<div class="clear_div"></div>
			<p>· 부정한 방법(중복 가입 또는 중복참여, 명의 도용 등)으로 신규 가입 이벤트를 이용할 경우, 주문 완료
				후에도 주문이 취소될 수 있습니다.</p>

		</div>
		<div class="event_benefit" id="benefit2"></div>
		<div class="event_benefit" id="benefit3"></div>
		<div class="event_benefit" id="benefit4"></div>
		<div class="event_benefit" id="benefit5"></div>
		<div class="event_goods">
			<h1>
				두글쇼핑이 처음인 당신을 위한 <strong>BEST 추천상품</strong>
			</h1>
			<div class="best_div">
				<div class="best_goods" id="b_goods1"></div>
				<div class="best_goods" id="b_goods2"></div>
				<div class="best_goods" id="b_goods3"></div>
				<div class="best_goods" id="b_goods4"></div>
				<div class="best_goods" id="b_goods5"></div>
			</div>
			<div class="clear_div"></div>
			<div class="best_div">
				<div class="best_goods" id="b_goods6"></div>
				<div class="best_goods" id="b_goods7"></div>
				<div class="best_goods" id="b_goods8"></div>
				<div class="best_goods" id="b_goods9"></div>
				<div class="best_goods" id="b_goods10"></div>
			</div>
			<div class="clear_div"></div>
			<div class="select_div">
				<a href=# class="btn_link" style="text-decoration: none;">
					<div class="box_btn" id="white_btn">
						<strong>추천상품</strong> 더 보러가기 >
					</div>
				</a> <a href="/terms/" class="btn_link" style="text-decoration: none;">
					<div class="box_btn" id="purple_btn">
						<strong>회원가입</strong> 하러가기 >
					</div>
				</a>
				<div class="clear_div"></div>
			</div>
		</div>
	</div>
</div>