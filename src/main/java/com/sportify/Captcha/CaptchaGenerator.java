package com.sportify.Captcha;

import java.util.Random;

public class CaptchaGenerator {
    public static String generateCaptcha(int length) {
        String numbers = "0123456789"; // 包含所有數字 0 到 9
        Random random = new Random();
        StringBuilder sb = new StringBuilder(length);

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(numbers.length());
            sb.append(numbers.charAt(index));
        }
        return sb.toString();
    }
}