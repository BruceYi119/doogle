$(function(){
	function change()
	{
		
		var chk=document.documentElement.scrollTop;
		document.getElementById("con_nav2").style.position="fixed";
		if(chk>=220)
		{
			document.getElementById("con_nav2").style.top="140px";		
		}
		else
		{
			document.getElementById("con_nav2").style.top="300px";
		}
	}
	window.onscroll=change;
})