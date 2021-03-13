$(function(){
	$(".radio").on("click",function(){
		var obj = $(this);
		var i = obj.eq(0).parent().parent().find('td:eq(0)').text();
		opener.document.getElementById("onono").value = i;
		window.close();
	});
})











