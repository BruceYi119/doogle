'use strict';

const editOption = {
	lang: 'ko-KR', // default: 'en-US'
	placeholder: 'Hello Doogle Shopping!',
	tabsize: 2,
	height: 100,
	minHeight: null,
	maxHeight: null,
	focus: true                  // set focus to editable area after initializing summe
};

const initEdit = (option = editOption) => {
	$('#summernote').summernote(option);
};

//initEdit();