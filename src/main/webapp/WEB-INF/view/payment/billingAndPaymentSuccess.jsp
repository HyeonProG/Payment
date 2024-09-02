<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결제 성공</title>
</head>
<body>
    <h2>결제가 성공적으로 처리되었습니다.</h2>
    <pre><%= request.getAttribute("response") %></pre>
    <a href="/payment">다시 결제하기</a>
</body>
</html>
