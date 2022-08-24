function doSubmit() {
	var frm = document.hb_frm;

	if (!frm.house_area.value) {
		alert("면적을 입력하세요.");
		frm.house_area.focus();
	} else if (!frm.house_title.value) {
		alert("제목을 입력하세요.");
		frm.house_title.focus();
	} else if (!frm.house_content.value) {
		alert("내용을 입력하세요.");
		frm.house_content.focus();
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

function doModify() {
	var frm1 = document.hb_frm;

	if (!frm1.house_area.value) {
		alert("면적을 입력하세요.");
		frm1.house_area.focus();
	} else if (!frm1.house_title.value) {
		alert("제목을 입력하세요.");
		frm1.house_title.focus();
	} else if (!frm1.house_content.value) {
		alert("내용을 입력하세요.");
		frm1.house_content.focus();
	} else if(frm1.house_area.value == frm1.area_org.value 
			  && frm1.house_title.value == frm1.title_org.value
			  && frm1.house_content.value == frm1.content_org.value) {
	 	alert("변경된 내용이 없습니다.")
	 	frm1.notice_subject.focus();
	} else if (confirm("입력값이 맞습니까?")) {
		frm1.submit();
	}
}