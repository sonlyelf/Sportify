package com.sportify.Captcha;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.Paint;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.Random;

import javax.imageio.ImageIO;


public class CaptchaImageGenerator {
    public static String generateCaptchaImage(String captcha) throws IOException {
        int width = 150;  // 圖片寬度
        int height = 60;  // 圖片高度

        // 創建一個 BufferedImage 對象，設置圖片類型為 RGB
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = image.createGraphics();

        // 設置背景顏色為黃色
        g2d.setColor(new Color(125, 226, 229));
        g2d.fillRect(0, 0, width, height);

        // 設置字體和顏色
        g2d.setFont(new Font("Arial", Font.BOLD, 32));
        g2d.setColor(Color.DARK_GRAY);
	

        // 繪製驗證碼文本
        int x = 10;
        int y = 50;
        g2d.drawString(captcha, x, y);

        // 添加隨機的干擾線
        Random random = new Random();
        for (int i = 0; i < 10; i++) {
            int startX = random.nextInt(width);
            int startY = random.nextInt(height);
            int endX = random.nextInt(width);
            int endY = random.nextInt(height);
            g2d.drawLine(startX, startY, endX, endY);
        }

        g2d.dispose();

        // 將 BufferedImage 轉換為 Base64 編碼的圖片字符串
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            ImageIO.write(image, "png", baos);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            baos.close();
        }

        byte[] imageBytes = baos.toByteArray();
        return Base64.getEncoder().encodeToString(imageBytes);
    }
}

