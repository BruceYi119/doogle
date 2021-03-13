<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="page_aticle aticle_type2">
	<div class="page_section section_qna">
		<div class="head_aticle">
			<h2 class="tit">1:1 문의</h2>
		</div>

		<div class="xans-board-write">
			<form name="fm" id="fm" method="post" action="/shop/qnaUpdateOk"
				enctype="multipart/form-data" onsubmit="return chkForm(this)"
				style="height: 100%;">
				<input type="hidden" value="${dto.qnno}" name="qnno">
				<input type="hidden" name="name" value="session"> <input
					type="hidden" name="mno" value="222">
				<table id="table_after" class="boardWrite2" width="100%">
					<colgroup>
						<col width="14%" align="right">
					</colgroup>
					<tbody>
						<tr>
							<th class="input_txt">제목</th>
							<input type="hidden" value="${dto.ctno}" id="ctnoval">
							<td><select name="ctno" required="" fld_esssential=""
								label="질문유형" class="select">
									<option value="">선택해주세요.</option>
									<option value="243">배송지연/불만</option>
									<option value="244">컬리패스 (무료배송)</option>
									<option value="245">반품문의</option>
									<option value="246">A/S문의</option>
									<option value="247">환불문의</option>
									<option value="248">주문결제문의</option>
									<option value="249">회원정보문의</option>
									<option value="250">취소문의</option>
									<option value="251">교환문의</option>
									<option value="252">상품정보문의</option>
									<option value="253">기타문의</option>
							</select><br> 
							
							<input type="text" name="title" style="width: 100%"
								required="" fld_esssential="" label="제목" value="${dto.title}">
							</td>
						</tr>
						<tr>
							<th class="input_txt">주문번호</th>
							<td><input type="text" name="ono" style="width:25%" id="onono">
								<input onclick="order_open()" type="button"
								class="bhs_button yb" value="주문조회"
								style="float: none; line-height: 27px; width: 100px;">
								<div style="position: relative; z-index: 1">
									<iframe id="ifm_order" frameborder="0" scrolling="no"
										style="display: none; position: absolute; width: 560px; height: 380px; background-color: #fff; position: absolute; left: 0; top: 0; border: 1px solid #000"></iframe>
								</div></td>
						</tr>
						<tr>
							<th class="input_txt">이메일</th>
							<td><input type="text" name="email" size="26"
								class="read_only" value="${dto.email}"> <span class="noline smalle"
								style="padding-left: 10px"> <input type="checkbox"
									id="idemail_yn"> <input type="hidden" name="email_yn"
									value="n" id="email"> <span style="font-size: 8pt;">답변수신을
										이메일로 받겠습니다.</span></span></td>
						</tr>
						<tr>
							<th class="input_txt">문자메시지</th>
							<td><input type="text" name="phone" class="read_only" value="${dto.phone}">
								<span class="noline smalle" style="padding-left: 10px"> <input
									type="checkbox" id="idphono_yn"> <input type="hidden"
									name="phone_yn" value="n" id="phone"> <span
									style="font-size: 8pt;">답변수신을 문자메시지로 받겠습니다.</span>
							</span></td>
						</tr>
						<tr>
							<th class="input_txt">내용</th>
							<td class="edit_area" style="position: relative;">
								<div id="qnaNotice">
									<div class="inner_qnaNotice">
										<div class="notice_qna">
											<strong class="tit qna_public">1:1 문의 작성 전 확인해주세요!</strong> <strong
												class="tit qna_goods">상품문의 작성 전 확인해 주세요!</strong>

											<dl class="list qna_public">
												<dd>현재 문의량이 많아 답변이 지연되고 있습니다. 문의 남겨 주시면 2일 이내 순차적으로 답변
													드리겠습니다.</dd>
											</dl>

											<dl class="list qna_goods">
												<dd>
													<span>답변은 영업일 기준 2~3일 소요됩니다.</span> <span>해당 게시판의
														성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</span> <span>배송관련,
														주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 1:1 문의에 남겨주세요.</span>
												</dd>
											</dl>

											<dl class="list qna_goods">
												<dt>제품</dt>
												<dd>
													<span>입고일: 품절 상품 입고 일이 확정된 경우, 섬네일에 기재되어 있습니다.(종 모양을
														클릭하여, 재입고 알람 설정 가능)</span> <span>제품 상세정보: 영양성분 및 함량, 용량,
														보관 및 취급 방법 등 제품 정보는 상세 이미지 또는 상세정보에서 확인 가능합니다.</span>
												</dd>
											</dl>

											<dl class="list qna_public">
												<dt>반품 / 환불</dt>
												<dd>
													<span>제품 하자 혹은 이상으로 반품 (환불)이 필요한 경우 사진과 함께 구체적인 내용을
														남겨주세요.</span>
												</dd>
											</dl>

											<dl class="list" id="branchByVersion15">
												<dt>주문취소</dt>
												<dd class="old" style="display: none">
													<!-- 구버전 분기처리 -->
													<span>샛별 지역 : 배송일 전날 19시까지 <br> 택배 지역 : 배송일 전날
														18시까지 <br> 고객행복센터(1644-1107)/ 1:1문의 게시판/ 카카오톡(마켓컬리)
														으로 취소 요청 바랍니다.
													</span> <span>생산이 시작된 이후에는 취소가 불가능 한 점 고객님의 양해 부탁드립니다.</span> <span>일부
														예약상품은 배송 3~4일 전에만 취소 가능합니다.</span> <span>주문상품의 부분 취소는
														불가능합니다. 전체 주문 취소 후 재구매 해주세요.</span> <span>비회원 주문건의 경우
														1:1문의 게시판 접수가 불가하기에 고객행복센터(1644-1107), 카카오톡(마켓컬리) 로 취소 요청
														부탁드립니다.</span>
												</dd>
												<dd class="new">
													<span> 배송 단계별로 주문취소 방법이 상이합니다. <br> [입금확인] 단계 :
														[마이컬리 &gt; 주문내역 상세페이지] 에서 직접 취소 가능 <br> [입금확인] 이후 단계
														: 고객행복센터로 문의
													</span> <br> <span>생산이 시작된 [상품 준비중] 이후에는 취소가 제한되는 점
														고객님의 양해 부탁드립니다.</span> <span>비회원은 모바일 App 또는 모바일 웹사이트에서
														[마이컬리 &gt; 비회원 주문 조회 페이지] 에서 취소가 가능합니다.</span> <span>일부
														예약상품은 배송 3~4일 전에만 취소 가능합니다.</span> <span>주문상품의 부분 취소는
														불가능합니다. 전체 주문 취소 후 재구매 해주세요.</span>
												</dd>
											</dl>

											<dl class="list">
												<dt>배송</dt>
												<dd>
													<span>주문 완료 후 배송 방법(샛별 / 택배)은 변경이 불가능합니다.</span> <span>배송일
														및 배송시간 지정은 불가능합니다. (예약배송 포함)</span>
													<p class="info">※ 전화번호, 이메일, 주소, 계좌번호 등의 상세 개인정보가 문의
														내용에 저장되지 않도록 주의해 주시기 바랍니다.</p>
												</dd>
											</dl>
										</div>
									</div>
								</div> 
                            <textarea name="content"
									style="width: 100%; height: 474px;" class="editing_area"
									required="" fld_esssential="" label="내용" id="summernote">${dto.content}</textarea>
								<input type="hidden" name="fno" value="1">
							</td>
						</tr>
						<tr>
							<th class="input_txt">이미지</th>
							<td>
								<table width="95%" id="table" cellpadding="0" cellspacing="0"
									border="0"
									style="border: solid 1px #f4f4f4; border-collapse: collapse;">
									<tbody>
										<tr id="tr_0">
											<td width="100%"><input type="file" name="file"
												style="width: 50%" class="linebg"> <a
												href="javascript:add()"><img
													src="../static/front/img/upload.jpg" align="absmiddle"></a>
											</td>
										</tr>
									</tbody>
								</table>
								<table>
									<tbody>
										<tr>
											<td height="2"></td>
										</tr>
									</tbody>
								</table>
								<div width="100%" style="padding: 5px;" class="stxt">
									- 파일은 최대 5개까지 업로드가 지원됩니다.<br>
								</div>
							</td>
						</tr>
					</tbody>
				</table>

				<table width="100%">
					<tbody>
						<tr>
							<td align="right" style="padding-top: 5px; border: none;"
								id="avoidDbl"><input type="submit" class="bhs_button yb"
								value="저장" style="float: none;"></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>

	</div>
</div>