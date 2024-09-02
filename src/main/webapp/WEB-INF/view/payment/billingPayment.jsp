<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>토스 페이먼츠 결제 연동 예제</title>
    <script src="https://js.tosspayments.com/v1"></script>
</head>
<body>
<button id="card_button">카드 등록</button>

<script type="text/javascript">
    window.addEventListener('load', (event) => {
        document.getElementById("card_button").addEventListener("click", function() {
            const clientKey = "test_ck_LlDJaYngro1K6KqdMdnG3ezGdRpX"; // 서버에서 전달받은 클라이언트 키
            const tossPayments = TossPayments(clientKey);
            tossPayments.requestBillingAuth("카드", {
                customerKey: "uOnZq867vs5XA34TrrC_l", // 서버에서 전달받은 고객 키
                successUrl: "http://localhost:8080/success", // 성공 URL
                failUrl: "http://localhost:8080/fail" // 실패 URL
            });
        });
    });
</script>
</body>
</html>
