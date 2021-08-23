/**
 * 
 */
function paging(page){
	document.readFrm.nowPage.value=page;
	document.readFrm.submit();
}

function list(){
	document.listFrm.action="notice.jsp";
	document.listFrm.submit();
}

function check(){
	if(document.searchFrm.keyField2.value=="극장선택"){
		alert("극장을 선택해주세요");
		document.searchFrm.keyField2.focus();
	}
	else{
		document.searchFrm.submit();
	}
}

function read(num){
	document.readFrm.num.value=num;
	document.readFrm.action="notice_read.jsp";
	document.readFrm.submit();
}
