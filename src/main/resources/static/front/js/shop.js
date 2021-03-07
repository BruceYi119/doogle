'use strict';

let latestFlag = true; 

const initShopMain = () => {
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

	$('#btn-latest-up').bind('click', () => {
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

	$('#btn-latest-down').bind('click', () => {
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
};

initShopMain();