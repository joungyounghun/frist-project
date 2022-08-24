function doSubmit() {
	var frm = document.a_frm;

	if (!frm.answer_content.value) {
		alert("내용을 입력하세요.");
		frm.answer_content.focus();
	} else if (confirm("입력값이 맞습니까?")) {
		frm.submit();
	}
}

function doModify() {
	var frm = document.a_frm;

	if (!frm.answer_content.value) {
		alert("내용을 입력하세요.");
		frm.answer_content.focus();
	} else if (frm.answer_content.value == frm.content_org.value) {
		alert("바뀐 내용이 없습니다.");
		frm.answer_content.focus();
	} else if (confirm("입력값이 맞습니까?")) {
		frm.submit();
	}
}