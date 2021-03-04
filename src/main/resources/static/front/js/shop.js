'use strict';

const initShop = () => {
	$('#main-menu > li:first-child').bind('mouseover', () => {
		const productMenu = $('#product-menu');

		productMenu.removeClass('hide');
	});

	$('#main-menu > li:first-child').bind('mouseout', () => {
		const productMenu = $('#product-menu');

		productMenu.addClass('hide');
	});
};

initShop();