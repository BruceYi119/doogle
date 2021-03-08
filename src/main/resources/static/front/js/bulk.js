/**
 * Calendar Script
 * @usage	<input type=text onclick="calendar(event)">
 */

var now			= new Date();
var static_now	= new Date();
var week		= new Array("SUN","MON","TUE","WED","THU","FRI","SAT");
var weekNum		= new Array(1,2,3,4,5,6,7);

var tagNm		= "";
var thisObj		= "";
var eventElement= "";
var dy_calOpen	= "n";

//function calendar(e,gubun,addFormat)
function calendar(e,gubun, iClientX)
{
	if(!gubun){
		gubun = '';
	}
	var event = e || window.event;
	if( !appname ){
		var appname = navigator.appName.charAt(0);
	}

	if( appname == "M" ){
		eventElement = event.srcElement;
		tagNm = eventElement.tagName;
	}else{
		eventElement = event.target;
		tagNm = eventElement.tagName;
	}

	var dy_x;
	if(iClientX)	dy_x = iClientX;
	else	dy_x = event.clientX+(document.body.scrollLeft || document.documentElement.scrollLeft);
//	var dy_x = event.clientX+(document.body.scrollLeft || document.documentElement.scrollLeft);
	var dy_y = event.clientY+(document.body.scrollTop || document.documentElement.scrollTop);

	// target element's position;
	try {
		var pos = eventElement.positionedOffset();
		dy_x = pos.left;
		dy_y = pos.top + eventElement.getHeight();
	} catch (e) {}

	if( dy_calOpen == 'n' ){
		var NewElement = document.createElement("div");
		with (NewElement.style){
			position	= "absolute";
			left		= dy_x + 'px';
			top			= dy_y + 'px';
			width		= "205px";
			Height		= "170px";
			background	= "#ffffff";
			border		= "0px";
			zIndex		= "10000";
		}
		NewElement.id = "Dynamic_CalendarID";
		document.body.appendChild(NewElement);
		thisObj = NewElement;
		dy_calOpen = 'y';
	}else{
		thisObj.style.left	= dy_x + 'px';
		thisObj.style.top	= dy_y + 'px';
	}

	//달력 출력하기!!
	//var calCont = calendarSet('',gubun,addFormat||'');
	var calCont = calendarSet('',gubun);
}

