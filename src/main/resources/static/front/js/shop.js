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

	$('#product-menu ul > li').bind('mouseover', () => {
		const productSubLi = $('#product-menu > li:last-child');

		productSubLi.removeClass('hide');
	});

};

initShop();