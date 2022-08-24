function doSubmit() {
	var frm = document.n_frm;

	if (!frm.notice_subject.value) {
		alert("제목을 입력하세요.");
		frm.notice_subject.focus();
	} else if (!frm.notice_content.value) {
		alert("내용을 입력하세요.");
		frm.notice_content.focus();
	} else if (confirm("입력값이 맞습니까?")) {
		frm.submit();
	}
}

function doModify() {
	var frm1 = document.n_frm;
	
	if (!frm1.notice_subject.value) {
		alert("제목을 입력하세요.");
		frm1.notice_subject.focus();
	} else if (!frm1.notice_content.value) {
		alert("내용을 입력하시오.");
		frm1.notice_content.focus();
	} else if(frm1.notice_subject.value == frm1.subject_org.value 
			  && frm1.notice_content.value == frm1.content_org.value) {
	 	alert("변경된 내용이 없습니다.")
	 	frm1.notice_subject.focus();
	} else {
		frm1.submit();
	}
}

function reset1() {
	var frm1 = document.n_frm;
	
	frm1.notice_content.value = "";
	frm1.notice_subject.value = "";
}