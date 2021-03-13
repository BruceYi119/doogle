$(function(){
	$(".answer").click(function(){
		
		let qqno = $(this).parents("tr").find(".qnno").text();
		location.href="/admin/qnaAnswerWrite?no="+qqno;
	});
	
	$(".title").click(function(){
		let qqno1 = $(this).parent().find(".qnno").text()
		location.href="/admin/quaAnswerView?no="+qqno1;
	})
	
	})
	$(".emailSend").click(function(){
			var addr = $(this).parent().find(".emailAddr").val();
			var title = $(this).parents("tr").find(".title").text();
			var qnno = $(this).parents("tr").find(".qnno").text();
			var name = $(this).parents("tr").find(".name").val();
			
			$.ajax({
					url:"/admin/qnaAnswerMail",
					type:"get",
					data:{addr:addr,
						  title:title,
						  name:name,
						  qnno:qnno,
						},
					success:function(){
						$("#emailDone").attr("class","btn btn-warning").text("메일전송 완료");
						alert("메일 전송 완료");
						$("#emailDone").prop('disabled',true);
					}
					})
		
		
//			var addr = $(this).parent().find(".emailAddr").val();
//			var title = $(this).parents("tr").find(".title").text();
//			var qnno = $(this).parents("tr").find(".qnno").text();
//			var name = $(this).parents("tr").find(".name").val();
//			location.href="/admin/qnaAnswerMail?addr="+addr+"&title="+title+"&qnno="+qnno+"&name="+name;
		})
		
	$(".phoneSend").click(function(){
			var phone = $(this).parent().find(".phoneNum").val();
			var qnno = $(this).parents("tr").find(".qnno").text();
		$.ajax({
				url:"/admin/qnaAnswerPhone",
				type:"get",
				data : {qnno:qnno,
						phone:phone,
						},
				success:function(){
					$("#phoneDone").attr("class","btn btn-warning").text("문자전송 완료");
					alert("문자 전송 완료");
					$("#phoneDone").prop('disabled',true);
				}
				})
		
//		var phone = $(this).parent().find(".phoneNum").val();
//		location.href = "/admin/qnaAnswerPhone?phone="+phone;
	});

