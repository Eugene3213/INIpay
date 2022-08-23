<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<form action="./reserveto.jsp" name="f" id="f" method="post" enctype="application/x-www-form-urlencoded">
	<div>
		<ul>
			<li>펜션 예약 등록 시스템<br>
			고객명: <input type="text" name="username"><br>
			연락처: <input type="text" name="userph"><br>
			이메일: <input type="text" name="usermail"><br>
			<input type="hidden" name="admin" value="parkyj3213@naver.com"><br>
			<input type="submit" name="register" value="예약등록">
			</li>
		</ul>
	</div>
</form>