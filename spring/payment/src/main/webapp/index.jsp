<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
 	<%
 		//setAttribute , getAttribute 같이 사용 금지
 		//사용자 정보 저장
 		String mid, mname, memail, mtel;
 		mid="hong";
 		mname="홍길동";
 		memail="parkyj3213@naver.com";
 		mtel="01030893213";
 			session.setAttribute("mid",mid);
 			session.setAttribute("mname",mname);
 			session.setAttribute("mtel", mtel);
 			session.setAttribute("memail", memail);
 		/*
 		session.removeAttribute(mid);	
 		session.removeAttribute(mname);
 		*/
 		
 		//상품코드 6자리 난수코드를 생성
 		Random rd = new Random();
 		int number;
 		String nb="";
 		for(int a=1; a<7; a++){
 			number = rd.nextInt(9);
 			nb += number;
 		}
 	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품선택 부분</title>
</head>
<body>
<!-- 결제 시스템에는 상품코드 최소 6자리~ 최대 12자리 사용
	 상품수량: 무조건 숫자만 입력
	 결제금액: 무조건 숫자만 입력. 최소 1000부터 시작 24,000(x)
	 상품명: 불필요한 단어는 필터링(마약, 담배, 술 etc..)
	 -->
	<form action="" name="frm" id="frm">
		상품코드:<input type="text" name="product_code" value="<%=nb %>" readonly="readonly"><br>
		상품명:<input type="text" name="product_name" value=""><br>
		결제금액:<input type="text" name="product_money" value=""><br>
		상품수량:<input type="text" name="product_ea" value=""><br>
		<input type="button" value="상품구매확정" id="btn">
	</form>
	<!-- ECMA 형태 script -->
	<script type="module">
		import {gopage} from "./js/index.js";
		document.querySelector("#btn").addEventListener("click",gopage);
	</script>
</body>
</html>



