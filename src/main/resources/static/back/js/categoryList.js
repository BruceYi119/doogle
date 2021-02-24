'use strict';

const initCategoryList = () => {
	$('select[name=type]').bind('change', function() {
		const type = $(this).val();
		location.href = `/admin/category?type=${type}`;
	});
};

initCategoryList();