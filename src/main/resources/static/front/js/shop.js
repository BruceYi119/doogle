'use strict';

let carousel1;
let carousel2;
let carousel3;

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

	$('#main-slide').carousel({ interval: 3000 });
	$('#product-slide1').carousel({ pause: true, wrap: false });
	$('#product-slide3').carousel({ pause: true, wrap: false });

	$('#product-slide1, #product-slide3').on('slide.bs.carousel', (e) => {
		const obj = $(e.relatedTarget);
		const pobj = obj.parent();
		const ppobj = pobj.parent();
		const index = obj.index(); 
		const itemSize = pobj.find('.carousel-item').length;

		if (index === 0) {
			ppobj.find('.carousel-control-prev').addClass('hide');
		} else {
			ppobj.find('.carousel-control-prev').removeClass('hide');

			if (itemSize - 1 == index)
				ppobj.find('.carousel-control-next').addClass('hide');
			else
				ppobj.find('.carousel-control-next').removeClass('hide');
		}

	});

	$('#main-slide .carousel-item img, #main-slide > a.carousel-control-prev, #main-slide > a.carousel-control-next, #main-slide > ul.carousel-indicators').bind('mouseenter', () => {
		const prevBtn = $('#main-slide > a.carousel-control-prev');
		const nextVtn = $('#main-slide > a.carousel-control-next');
		const listByn = $('#main-slide > ul.carousel-indicators');

		prevBtn.addClass('btn-show-ani');
		nextVtn.addClass('btn-show-ani');
		listByn.addClass('btn-show-ani');
	});

	$('#main-slide .carousel-item img').bind('mouseleave', () => {
		const prevBtn = $('#main-slide > a.carousel-control-prev');
		const nextVtn = $('#main-slide > a.carousel-control-next');
		const listByn = $('#main-slide > ul.carousel-indicators');

		prevBtn.removeClass('btn-show-ani');
		nextVtn.removeClass('btn-show-ani');
		listByn.removeClass('btn-show-ani');
	});

};

initShop();