
$(function(){
	
	//체크박스 하나 선택
	$(".ico_check").on("change",function(){
		var chkAll = $(".ico_check").length;
		var chkedNum = $(".ico_check:checked").length;
		
		if(chkAll==chkedNum){
			$("#chkBox").prop("checked", true);
		}else{
			$("#chkBox").prop("checked", false);
		}
	});
	
	//전체해제 & 체크
	$("#chkBox").click(function(){
		var isChk = $(this).is(":checked");
		var chkAll = $(".ico_check").length;
		if(chkAll>0){
			if(isChk){
				$(".ico_check").each(function() {
					$(this).prop("checked", true);
					$("#chkBox").prop("checked", true);
				});
			
			}else{
				$(".ico_check").each(function() {
					$(this).prop("checked", false);
					$("#chkBox").prop("checked", false);
				});
			};
		}else{
			$(this).prop("checked", false);
		}
		
	});

	//장바구니 추가 모달
	$('#basket-modal').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget);
		var pno = button.data('whatever');
		var modal = $(this);
		
		$.ajax({
			url: 'livingToBasket'
			, type: 'post'
			, data: {
				pno:pno
			},success: function(json){
				
				alert('성공');
				
			}, error: function(error){
				console.log("에러 : " + error);
           	}
		});
	});
	$('#basket-modal').on('hide.bs.modal', function (event) {
		var param = $("form[name=loginuser]").serialize();

		var button = $(event.relatedTarget);
		var pno = button.data('whatever');
		var modal = $(this);
		
		$.ajax({
			url: 'livingToBasket'
			, type: 'post'
			, data: {
				pno:pno
			},success: function(json){
				
				alert('성공');
				
			}, error: function(error){
				console.log("에러 : " + error);
           	}
		});
	});
	
	//늘사는것 추가 모달
	$('#living-Modal').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget);
		var pno = button.data('whatever');
		var modal = $(this);
		
		$.ajax({
			url: 'putOnLiving'
			, type: 'post'
			,traditional : true
			, data: {
				pno:pno
			},success: function(data){
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
