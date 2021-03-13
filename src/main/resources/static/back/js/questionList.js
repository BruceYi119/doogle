$(function(){
	$(".qna").click(function(){
		$(this).next().slideToggle().siblings('.qna_answer').slideUp();
	});
	$("button[name=up]").click(function(){
		var qno = $(this).parent().parent().find(".td1").text();
		location.href="/admin/questionUpdate?qno="+qno;
	})
	
	$("button[name=del]").click(function(){
		var qno = $(this).parent().parent().find(".td1").text();
		var con = confirm("정말로 삭제하시겠습니까?");
		if(con){
		location.href="/admin/questionDelete?qno="+qno;
		}else{
			return false;
		}
	});
	
});

	