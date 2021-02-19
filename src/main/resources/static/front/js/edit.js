'use strict';

const editOption = {
	lang: 'ko-KR',									// default: 'en-US'
	placeholder: 'Hello Doogle Shopping!',
	tabsize: 2,
	height: 300,
	minHeight: 100,
	maxHeight: 500,
	focus: true,									// set focus to editable area after initializing summe
	fontNames: ['돋움', '궁서', '맑은 고딕', '함초롬바탕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Merriweather']
	//fontNamesIgnoreCheck: ['Merriweather']
};

const initEdit = (option = editOption) => {
	$('#summernote').summernote(option);
};

//initEdit();