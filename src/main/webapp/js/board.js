/**
 * 
 */
function paging(page){
	document.readFrm.nowPage.value=page;
	document.readFrm.submit();
}

function list(){
	document.listFrm.action="List.jsp";
	document.listFrm.submit();
}

function check(){
	if(document.searchFrm.keyWord.value==""){
		alert("검색어를 입력하세요");
		document.searchFrm.keyWord.focus();
		
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
