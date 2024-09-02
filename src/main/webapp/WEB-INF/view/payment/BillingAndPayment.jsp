<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>토스 페이먼츠 결제</title>
    <script src="https://js.tosspayments.com/v1"></script>
</head>
<body>
    <h2>토스 페이먼츠 결제</h2>
    <button id="card_button">결제 하기</button>

    <script type="text/javascript">
        window.addEventListener('load', (event) => {
            document.getElementById("card_button").addEventListener("click", function() {
                const clientKey = "test_ck_LlDJaYngro1K6KqdMdnG3ezGdRpX"; // 서버에서 전달받은 클라이언트 키
                const tossPayments = TossPayments(clientKey);
                
                // 고객 고유키를 서버로부터 받아옵니다.
                const customerKey = "basdhei23hbsdkav";

                tossPayments.requestBillingAuth("카드", {
                    customerKey: customerKey, // 서버에서 전달받은 고객 키
                    successUrl: "http://localhost:8080/success", // 성공 시 리디렉션 URL
                    failUrl: "http://localhost:8080/fail" // 실패 시 리디렉션 URL
                });
            });
        });
    </script>
</body>
</html>
