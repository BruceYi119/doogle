$(function(){
	$(".viewRow").click(function(){
		let nno = $(this).parents("tr").find(".nnum").val()
		location.href = "/admin/notice_view?no="+nno;
	});
	
	$(".update").click(function(){
		var no = $(this).parents("tr").find(".nnum").val();
		location.href = "/admin/notice_update?no="+no;
	});
	
	$(".delete").click(function(){
		var no = $(this).parents("tr").find(".nnum").val();
		var con = confirm("정말로 삭제하시겠습니까?");
		if(con)
		{
		location.href = "/admin/notice_delete?no="+no;
		}else
		{
			return false;
		}
	})
	
});

