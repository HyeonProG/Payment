<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결제 실패</title>
</head>
<body>
    <h2>결제에 실패하였습니다.</h2>
    <p><%= request.getAttribute("message") %></p>
    <a href="/payment">다시 시도하기</a>
</body>
</html>
