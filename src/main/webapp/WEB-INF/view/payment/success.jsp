<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<title>결제 성공</title>
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
</head>

<body>
	<c:choose>
		<c:when test="${isSuccess}">
			<h1>결제 성공</h1>
			<p>
				결과데이터: <span>${responseStr}</span>
			</p>
			<p>
				orderName: <span>${orderName}</span>
			</p>
			<p>
				method: <span>${method}</span>
			</p>

			<p>
				cardNumber: <span>${cardNumber}</span>
			</p>

		</c:when>
		<c:otherwise>
			<h1>결제 실패</h1>
			<p>
				에러메시지: <span>${message}</span>
			</p>
			<p>
				에러코드: <span>${code}</span>
			</p>
		</c:otherwise>
	</c:choose>
</body>
</html>
