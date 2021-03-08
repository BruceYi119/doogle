function add(){
        var table = document.getElementById('table');
        var reviewFileNum = "5";
        if (table.rows.length>=parseInt(reviewFileNum)){
            alert("업로드는 최대 "+reviewFileNum+"개만 지원합니다");
            return;
        }
        var tr_num = table.rows.length;
        oTr		= table.insertRow( table.rows.length );
        oTr.id	= "tr_"+(tr_num);
        oTd1		= oTr.insertCell(0);
        oTd1.style.textAlign = "center";
        oTd2		= oTr.insertCell(1);
        tmpHTML = "<input type='file' name='files' /> <a href=\"javascript:del('"+"tr_"+(tr_num)+"')\"><img src='/static/front/img/shop/minus_btn.png'></a>";
        oTd2.innerHTML = tmpHTML;
        calcul();
    }
function del(index,ncode){
    var table = document.getElementById('table');
    for (i=0;i<table.rows.length;i++) if (index==table.rows[i].id) table.deleteRow(i);
    calcul();
}
function calcul(){
    var table = document.getElementById('table');
    for (i=0;i<table.rows.length;i++){
        table.rows[i].cells[0].innerHTML = i+1;
    }
}
function propositionCheck(){
	var ctno=document.getElementsByName('ctno')[0]
	var title=document.getElementsByName('title')[0]
	var content=document.getElementsByName('content')[0]
	
	if(ctno.value==0){
		alert('카테고리를 선택하세요');
		ctno.focus();
		return false;
	}else if(title.value==null || title.value==""){
		alert('제목을 입력하세요');
		title.value=""
		title.focus();
		return false;
	}else if(content.value==null || content.value==""){
		alert('내용을 입력하세요');
		content.focus();
		return false;
	}else{
		alert('입력되었습니다.')
		return true;
	}
}
function ecoCheck(){
	var ctno=document.getElementsByName('ctno')[0]
	var title=document.getElementsByName('title')[0]
	var pname=document.getElementsByName('name')[0]
	var content=document.getElementsByName('content')[0]
	
	if(ctno.value==0){
		alert('카테고리를 선택하세요');
		ctno.focus();
		return false;
	}else if(title.value==null || title.value==""){
		alert('제목을 입력하세요');
		title.value=""
		title.focus();
		return false;
	}else if(pname.value==null || pname.value==""){
		alert('상품명을 입력하세요');
		pname.value=""
		pname.focus();
		return false;
	}else if(content.value==null || content.value==""){
		alert('내용을 입력하세요');
		content.focus();
		return false;
	}else{
		alert('입력되었습니다.')
		return true;
	}
}