<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>결제하기</title>
    <meta charset="UTF-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="./bulma.min.css" />

    <script src="https://js.tosspayments.com/v1"></script>
  </head>

  <body>
    <section class="hero is-link">
      <div class="hero-body">
        <div class="container">
          <h1 class="title">결제하기</h1>
        </div>
      </div>
    </section>
    <section class="section">
      <div class="container">
        <button class="button is-link" onclick="pay('카드',jsons.card);">결제하기</button>
      </div>
    </section>
  </body>

  <script>
    let amount = 5000;

    let tossPayments = TossPayments("test_ck_LlDJaYngro1K6KqdMdnG3ezGdRpX"); // 테스트 클라이언트 키
    let path = "/toss";
    let successUrl = window.location.origin + path + "/success";
    let failUrl = window.location.origin + path + "/fail";
    let callbackUrl = window.location.origin + path + "va_callback";
    let orderId = new Date().getTime();

    function pay(method, requestJson) {
      console.log(requestJson);
      tossPayments.requestPayment(method, requestJson).catch(function (error) {
        if (error.code === "USER_CANCEL") {
          alert("결제를 취소했습니다.");
        } else {
          alert(error.message);
        }
      });
    }


    let jsons = {
      card: {
        amount: amount,
        orderId: "sample-" + orderId,
        orderName: "토스 티셔츠 외 2건",
        successUrl: successUrl,
        failUrl: failUrl,
        cardCompany: null,
        cardInstallmentPlan: null,
        maxCardInstallmentPlan: null,
        useCardPoint: false,
        customerName: "박토스",
        customerEmail: null,
        customerMobilePhone: null,
        taxFreeAmount: null,
        useInternationalCardOnly: false,
        flowMode: "DEFAULT",
        discountCode: null,
        appScheme: null,
      },
    };
  </script>
</html>