<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>

/* 알림메시지 모달 */
#living-Modal .modal-header {
	margin: 25px;
	height:50px;
	line-height:50px;
    box-sizing: border-box;
    font-size: 14px;
    font-weight: 700;
    letter-spacing: -.025em;
    color: #5f0080;
    padding:0;
    border-bottom: 1px solid #b2b2b2;
}

#living-Modal .modal-header .notice-tit{
	width:420px;
	float:left;
}

#living-Modal .notice-header .notice-close-button{
	margin:15px auto;
    box-sizing: border-box;
    font-size: 0;
    overflow: visible;
    text-transform: none;
    cursor: pointer;
    letter-spacing: -.05em;
    max-width: 100%;
    outline: none;
    width: 20px;
    height: 20px;
    background-image: url('/static/front/img/shop/living/notice-delete.JPG');
    text-indent: -9999px;
    position: absolute;
    border:none;
	box-shadow:none;
	float:right;
	background-repeat: no-repeat;
}

#living-Modal .notice-content {
    line-height: 1;
    letter-spacing: -.05em;
    color: #4c4c4c;
    font-size: 12px;
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    display: table;
    width: 100%;
}

#living-Modal .notice-content .msg{
    letter-spacing: -.05em;
    color: #4c4c4c;
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    word-break: break-all;
    height: 60px;
    display: table-cell;
    vertical-align: middle;
    font-size: 13px;
    line-height: 1.5;
    text-align: center;
    width: 100%;
}

#living-Modal .modal-footer{
    line-height: 1;
    letter-spacing: -.05em;
    color: #4c4c4c;
    font-size: 12px;
    margin: 0;
    background-color: #f5f5f5;
    padding: 30px 0;
}

#living-Modal .modal-footer .footer-btn{
	margin: 0 auto;
}

#living-Modal .modal-footer .footer-btn .ok-btn{
    border:none;
	box-shadow:none;
    overflow: visible;
    border-radius: 0;
    text-transform: none;
    cursor: pointer;
    letter-spacing: -.05em;
    max-width: 100%;
    outline: none;
    display: inline-block;
    border: 1px solid #5f0080;
    text-align: center;
    font-size: 13px;
    width: 150px;
    height: 45px;
    line-height: 45px;
    background-color: #5f0080;
    color: #fff;
	float:none;
}

</style>
<script>
$(function(){
	//모달버튼클릭시 pno받고 모달내용출력
	$('#living-Modal').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget) // Button that triggered the modal
		var pno = button.data('whatever')
		var modal = $(this)
		
		$.ajax({
			url: 'putOnLiving'
			, type: 'post'
			,traditional : true
			, data: {
				pno:pno
			},success: function(data){
				alert(data);
				if(data!=0){
					modal.find('.msg').text("이미 늘 사는 리스트에 존재하는 상품입니다.");
				}else{
					modal.find('.msg').text("늘 사는 리스트에 추가했습니다.");
				}
				
			}, error: function(error){
				console.log("에러 : " + error);
	          	}
		});
	});
});
</script>
<div class="base wrap">
	<button type="button" class="btn add-living" data-toggle="modal" data-target="#living-Modal" data-whatever="2"> 늘 사는 것 </button>
	<div class="modal" id="living-Modal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
		  <!-- Modal Header -->
	      <div class="modal-header">
	        <div class="notice-header">
	        <div class="notice-tit">알림메세지</div>
	        <div class="close-btn"><button type="button" class="notice-close-button" data-dismiss="modal">이 메세지를 닫기</button></div>
	      </div>
	      </div>
	      <!-- Modal body -->
	      <div class="modal-body">
			<div class="notice-content">
				<p class="msg"></p>
			</div>
	      </div>
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <div class="footer-btn">
				<button type="button" class="ok-btn" data-dismiss="modal">확인</button> 
			</div>
	      </div>
	    </div>
	  </div>
	</div>
</div>
