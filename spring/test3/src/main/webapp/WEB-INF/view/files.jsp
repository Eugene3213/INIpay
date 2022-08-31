<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일업로드 -spring Controller와 병행처리</title>
</head>
<body>
	<form name="f" method="post" enctype="multipart/form-data" action="fileupload.do">
		<input type="file" name="file1">
		<input type="submit" value="파일전송">
	</form>
</body>
</html>