package com.summer.manage.controller;

import com.summer.manage.dao.FileDao;
import com.summer.manage.utils.FileUtil;
import com.summer.manage.utils.MapKit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.ClassUtils;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Paths;
import java.util.Map;

@Controller
@RequestMapping("/file")
public class UploadFileController {

    @Resource
    private ResourceLoader resourceLoader;

    @Autowired
    FileDao fileDao;

    @PostMapping("/upload")
    @ResponseBody
    Map<String, Object> upload(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
        try {
            String fileMd5 = DigestUtils.md5DigestAsHex(file.getBytes());
            String prefix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
            file.transferTo(new File(Paths.get("D:\\upload") + "\\" + fileMd5 + "." + prefix));
            com.summer.manage.entity.File file1 = new com.summer.manage.entity.File();
            file1.setFileName(file.getOriginalFilename());
            file1.setHash(fileMd5);
            file1.setSize(file.getSize());
            fileDao.save(file1);
            return MapKit.okNoContent().set("fileName", fileMd5 + "." + prefix).set("file",file1).getMap();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return MapKit.okNoContent().getMap();
    }

    @GetMapping("/{fileName:.+}")
    @ResponseBody
    ResponseEntity<?> index(@PathVariable String fileName) throws IOException {
        return ResponseEntity.ok(resourceLoader.getResource("file:" + Paths.get("D:\\upload") + "\\" + fileName));
    }
}
