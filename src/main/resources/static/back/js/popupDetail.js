$(function(){
	var vpuno=$('input[name=puno]').val();
	var vtitle=$('input[name=title]').val();
	var vleft=$('input[name=left]').val();
	var vright=$('input[name=top]').val();
	var vwidth=$('input[name=width]').val();
	var vheight=$('input[name=height]').val();

	//alert(title+puno+left+right)
	window.open("/admin/popup/on?puno="+vpuno, vtitle,"width="+vwidth+", height="+vheight+",resizable=no,left="+vleft+",top="+vright+",scrollbars=no,location=no");
})