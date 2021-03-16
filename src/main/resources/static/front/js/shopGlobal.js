'use strict';

let latestFlag = true;
let qnbFlag = true;
let basketFlag = true;

const addLatest = () => {
	const obj = $('#detail-pno').length === 1 ? $('#detail-pno') : null;

	if (obj === null)
		return false;

	const pnos = getCookie('doogle-latest');
	const pno = obj.val();
	const pnosArr = pnos === null ? null : pnos.split(',');

	if (pnosArr === null) {
		setCookie('doogle-latest', pno, 1);
	} else if (pnosArr.indexOf(pno) === -1) {
		pnosArr.push(pno);
		setCookie('doogle-latest', pnosArr.join(','), 1);
	}
};

const setCookie = (name, value, exp) => {
	const date = new Date();
	date.setTime(date.getTime() + exp * 24 * 60 * 60 * 1000);
	document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
};

const getCookie = (name) => {
	const value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	return value ? value[2] : null;
};

const delCookie = (name) => {
	document.cookie = name + '=; expires=Thu, 01 Jan 1999 00:00:10 GMT;';
}

const showBasket = (msg = '') => {
	if (basketFlag) {
		basketFlag = false;
		$('#btn-basket').attr('data-original-title', msg).tooltip({ update: true, trigger: 'click', delay: { hide: 2000 } }).trigger('click');
	} else {
		$('#btn-basket').attr('data-original-title', msg).tooltip('toggleEnabled').tooltip({ update: true, trigger: 'click', delay: { hide: 2000 } }).trigger('click');
	}
};

const initLatest = () => {
	const obj = $('#latest-list');
	const wrapObj = $('#latest');
	const pnos = getCookie('doogle-latest');

	if (pnos !== null) {
		const pno = pnos.split(',');
		let html = ``;
		pno.forEach((seq) => {
			html += `<li><a href="/shop/product/detail/${seq}"><img src="/static/upload/img/shop/product/${seq}.jpg" /></a></li>`;
		});

		obj.html(html);
		wrapObj.removeClass('hide');
		const lis = $('div.latest-wrap > ul > li');

		if (lis.length > 0) {
			wrapObj.removeClass('hide');

			if (lis.length === 2)
				$('div.latest-wrap').css('height', '160px');
			else if (lis.length > 2)
				$('div.latest-wrap').css('height', '240px');

			if ($('div.latest-wrap > ul').height() > 240)
				$('#btn-latest-down').addClass('on');
		}
	}
}

const initPopup = () => {
	if ($('input[name=popup_no]').length > 0) {
		$('input[name=popup_no]').each(function(index) {
			var vpuno = $('input[name=popup_no]:eq(' + index + ')').val();
			var vtitle = $('input[name=popup_title]:eq(' + index + ')').val();
			var vleft = $('input[name=popup_left]:eq(' + index + ')').val();
			var vright = $('input[name=popup_top]:eq(' + index + ')').val();
			var vwidth = $('input[name=popup_width]:eq(' + index + ')').val();
			var vheight = $('input[name=popup_height]:eq(' + index + ')').val();
			console.log(vpuno);
			console.log(vtitle);
			window.open("/admin/popup/on?puno=" + vpuno, vtitle, "width=" + vwidth + ", height=" + vheight + ",left=" + vleft + ",top=" + vright + ",resizable=no ,scrollbars=no");
		});
	}
};

