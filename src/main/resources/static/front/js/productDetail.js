'use strict';

const initProductDetail = () => {
	$('button.btn-down').bind('click', () => {		
		const priceObj = $('input[name=price]');
		const earnObj = $('input[name=earn]');
		const cntObj = $('input[name=cnt]');
		const totalPriceObj = $('input[name=total-price]');
		const dspCntObj = $('input[name=dsp-cnt]');
		const price = $('input[name=price]');
		const earn = $('input[name=earn]');
		const cnt = $('input[name=cnt]');
		const totalPrice = $('input[name=total-price]');
		const dspCnt = $('input[name=dsp-cnt]');

		if (parseInt(cnt.val()) === 0)
			return false;
	
		cnt.val(parseInt(cnt.val()) - 1);
	});

	$('button.btn-up').bind('click', () => {
		
	});
};

initProductDetail();