'use strict';

const addLatest = () => {
	const pnos = getCookie('doogle-latest');
	const pno = $('input[name=pno]').val();
	const pnosArr = pnos === null ? null : pnos.split(',');

	if (pnosArr === null) {
		setCookie('doogle-latest', pno, 1);
	} else if (pnosArr.indexOf(pno) === -1) {
		pnosArr.push(pno);
		setCookie('doogle-latest', pnosArr.join(','), 1);
	}
};

addLatest();