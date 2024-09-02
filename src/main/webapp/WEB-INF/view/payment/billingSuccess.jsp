<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>등록 성공 안내</title>
</head>
<body>
    <h1>카드 등록에 성공하였습니다.</h1>
    <div>
        <label>카드 정보: </label>
        <pre><%= request.getAttribute("response") %></pre>
    </div>
</body>
</html>
