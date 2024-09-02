<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>등록 실패 안내</title>
</head>
<body>
    <h1>카드 등록에 실패하였습니다.</h1>
    <div>
        <label>실패 사유: </label>
        <pre><%= request.getAttribute("message") %></pre>
    </div>
</body>
</html>
