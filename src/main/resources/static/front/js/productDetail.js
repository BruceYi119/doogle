'use strict';

const calc = (t = '+') => {	
		const priceObj = $('input[name=price]');
		const earnObj = $('input[name=earn]');
		const cntObj = $('input[name=cnt]');
		const discountObj = $('input[name=discount]');
		const totalDspPriceObj = $('span.total-price');
		const totalPriceObj = $('input[name=total-price]');
		const dspCntObj = $('input[name=dsp-cnt]');
		let discount = parseInt(discountObj.val());
		let price = parseInt(priceObj.val());
		let earn = parseInt(earnObj.val());
		let cnt = parseInt(cntObj.val());
		let totalPrice = parseInt(totalPriceObj.val());
		let dspCnt = parseInt(dspCntObj.val());

		cnt = t === '+' ? cnt + 1 : cnt - 1;
		dspCnt = cnt;
		totalPrice = discount > 0 ? Math.floor(price - (price * (discount * 0.01))) * cnt : price * cnt;

		cntObj.val(cnt);
		dspCntObj.val(dspCnt);
		totalPriceObj.val(totalDspPriceObj);
		totalDspPriceObj.text(new Intl.NumberFormat().format(totalPrice));
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
	
	$('button.btn-alram').bind('click', () => {
		const quantity = $('#quantity').val();
		const pno = $('#detail-pno').val();

		if (quantity > 0)
			return false;
			
		$.post('/shop/ajax/ok', { pno: pno }, (res) => {
			if (res === 'true')
				alert('재입고 알림이 등록 되었습니다');
			else
				alert('재입고 알림 등록에 실패하였습니다.');
		});
	});

	$('button.btn-living').bind('click', () => {
		const pno = $('#detail-pno').val();
		
		$.post('/shop/putOnLiving', { pno: pno }, (res) => {
			if (res === 'true')
				alert('늘 사는것에 추가 되었습니다');
			else
				alert('늘 사는것 등록에 실패하였습니다.');
		});
	});

	$('button.btn-basket').bind('click', () => {
		const pno = $('#detail-pno').val();
		
		$.post('/shop/addBasket', { pno: pno }, (res) => {
			if (res === 'true')
				showBasket('장바구니에 추가 되었습니다');
			else
				alert('장바구니 추가에 실패하였습니다.');
		});
	});

};

initProductDetail();