const initShop = () => {

	if ($('#qnb-top').length === 1) {
		$('#qnb').css('top', parseInt($('#qnb-top').val()) + 'px');
	}

	$('#btn-main-banner-close').bind('click', () => {
		const obj = $('#main-banner');
		const qnb = $('#qnb');
		const top = parseInt(qnb.css('top').replace('px', '')) - 42;

		obj.slideUp();

		if (qnbFlag) {
			qnbFlag = false;
			qnb.animate({ top: `${top}px` }, 100, () => { qnbFlag = true; });
		}
	});

	$('#main-menu > li:first-child').bind('mouseenter', () => {
		const productMenu = $('#product-menu');

		productMenu.removeClass('hide');
	});

	$('#main-menu > li:first-child').bind('mouseleave', () => {
		const productMenu = $('#product-menu');
		const productSubLi = $('#product-menu > li:last-child');

		productMenu.addClass('hide');
		productSubLi.addClass('hide').removeClass('product-sub-ani');
	});

	$('#product-menu ul:first-child > li').bind('mouseenter', () => {
		const productSubLi = $('#product-menu > li:last-child');

		productSubLi.removeClass('hide').addClass('product-sub-ani');
	});

	$('#product-main-wrap > li > a').bind('mouseenter', function() {
		const ctno = $(this).attr('ctno');
		const targetObj = $('#product-sub-wrap');
		const loddingHtml = `<div id="sub-loading"><div class="spinner-border text-muted"></div></div>`;
		const ajax = axios.get(`/shop/product/category/${ctno}`);

		targetObj.empty().html(loddingHtml);

		ajax.then((res) => {
			if (res.data) {
				const list = JSON.parse(decodeURIComponent(res.data))?.list;

				if (list !== undefined) {
					let html = `<ul id="product-sub-menu">`;

					list.forEach((o) => {
						html += `<li><a href="/shop/product/${ctno}?cctno=${o.ctno}">${o.name}</a></li>`;
					});
					html += `</ul>`;

					targetObj.empty().html(html);
				}
			}
		}).catch(err => console.log(err));
	});

	$(window).scroll(() => {
		const obj = $(window);
		const qnbObj = $('#qnb');
		const targetObj = $('#btn-page-top');
		const qnbTopObj = $('#qnb-top');
		const scrollTop = obj.scrollTop();
		const showCheck = scrollTop > 1300 ? true : false;
		let top = qnbTopObj.length === 1 ? parseInt(qnbTopObj.val()) : 268;

		if (showCheck)
			targetObj.slideDown(500);
		else
			targetObj.slideUp(500);

		if (scrollTop > 300) {
			const qnbHeight = qnbObj.height();
			top = (window.screen.availHeight - qnbHeight) / 2;

		}

		if (qnbFlag) {
			qnbFlag = false;

			qnbObj.animate({ top: `${top}px` }, 100, () => {
				qnbFlag = true;

				if ($(window).scrollTop < 100)
					qnbObj.css('top', `${top}px`);
			});
		}
	});

	$('#member-menu > li.main').bind('mouseenter', function() {
		const obj = $(this).find('ul.sub');

		obj.removeClass('hide');
	});

	$('#member-menu > li.main').bind('mouseleave', function() {
		const obj = $(this).find('ul.sub');

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
		const top = parseInt(obj.css('top').replace('px', ''));
		const upBtn = $('#btn-latest-up');
		const downBtn = $('#btn-latest-down');
		const moveCheck = top < 0 ? true : false;

		if (moveCheck && latestFlag) {
			latestFlag = false;

			obj.animate({ top: `${top + 80}px` }, 800, () => {
				latestFlag = true;

				if (obj.css('top') === '0px')
					upBtn.removeClass('on');
				else
					upBtn.addClass('on');

				if (Math.abs(obj.height() - 240) <= Math.abs(parseInt(obj.css('top').replace('px', ''))))
					downBtn.removeClass('on');
				else
					downBtn.addClass('on');
			});
		}
	});

	$('#btn-latest-down').bind('click', () => {
		const obj = $('div.latest-wrap > ul');
		const top = parseInt(obj.css('top').replace('px', ''));
		const upBtn = $('#btn-latest-up');
		const downBtn = $('#btn-latest-down');
		const moveCheck = -(obj.height() - 240) < top && (obj.height() - 240) > 0 ? true : false;

		if (moveCheck && latestFlag) {
			latestFlag = false;

			obj.animate({ top: `${top - 80}px` }, 800, () => {
				latestFlag = true;

				if (obj.css('top') === '0px')
					upBtn.removeClass('on');
				else
					upBtn.addClass('on');

				if (Math.abs(obj.height() - 240) <= Math.abs(parseInt(obj.css('top').replace('px', ''))))
					downBtn.removeClass('on');
				else
					downBtn.addClass('on');
			});
		}
	});

	$('a.btn-product-category').bind('click', function(e) {
		e.preventDefault();

		const obj = $(this);
		const ctno = obj.attr('ctno');
		const name = obj.attr('name');
		const ajax = axios.get(`/shop/product/md/${ctno}`);
		const a = $('p.btn-product-category-wrap > a.link');
		const span = $('p.btn-product-category-wrap > a.link > span');

		ajax.then((res) => {
			if (res.data) {
				const list = JSON.parse(decodeURIComponent(res.data))?.list;
				const ul1 = $('#md1');
				const ul2 = $('#md2');

				$('a.btn-product-category').removeClass('on');
				obj.addClass('on');

				if (list !== undefined) {
					let html1 = `<ul class="product-slide-list">`;
					let html2 = `<ul class="product-slide-list">`;

					list.forEach((o, i) => {
						let temp = `<li>
<a href="/shop/product/detail/${o.pno}">
<img style="background-image: url('${o.jloc}${o.jname}');" class="product-slide-img">
</a>
</li>`;
						if (i < 4)
							html1 += temp;
						else
							html2 += temp;
					});
					html1 += `</ul>`;
					html2 += `</ul>`;

					a.attr('href', `/shop/product/${ctno}`);
					span.text(`${name} 전체보기`);

					ul1.html(html1);
					ul2.html(html2);
				}
			}
		}).catch(err => console.log(err));
	});

	$('#btn-basket').on('shown.bs.tooltip', function () {
								$('#btn-basket').trigger('click').tooltip('disable');
	});

	addLatest();
	initLatest();
	initPopup();
};

initShop();