'use strict';

const calc = (t = '+') => {	
		const priceObj = $('input[name=price]');
		const earnObj = $('input[name=earn]');
		const cntObj = $('input[name=cnt]');
		const totalPriceObj = $('input[name=total-price]');
		const dspCntObj = $('input[name=dsp-cnt]');
		let price = parseInt(priceObj.val());
		let earn = parseInt(earnObj.val());
		let cnt = parseInt(cntObj.val());
		let totalPrice = parseInt(totalPriceObj.val());
		let dspCnt = parseInt(dspCntObj.val());

		cnt = t === '+' ? cnt + 1 : cnt - 1;
		dspCnt = cnt;
		totalPrice = earn > 0 ? Math.floor(price - (price * (earn * 0.01))) * cnt : price * cnt;

		cntObj.val(cnt);
		dspCntObj.val(dspCnt);
};

const initProductDetail = () => {
	$('button.btn-down').bind('click', () => {		
		const cntObj = $('input[name=cnt]');
		const cnt = parseInt(cntObj.val());

		if (cnt === 0)
			return false;

		calc('-');
	});

	$('button.btn-up').bind('click', () => {
		calc();
	});
};

initProductDetail();