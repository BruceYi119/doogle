'use strict';

const initCategory = () => {
	$('select[name=ctno]').bind('change', function() {
		const ctno = $(this).val();
		const params = { params: { pctno: ctno, lv: 1 } };
		const ajax = axios.get('/admin/product/ajax/category', params);

		ajax.then((res) => {
			console.log(res.data);
			if (res.data.list) {
				let html = ``;
			}
		}).catch(err => console.log(err));
	});

	$('select[name=ctno] option:eq(0)').prop('selected', 'selected').trigger('change');
};

initCategory();