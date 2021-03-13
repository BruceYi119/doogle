$(function(){
	/*여기부터*/
	var payments=parseInt(0);
	var savings=parseInt(0);
	var totals=parseInt(0);
	$('input[name=vpayment]').each(function(index){
   		//하고 싶은 내용
		var payment=parseInt($('input[name=vpayment]:eq(' + index + ')').val());
		var saving=parseInt($('input[name=vsaving]:eq(' + index + ')').val());
		var paymentdate=parseInt($('input[name=vpaymentdate]:eq(' + index + ')').val());
		var to_day=parseInt($('input[name=vto_day]:eq(' + index + ')').val());
		
		if(paymentdate==to_day){
			payments=payments+payment;
		 	savings=savings+saving;
		 	totals=payments+savings
   		console.log(payments);
   		console.log(savings);
   		}
	});
	$('.mpayment').text(new Intl.NumberFormat({ maximumSignificantDigits: 3 }).format(payments));
	$('.msaving').text(new Intl.NumberFormat({ maximumSignificantDigits: 3 }).format(savings));
	
	if(totals<150000){
		$('.my_grades').children().css('display','none');
		$('.grade1').css('display','block');
		$('#datum1').text(new Intl.NumberFormat({ maximumSignificantDigits: 3 }).format($('#datum1').text()-totals));
		$('.list').removeClass("next_grade");
		$('#list_grade1').addClass("next_grade");
	}else if(totals<300000){
		$('.my_grades').children().css('display','none');
		$('.grade2').css('display','block');
		$('#datum2').text(new Intl.NumberFormat({ maximumSignificantDigits: 3 }).format($('#datum2').text()-totals));
		$('.list').removeClass("next_grade");
		$('#list_grade2').addClass("next_grade");
	}else if(totals<500000){
		$('.my_grades').children().css('display','none');
		$('.grade3').css('display','block');
		$('#datum3').text(new Intl.NumberFormat({ maximumSignificantDigits: 3 }).format($('#datum3').text()-totals));
		$('.list').removeClass("next_grade");
		$('#list_grade3').addClass("next_grade");
	}else if(totals<1000000){
		$('.my_grades').children().css('display','none');
		$('.grade4').css('display','block');
		$('#datum4').text(new Intl.NumberFormat({ maximumSignificantDigits: 3 }).format($('#datum4').text()-totals));
		$('.list').removeClass("next_grade");
		$('#list_grade4').addClass("next_grade");
	}else if(totals<1500000){
		$('.my_grades').children().css('display','none');
		$('.grade5').css('display','block');
		$('#datum5').text(new Intl.NumberFormat({ maximumSignificantDigits: 3 }).format($('#datum5').text()-totals));
		$('.list').removeClass("next_grade");
		$('#list_grade5').addClass("next_grade");	
	}else{
		$('.my_grades').children().css('display','none');
		$('.grade6').css('display','block');
		$('.list').removeClass("next_grade");
		$('#list_grade6').addClass("next_grade");		
	}
	
	/*여기까지 */
	
});