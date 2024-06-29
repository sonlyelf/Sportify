package com.sportify.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sportify.dao.ClassInfoDao;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;

@Service
public class ImageService {

    @Value("${upload.dir}")
    private String UPLOAD_DIR;

    public String saveImage(MultipartFile file) throws IOException {
        try {
            // 構建文件路徑
            Path filePath = Paths.get(UPLOAD_DIR, file.getOriginalFilename());

            // 將文件保存到指定路徑
            Files.write(filePath, file.getBytes());

            // 如果你需要存儲 Base64 編碼的圖片字符串，可以這樣做
            byte[] imageData = Files.readAllBytes(filePath);
            String base64Image = Base64.getEncoder().encodeToString(imageData);

            // 返回文件路徑或Base64編碼的圖片字符串
            return base64Image; // 或者 return filePath.toString();
        } catch (IOException e) {
            e.printStackTrace();
            throw new IOException("保存文件失敗: " + e.getMessage());
        }
    }
}