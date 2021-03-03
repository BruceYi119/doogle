'use strict';

const initCategory = () => {
	$('select[name=ctno]').bind('change', function() {
		const ctno = $(this).val();
		const params = { params: { pctno: ctno, lv: 1 } };
		const ajax = axios.get('/admin/product/ajax/category', params);

		$('select[name=ctno1]').remove();
		$('select[name=ctno2]').remove();

		ajax.then((res) => {
			if (res.data) {
				const list = JSON.parse(decodeURIComponent(res.data))?.list;
				if (list !== undefined) {
					let html = `<select name="ctno1">`;
					list.forEach((o) => {
						html += `<option value="${o.ctno}">${o.name}</option>`;
					});
					html += `</select>`;

					$(html).insertAfter($('select[name=ctno]'));
				}
			}
		}).catch(err => console.log(err));
	});

	$('table').on('change', 'select[name=ctno1]', function() {
		const ctno = $(this).val();
		const params = { params: { pctno: ctno, lv: 2 } };
		const ajax = axios.get('/admin/product/ajax/category', params);

		$('select[name=ctno2]').remove();

		ajax.then((res) => {
			if (res.data) {
				const list = JSON.parse(decodeURIComponent(res.data))?.list;
				if (list !== undefined && typeof(list) === 'object') {
					let html = `<select name="ctno2">`;
					list.forEach((o) => {
						html += `<option value="${o.ctno}">${o.name}</option>`;
					});
					html += `</select>`;

					$(html).insertAfter($('select[name=ctno1]'));
				}
			}
		}).catch(err => console.log(err));
	});

	$('select[name=ctno] option:eq(0)').prop('selected', 'selected').trigger('change');
};

initCategory();