<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.test{
	width:1200px;
	margin: 0 auto;
}

#editorTxt{
	width: 700px;
	margin: 0 auto;
}
</style>

<script type="text/javascript" src="/hondimoyeong/resources/static/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>

<div class="test">
<form action="smart.insert">
	<div class="test">
		<textarea class="form-control" name="editorTxt" id="editorTxt" rows="20" cols="10" placeholder="성공해라 얍"></textarea>
	</div>
</form>
</div>

<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "editorTxt",
	 sSkinURI: "/hondimoyeong/resources/static/smarteditor/SmartEditor2Skin.html",
	 fCreator: "createSEditor2"
	});
</script>

</body>
</html>