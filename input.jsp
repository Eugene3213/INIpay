<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력파트</title>
	<style>
		table{
			width:100%;
			border: 1px solid black;
		}
		td{
			border: 1px solid black;
			padding: 10px;
		}
	</style>
</head>
<body>
	<form action="" name="f" id="f" >
		<table>
        <tr>
          <td>신청인 이름</td><td><input type="text" name="ap_name"></td>
        </tr>
        <tr>
          <td>신청인 이메일</td><td><input type="text" name="ap_email"></td>
        </tr>
        <tr>
          <td>신청인 생년월일</td><td><input type="text" name="ap_date" maxlength="8" placeholder="19000101"></td>
        </tr>
        <tr>
          <td>신청방법</td><td><input type="text" name="ap_type" maxlength="1" placeholder="온라인: 0입력, 방문: 1입력"></td>
        </tr>
        <tr>
          <td>카드번호</td><td><input type="text" name="ap_cardnumber" maxlength="16" placeholder="0000-0000-0000-0000"></td>
        </tr>
        <tr>
          <td>연락처</td><td><input type="text" name="ap_tel" maxlength="11" placeholder="010-0000-0000"></td>
        </tr>
    </table>
    <input type="button" name="index" value="목차"><input type="submit" name="input" value="입력완료">
	</form>
</body>
</html>