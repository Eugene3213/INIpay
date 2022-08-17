<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<%@ attribute name="no" required="true" type="java.lang.Integer"%>
<%@ attribute name="no2" required="false"%>
<!-- attribute는 JSP에서 값을 가져올 때 사용하는 문법. name으로 태그에 있는 값을
	 가져옴. type값을 가져올 때 자료형을 말함.
	 required: true(자료형을 무조건 사용), false(자료형과 관계없이 사용) -->

<!-- variable: 출력 여부 및 변수이름을 추가 할 때 사용(return에 사용 할 이름) 
	 variable-class: 자료형을 구분하게 됨. 단, required false일 경우 사용하지 않아도 됨-->

<!-- scope: 출력 형태: 
	AT_END: 태그 종료 후 출력 
	AT_BEGIN: 태그 시작의 초기값을 입력 받아 출력
	NESTED: foreach 사용 시 적용하게 됨--> 
 <%@ variable name-given="returncall" 
 variable-class="java.lang.Integer" scope="AT_END"%>
 <%@ variable name-given="returncall2" scope="AT_END"%>
 
 
<%@ taglib prefix="pyj" uri="http://java.sun.com/jsp/jstl/core"%>

<pyj:set var="returncall" value="${no}"></pyj:set>
<pyj:set var="returncall2" value="${no2}"></pyj:set>
	