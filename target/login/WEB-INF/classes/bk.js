//change the backgroundImage random
function bki(){
	var len = images.length;
	var no = Math.floor(len*Math.random());
	preNo = nowNo;
	nowNo = no;
	document.body.style.backgroundImage = 'url("'+images[no].src+'")';
	t=setTimeout("bki()",3000);
}

//body onclick()
function bodyclick(event){
	var btnNum = event.button;
	changebk(btnNum);
}

//set backgoundImage by no;
function bki_i(i){
	if(i<0||i>(images.length-1)){
		t = bki();
	}else{
		document.body.style.backgroundImage = 'url("'+images[i].src+'")';
	}
}

//change the background
function changebk(w){
	//1---next
	clearTimeout(t);
	if(0 == w){
		bki();
	}else if(2 == w){
		bki_i(preNo);
	}
}