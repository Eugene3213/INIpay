<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첨부파일 응용문제</title>
</head>
<body>
	<form name="f" method="post" enctype="multipart/form-data" action="examupload.do">
		<input type="file" name="file1" accept="" placeholder="첨부파일1">
		<input type="file" name="file2" accept="" placeholder="첨부파일2">
		<input type="file" name="file3" accept="" placeholder="첨부파일3">
		<input type="submit" value="확인">
	</form>
</body>
</html>