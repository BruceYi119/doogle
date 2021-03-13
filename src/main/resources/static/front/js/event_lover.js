$(function(){
	$('#a_grade1').click(function(){
		$('.a_grade').closest("div").css('backgroundColor', 'white');
		$('.grade_list').css('border-bottom', '3px solid #5f0080');
		$('#grade_item1').css('color', '#5f0080');
		$('#grade_item2').css('color', '#875eb3');		
		$('#grade_item3').css('color', '#a775d6');		
		$('#grade_item4').css('color', '#ba99e1');		
		$('#grade_item5').css('color', '#d2beff');		
		$('#grade_item6').css('color', '#b1a9c6');		
		$(this).closest("div").css('backgroundColor', '#5f0080');
		$(this).closest("div").css('color', '#fff');
		$('.item_on').children().css('display','none');
		$('#item_img1').css('display','block');
	})
	$('#a_grade2').click(function(){
		$('.a_grade').closest("div").css('backgroundColor', 'white');
		$('.grade_list').css('border-bottom', '3px solid #875eb3');
		$('#grade_item1').css('color', '#5f0080');
		$('#grade_item2').css('color', '#875eb3');		
		$('#grade_item3').css('color', '#a775d6');		
		$('#grade_item4').css('color', '#ba99e1');		
		$('#grade_item5').css('color', '#d2beff');		
		$('#grade_item6').css('color', '#b1a9c6');		
		$(this).closest("div").css('backgroundColor', '#875eb3');
		$(this).closest("div").css('color', '#fff');
		$('.item_on').children().css('display','none');
		$('#item_img2').css('display','block');
	})
	$('#a_grade3').click(function(){
		$('.a_grade').closest("div").css('backgroundColor', 'white');
		$('.grade_list').css('border-bottom', '3px solid #a775d6');
		$('#grade_item1').css('color', '#5f0080');
		$('#grade_item2').css('color', '#875eb3');		
		$('#grade_item3').css('color', '#a775d6');		
		$('#grade_item4').css('color', '#ba99e1');		
		$('#grade_item5').css('color', '#d2beff');		
		$('#grade_item6').css('color', '#b1a9c6');		
		$(this).closest("div").css('backgroundColor', '#a775d6');
		$(this).closest("div").css('color', '#fff');
		$('.item_on').children().css('display','none');
		$('#item_img3').css('display','block');
	})
	$('#a_grade4').click(function(){
		$('.a_grade').closest("div").css('backgroundColor', 'white');
		$('.grade_list').css('border-bottom', '3px solid #ba99e1');
		$('#grade_item1').css('color', '#5f0080');	
		$('#grade_item2').css('color', '#875eb3');		
		$('#grade_item3').css('color', '#a775d6');		
		$('#grade_item4').css('color', '#ba99e1');		
		$('#grade_item5').css('color', '#d2beff');		
		$('#grade_item6').css('color', '#b1a9c6');		
		$(this).closest("div").css('backgroundColor', '#ba99e1');
		$(this).closest("div").css('color', '#fff');
		$('.item_on').children().css('display','none');
		$('#item_img4').css('display','block');
	})
	$('#a_grade5').click(function(){
		$('.a_grade').closest("div").css('backgroundColor', 'white');
		$('.grade_list').css('border-bottom', '3px solid #d2beff');
		$('#grade_item1').css('color', '#5f0080');		
		$('#grade_item2').css('color', '#875eb3');		
		$('#grade_item3').css('color', '#a775d6');		
		$('#grade_item4').css('color', '#ba99e1');		
		$('#grade_item5').css('color', '#d2beff');		
		$('#grade_item6').css('color', '#b1a9c6');		
		$(this).closest("div").css('backgroundColor', '#d2beff');
		$(this).closest("div").css('color', '#fff');
		$('.item_on').children().css('display','none');
		$('#item_img5').css('display','block');
	})
	$('#a_grade6').click(function(){
		$('.a_grade').closest("div").css('backgroundColor', 'white');
		$('.grade_list').css('border-bottom', '3px solid #b1a9c6');
		$('#grade_item1').css('color', '#5f0080');	
		$('#grade_item2').css('color', '#875eb3');		
		$('#grade_item3').css('color', '#a775d6');		
		$('#grade_item4').css('color', '#ba99e1');		
		$('#grade_item5').css('color', '#d2beff');		
		$('#grade_item6').css('color', '#b1a9c6');		
		$(this).closest("div").css('backgroundColor', '#b1a9c6');
		$(this).closest("div").css('color', '#fff');
		$('.item_on').children().css('display','none');
		$('#item_img6').css('display','block');
	})
	function change()
	{
		var chk=document.documentElement.scrollTop;
		document.getElementById("con_nav2").style.position="fixed";
		if(chk>=220)
		{
			document.getElementById("con_nav2").style.top="140px";		
		}
		else
		{
			document.getElementById("con_nav2").style.top="300px";
		}
	}
window.onscroll=change;
})
