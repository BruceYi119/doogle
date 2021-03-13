function fnMove(seq){
    var offset = $("#benefit" + seq).offset();
    $('html, body').animate({scrollTop : offset.top}, 400);
}

AOS.init();