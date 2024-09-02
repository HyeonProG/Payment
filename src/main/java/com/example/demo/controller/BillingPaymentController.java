package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.PaymentService;

import java.util.UUID;

@Controller
public class BillingPaymentController {

    @Autowired
    private PaymentService paymentService;

    @GetMapping("/payment")
    public String paymentPage() {
        return "payment/payment"; // 결제 페이지로 이동
    }

    @GetMapping("/success")
    public String success(
        @RequestParam("authKey") String authKey, 
        @RequestParam("customerKey") String customerKey, 
        Model model
    ) {
        try {
            // 주문 ID 생성
            String orderId = UUID.randomUUID().toString();
            String orderName = "Sample Order"; // 실제 주문 이름으로 대체

            // 빌링키 발급과 자동 결제 실행
            String response = paymentService.authorizeBillingAndAutoPayment(authKey, customerKey, orderId, orderName, 10000); // 금액은 실제 금액으로 대체
            model.addAttribute("response", response);
            return "payment/success";
        } catch (Exception e) {
            model.addAttribute("message", e.getMessage());
            return "payment/fail";
        }
    }

    @GetMapping("/fail")
    public String fail(@RequestParam(required = false) String message, Model model) {
        model.addAttribute("message", message);
        return "payment/fail";
    }
}
