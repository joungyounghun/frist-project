function doSubmit() {
	var frm = document.q_frm;

	if (!frm.question_subject.value) {
		alert("제목을 입력하세요.");
		frm.question_subject.focus();
	} else if (!frm.question_content.value) {
		alert("내용을 입력하세요.");
		frm.question_content.focus();
	} else if (confirm("입력값이 맞습니까?")) {
		frm.submit();
	}
}

function imgload(input) {
	if(input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById("img").src = e.target.result;
		};
		reader.readAsDataURL(input.files[0])
	} else {
		document.getElementById("img").src = "";
	}
}