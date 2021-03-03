'use strict';

const initShop = () => {
	$('#main-menu > li:first-child > a').bind('mouseover', () => {
		const productMenu = $('#product-menu');

		productMenu.removeClass('hide');
	});

	$('#main-menu > li:first-child > a').bind('mouseout', () => {
		const productMenu = $('#product-menu');

		productMenu.addClass('hide');
	});
};

initShop();