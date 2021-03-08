function getWhite(n){
	n.className='white'
}
function getPurple(){
	document.getElementsByClassName('white')[0].className='mun'
}
function getContent(n){
	var trAll = document.getElementsByClassName('tr-sub');
	var tr = document.getElementsByClassName('tr-sub')[n];
	if(tr.style.display=="none"){
		for(var i=0;i<trAll.length;i++){
			if(i!=n){
				trAll[i].style.display="none"
			}
		}
		tr.style.display="table-row";
	}else{
		tr.style.display="none"
	}
}
function del(no){
	if(confirm('삭제하시겠습니까?')){
			location.href='/shop/ecoDelete?epno='+no
	}
}
/*function popup_register( mode, sno )
    {
        if ( mode == 'del_offer' )  var win = window.open("../mypage/offer_del.php?mode=" + mode + "&sno=" + sno,"offer_register","width=400,height=200");
        else parent.location.href = ("../mypage/offer_register.php?mode=" + mode + "&sno=" + sno);

    }

    var preContent;

    function view_content(obj)
    {
        var div = obj.parentNode;

        for (var i=1, m=div.childNodes.length;i<m;i++) {
            if (div.childNodes[i].nodeType != 1) continue;	// text node.
            else if (obj == div.childNodes[ i ]) continue;

            obj = div.childNodes[ i ];
            break;
        }

        if (preContent && obj!=preContent){
            obj.style.display = "block";
            preContent.style.display = "none";
        }
        else if (preContent && obj==preContent) preContent.style.display = ( preContent.style.display == "none" ? "block" : "none" );
        else if (preContent == null ) obj.style.display = "block";

        preContent = obj;
    }*/