//function calendarSet(val,gubun, addFormat){
function calendarSet(val,gubun){

	var now_date	= new Date();

	var p;
	var z=0;

	switch(val){
		case 1:now.setFullYear(now.getFullYear()-1);break;
		case 2:now.setMonth(now.getMonth()-1);break;
		case 3:now.setMonth(now.getMonth()+1);break;
		case 4:now.setFullYear(now.getFullYear()+1);break;
		case 5:now=now_date;break;
	}

	var NowYear = now.getFullYear();
	var NowMonth = now.getMonth();
	var m_infoDate = NowYear+'/'+NowMonth;

	last_date = new Date(now.getFullYear(),now.getMonth()+1,1-1);	//해당월 마지막 일자
	first_date= new Date(now.getFullYear(),now.getMonth(),1);		//해당월 처음일자 요일

	var now_scY = now.getFullYear()+"";
	var calendar_area = "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:4px #ffffff solid;\"><tr><td><table width=\"245\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"ffffff\" style=\"border:6px #78b300 solid;\"><tr height=\"26\" bgcolor=\"ffffff\" align=\"center\"><td style=\"padding-top:3px; padding-left:10px; \"> \n";
	calendar_area += "<div class=\"calendarTitleY\">";
	calendar_area += "<span onclick=\"calendarSet(1,'"+gubun+"')\" style='cursor:pointer;'>◀ </span>";
	calendar_area += now_scY;
	calendar_area += "<span onclick=\"calendarSet(4,'"+gubun+"')\" style='cursor:pointer;'> ▶</span>";
	calendar_area += "</div> \n";
	calendar_area += "<div class=\"calendarTitleM\">";
	calendar_area += "<span onclick=\"calendarSet(2,'"+gubun+"')\" style='cursor:pointer;'>◀ </span>";
	calendar_area += (now.getMonth()+1) +"";
	calendar_area += "<span onclick=\"calendarSet(3,'"+gubun+"')\" style='cursor:pointer;'> ▶</span>";
	calendar_area += "</div> \n";
	for(i=0;i<week.length;i++){
		if( weekNum[i] == 1 ) {
			calendar_area += "<div class=\"calendarWeekS\">"+week[i]+"</div> \n";
		} else if( weekNum[i] == 7 ) {
			calendar_area += "<div class=\"calendarWeekT\">"+week[i]+"</div> \n";
		} else {
			calendar_area += "<div class=\"calendarWeek\">"+week[i]+"</div> \n";
		}
	}

	calendar_area +="<div class=\"clearboth\"></div> \n";

	for(i=1;i<=first_date.getDay();i++){
		calendar_area+="<div class=\"calendarNoDay\">&nbsp;</div> \n";
	}

	z=(i-1);
	var clickDay;
	var weekCnt = 1;

	for (i=1;i<=last_date.getDate();i++){
		z++;
		p=z%7;
		var pmonth=now.getMonth()+1;
		if(i<10){var ii="0"+i;}else{var ii=i;}
		if(pmonth<10){pmonth="0"+pmonth;}

		//clickDay = now.getFullYear() + gubun + pmonth + gubun + ii + addFormat;
		clickDay = now.getFullYear() + gubun + pmonth + gubun + ii;

		// 날짜 출력
		if(i == now.getDate() && now.getFullYear()==static_now.getFullYear() && now.getMonth()==static_now.getMonth()){
			calendar_area += "<div class=\"calendarToDay\" onclick=\"calendarPrint('"+clickDay+"');\">"+ii+"</div> \n";
		}else if( p == 0 ){	//토요일
			calendar_area += "<div class=\"calendarDayT\" onclick=\"calendarPrint('"+clickDay+"');\">"+ii+"</div> \n";
		}else if( p == 1 ){	//일요일
			calendar_area += "<div class=\"calendarDayS\" onclick=\"calendarPrint('"+clickDay+"');\">"+ii+"</div> \n";
		}else{				//평일
			calendar_area += "<div class=\"calendarDay\" onclick=\"calendarPrint('"+clickDay+"');\">"+ii+"</div> \n";
		}
		if(p==0 && last_date.getDate() != i){
			calendar_area +="<div class=\"clearboth\"></div> \n";
			weekCnt++;
		}
	}

	if(p !=0){
		for(i=p;i<7;i++){
			calendar_area+="<div class=\"calendarNoDay\">&nbsp;</div> \n";
		}
	}

	var addtable1;
	var addtable2;
	if( weekCnt != 6){
		for(addtable1=weekCnt; addtable1 < 6; addtable1++){
			calendar_area +="<div class=\"clearboth\"></div> \n";
			for(addtable2=0; addtable2 < 7; addtable2++){
				calendar_area+="<div class=\"calendarNoDay\">&nbsp;</div> \n";
			}
		}
	}

	var nowDate	= now_date.getFullYear() + "-" + (100+( now_date.getMonth() + 1)).toString(10).substr(1) + "-" + (100+now_date.getDate()).toString(10).substr(1);

	calendar_area += "<div class=\"clearboth\"></div> \n";
	calendar_area += "<div class=\"calendarNow\" onclick=\"calendarSet(5,'"+gubun+"')\" align=\"left\">Today : "+nowDate+" </div> \n";
	calendar_area += "<div class=\"calendarClose\" onclick=\"calendarClose();\" align=\"right\"><font class=ver8><b>X</b></font></div> \n";
	calendar_area += "</td></tr></table></td></tr></table> \n";

	thisObj.innerHTML = calendar_area;

}

function calendarClose()
{
	dy_calOpen = 'n';
	thisObj.parentNode.removeChild(thisObj);
}

function calendarPrint(date)
{
	if( tagNm == "INPUT" ) eventElement.value = date;
	else {
		eventElement.innerHTML = date;
		document.getElementsByName('hopedate')[0].value=document.getElementsByClassName('cal-input')[0].innerText
	}
	calendarClose();
}

function calendar_get_objectTop(obj){
	if (obj.offsetParent == document.body) return obj.offsetTop;
	else return obj.offsetTop + get_objectTop(obj.offsetParent);
}

function calendar_get_objectLeft(obj){
	if (obj.offsetParent == document.body) return obj.offsetLeft;
	else return obj.offsetLeft + get_objectLeft(obj.offsetParent);
}
function getWhite(){
	document.getElementById('mun').id='white'
}
function getPurple(){
	document.getElementById('white').id='mun'
}
function bulkCheck(){
	var name=document.getElementsByName('name')[0]
	var phone=document.getElementsByName('phone')[0]
	//var email=document.getElementsByName('email')[0]
	var hopedate=document.getElementsByName('hopedate')[0]
	//var type=document.getElementsByName('type')[0]
	//var question=document.getElementsByName('question')[0]
	
	if(name.value==/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/g){
		alert('이름을 입력하세요');
		name.value=""
		name.focus();
		return false;
	}else if(phone.value==/^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/g){
		alert('핸드폰 번호를 입력하세요');
		phone.value=""
		phone.focus();
		return false;
	}else if(hopedate.value==null || hopedate.value==""){
		alert('날짜를 선택하세요');
		hopedate.focus();
		return false;
	}else{
		alert('입력되었습니다.')
		return true;
	}
}
