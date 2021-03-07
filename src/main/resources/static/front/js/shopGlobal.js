'use strict';

const initShop = () => {
	$('#btn-main-banner-close').bind('click', () => {
		const obj = $('#main-banner');

		obj.slideUp();
	});

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

	$(window).scroll(() => {
		const obj = $(window);
		const targetObj = $('#btn-page-top'); 
		const scrollHeight = window.innerHeight;
		const scrollTop = obj.scrollTop();
		const showCheck = scrollHeight / 2 < scrollTop ? true : false;

		if (showCheck)
			targetObj.slideDown(500);
		else
			targetObj.slideUp(500);
	});
};

initShop();