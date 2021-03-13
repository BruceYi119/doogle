$(function(){

const activeMenu = () => {
const index = parseInt($('#hd').val());
const menus = $('#container > #con_nav');
menus.find('a:nth-child('+index+')').find('div').addClass('div_select');

};

	activeMenu();

});