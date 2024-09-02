package com.example.demo.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Base64;

@Service
public class PaymentService {

    @Value("${payment.toss.test-secret-api-key}")
    private String secretKey;

    private final ObjectMapper objectMapper = new ObjectMapper();

    // 빌링키 발급과 동시에 자동 결제 수행
    public String authorizeBillingAndAutoPayment(String authKey, String customerKey, String orderId, String orderName, int amount) throws Exception {
        String encodedAuthHeader = Base64.getEncoder().encodeToString((secretKey + ":").getBytes());

        // 빌링키 발급 요청
        HttpRequest billingRequest = HttpRequest.newBuilder()
            .uri(URI.create("https://api.tosspayments.com/v1/billing/authorizations/issue"))
            .header("Authorization", "Basic " + encodedAuthHeader)
            .header("Content-Type", "application/json")
            .method("POST", HttpRequest.BodyPublishers.ofString("{\"authKey\":\"" + authKey + "\",\"customerKey\":\"" + customerKey + "\"}"))
            .build();

        HttpResponse<String> billingResponse = HttpClient.newHttpClient().send(billingRequest, HttpResponse.BodyHandlers.ofString());

        if (billingResponse.statusCode() == 200) {
            JsonNode billingJson = objectMapper.readTree(billingResponse.body());
            String billingKey = billingJson.get("billingKey").asText();

            // 자동 결제 요청
            HttpRequest paymentRequest = HttpRequest.newBuilder()
                .uri(URI.create("https://api.tosspayments.com/v1/billing/" + billingKey))
                .header("Authorization", "Basic " + encodedAuthHeader)
                .header("Content-Type", "application/json")
                .method("POST", HttpRequest.BodyPublishers.ofString(
                    "{\"customerKey\":\"" + customerKey + "\"," +
                    "\"orderId\":\"" + orderId + "\"," +
                    "\"orderName\":\"" + orderName + "\"," +
                    "\"amount\":" + amount + "}"))
                .build();

            HttpResponse<String> paymentResponse = HttpClient.newHttpClient().send(paymentRequest, HttpResponse.BodyHandlers.ofString());

            if (paymentResponse.statusCode() == 200) {
                JsonNode paymentJson = objectMapper.readTree(paymentResponse.body());
                return paymentJson.toPrettyString();
            } else {
                throw new RuntimeException("Failed to process payment: " + paymentResponse.body());
            }
        } else {
            throw new RuntimeException("Failed to issue billing key: " + billingResponse.body());
        }
    }
}
