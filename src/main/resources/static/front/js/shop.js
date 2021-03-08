'use strict';

let latestFlag = true; 

const initShopMain = () => {
	$('#main-slide').carousel({ interval: 3000 });
	$('#product-slide1').carousel({ pause: true, wrap: false });
	$('#product-slide3').carousel({ pause: true, wrap: false });
	$('#product-slide4').carousel({ pause: true, wrap: false });
	$('#product-slide5').carousel({ pause: true, wrap: false });
	$('#product-slide6').carousel({ pause: true, wrap: false });
	$('#product-slide7').carousel({ pause: true, wrap: false });
	$('#product-slide8').carousel({ pause: true, wrap: false });
	$('#product-slide9').carousel({ pause: true, wrap: false });
	$('#product-slide10').carousel({ pause: true, wrap: false });

	$('#product-slide1, #product-slide3, #product-slide4, #product-slide5, #product-slide6, #product-slide7, #product-slide8, #product-slide9, #product-slide10').on('slide.bs.carousel', (e) => {
		const obj = $(e.relatedTarget);
		const pobj = obj.parent();
		const ppobj = pobj.parent();
		const index = obj.index(); 
		const itemSize = pobj.find('.carousel-item').length;
		const isPrev = index === 0 ? true : false;
		const isNext = index < (itemSize - 1) ? false : true;

		if (isPrev)
			ppobj.find('.carousel-control-prev').addClass('hide');
		else
			ppobj.find('.carousel-control-prev').removeClass('hide');

		if (isNext)
			ppobj.find('.carousel-control-next').addClass('hide');
		else
			ppobj.find('.carousel-control-next').removeClass('hide');
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

initShopMain();