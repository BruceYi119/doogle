$(function(){
	$(".qna").click(function(){
		$(this).next().slideToggle().siblings('.answer').slideUp();
		var qnno = $(this).find(".td1").text();
		$.ajax({
				url:"/shop/qnaContent?qnno="+qnno,
				type : "get",
				qnno : qnno,
				success:function(data){
					$(".answer").each(function(){
						if(data != null)
							$(this).find(".ajax").eq(0).html(data);
						if(typeof(data) == "string" && data=="null")
							$(this).find(".ajax").eq(0).html("문의 사항 확인중 입니다. 확인되는대로 친절한 안내 도와드리겠습니다.");
					});
				},
				})
	});
				
		$(".qna").each(function(){
			
			var qnno =  $(this).find(".td1").text();
			if(qnno==""){
				qnno = parseInt(0);
			}
			$.ajax({
				url:"/shop/qnaCount?qnno="+qnno,
				type:"get",
				qnno:qnno,
				success:function(data){
//					if(data === "0")
//						$(".qna").find(".titleFonts").html("0");
//					$(".qna").each(function(){
//						console.log(count);
//						
//					});
				}
			})
		})
	
	
	$(".update").on("click",function(){
		var obj = $(this).parents("tr").find("input").val()
		location.href="qnaUpdate?qnno="+obj;
	})
	
	$(".delete").on("click",function(){
		var obj = $(this).parents("tr").find("input").val()
		location.href="qnaDelete?qnno="+obj;
	})
	
});