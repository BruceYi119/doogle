$(function(){
	$(".email").click(function(){
		var mno = $(this).parents("tr").find(".mno").text();
		var pno = $(this).parents("tr").find(".pno").text();
	location.href="/admin/alarmMailSend?mno="+mno+"&pno="+pno;
	});
	
//	$(".phone").click(function(){
//		var mno = $(this).parents("tr").find(".mno").text();
//		var pno = $(this).parents("tr").find(".pno").text();
//	location.href="/admin/alarmPhoneSend?mno="+mno+"&pno="+pno;
//	});

	$(".phone").click(function(){
		
		var product = $(this).parents("tr").find(".product").text();
		var mno = $(this).parents("tr").find(".mno").text();
		$.ajax({
			url : "/admin/alarmPhoneSendOk",
			type : "get",
			data : {from:"01091401058",
					text :"재입고 알람을 요청하신 "+product+" 이/가 재입고 되었습니다. ※ 빠른 확인 바랍니다.",
					mno : mno,
				},
			dataType:"text",
			success:function(){
				alert("재입고문자 알림 전송 완료");
			}
			
		})
	});
	
	$("#send").click(function(){
		location.href = "/admin/alarmPhoneSend";
	})
})












