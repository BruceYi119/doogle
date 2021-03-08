'use strict';

let latestFlag = true;

const setCookie = (name, value, exp) => {
	const date = new Date();
	date.setTime(date.getTime() + exp * 24 * 60 * 60 * 1000);
	document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
};

const getCookie = (name) => {
	const value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	return value? value[2] : null;
};

var deleteCookie = (name) => {
	document.cookie = name + '=; expires=Thu, 01 Jan 1999 00:00:10 GMT;';
}

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

	$('#member-menu > li:last-child').bind('mouseenter', () => {
		const obj = $('#member-menu > li > ul.sub');

		obj.removeClass('hide');
	});

	$('#member-menu > li:last-child').bind('mouseleave', () => {
		const obj = $('#member-menu > li > ul.sub');

		obj.addClass('hide');
	});

	$('#shop-search').bind('keyup', function() {
		const obj = $(this);
		const val = obj.val();
		const btnDel = $('#btn-shop-search-del');

		if (val === '')
			btnDel.addClass('hide');
		else
			btnDel.removeClass('hide');
	});

	$('#btn-shop-search-del').bind('click', function() {
		const obj = $(this);
		const searchObj = $('#shop-search');
		searchObj.val('');
		obj.addClass('hide');
	});

	$('#btn-latest-up').bind('click', () => {
		const obj = $('div.latest-wrap > ul');
		const top = parseInt(obj.css('top').replace('px',''));
		const moveCheck = top < 0 ? true : false;

		if (moveCheck && latestFlag) {
			latestFlag = false;

			obj.animate({ top: `${top + 80}px` }, 800, () => {
				latestFlag = true;				
			});
		}
	});

	$('#btn-latest-down').bind('click', () => {
		const obj = $('div.latest-wrap > ul');
		const top = parseInt(obj.css('top').replace('px',''));
		const moveCheck = -(obj.height() - 240) < top &&(obj.height() - 240) > 0 ? true : false;

		if (moveCheck && latestFlag) {
			latestFlag = false;

			obj.animate({ top: `${top - 80}px` }, 800, () => {
				latestFlag = true;				
			});			
		}
	});

};

initShop();