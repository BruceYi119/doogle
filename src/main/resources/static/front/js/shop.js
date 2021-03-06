'use strict';

const initShop = () => {
	$('#main-menu > li:first-child').bind('mouseenter', () => {
		const productMenu = $('#product-menu');

		productMenu.removeClass('hide');
	});

	$('#main-menu > li:first-child').bind('mouseleave', () => {
		const productMenu = $('#product-menu');
		const productSubLi = $('#product-menu > li:last-child');

		productMenu.addClass('hide');
		productSubLi.addClass('hide');
	});

	$('#product-menu ul:first-child > li').bind('mouseenter', () => {
		const productSubLi = $('#product-menu > li:last-child');

		productSubLi.removeClass('hide');
	});

	new bootstrap.Carousel(document.querySelector('#product-slide1'), { interval: 2000, wrap: false });
	new bootstrap.Carousel(document.querySelector('#product-slide3'), { interval: 2000, wrap: false });

};

initShop();