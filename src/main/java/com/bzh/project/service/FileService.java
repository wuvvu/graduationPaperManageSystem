package com.bzh.project.service;

import com.bzh.project.Util.DateUtil;
import com.bzh.project.model.student.Student;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@Service
public class FileService {

    private static final String folderName = "R:\\TestUpload\\"; //TODO change this

    public String upload(MultipartFile file, Student student, String time) throws IllegalStateException, IOException {
        if (file.isEmpty()) { // 判断是否为空文件
            System.out.println("上传文件不能为空");
            return null;
        }
        String contentType = file.getContentType(); // 文件类型
        //String fileName = file.getName(); // SpringMVC处理后的文件名
        Long fileSize = file.getSize(); // 文件大小
        // 文件名为学生学号+上传时间

        String fileName = student.getId() + "_" + new DateUtil().getDate() + "_" + time +".pdf";

        // 文件全路径
        String filePath = folderName + fileName;

        // 保存文件,可以使用二进制流直接保存, 这里直接使用transferTo
        file.transferTo(new File(filePath));

        System.out.println("服务器文件名：" + fileName);
        System.out.println("服务器文件路径：" + filePath);
        System.out.println(String.format(file.getClass().getName() + "方式文件上传成功！文件名:%s, 文件类型:%s, 文件大小:%s", fileName, contentType, fileSize));

        return fileName;
    }

    public int downloadFile(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        String fileName = request.getParameter("fileName");// 文件名
        if(fileName == null || fileName.equals("")) {
            return -1;
        }
        //设置文件路径
        File file = new File(folderName + fileName); //TODO change this
        //File file = new File(realPath , fileName);
        if (file.exists()) {
            response.setContentType("application/force-download;charset=utf-8");// 设置强制下载不打开
            response.setCharacterEncoding("utf-8");
            response.addHeader("Content-Disposition", "attachment;fileName=" + java.net.URLEncoder.encode(fileName,"UTF-8"));// 设置文件名
            byte[] buffer = new byte[1024];
            FileInputStream fis = null;
            BufferedInputStream bis = null;
            try {
                fis = new FileInputStream(file);
                bis = new BufferedInputStream(fis);
                OutputStream os = response.getOutputStream();
                int i = bis.read(buffer);
                while (i != -1) {
                    os.write(buffer, 0, i);
                    i = bis.read(buffer);
                }
                return 0;
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (bis != null) {
                    try {
                        bis.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                if (fis != null) {
                    try {
                        fis.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        } else {
            return -2;
        }
        return -10;
    }




    /*public static void csvReadOperation() throws IOException {
        File file = new File("R:\\test.csv");
        CsvReader csvReader = new CsvReader();
        csvReader.setContainsHeader(true);

        CsvContainer csv = csvReader.read(file, StandardCharsets.UTF_8);
        List<Student> students = new ArrayList<>();
        for (CsvRow row : csv.getRows()) {
            students.add(new Student(
                    row.getField("id"),
                    row.getField("realName"),
                    row.getField("subject"),
                    row.getField("graduationYear")
            ));
            System.out.print(row.getField(0));
            System.out.print(" " + row.getField(1));
            System.out.print(" " + row.getField(2));
            System.out.print(" " + row.getField(3));
            System.out.println(" " + row.getField(4));
        }

    }*/

    /*public void csvReadOperation1() throws IOException {
        File file = new File("F:\\Excel\\customer-info.csv");
        CsvReader csvReader = new CsvReader();

        CsvContainer csv = csvReader.read(file, StandardCharsets.UTF_8);
        for (CsvRow row : csv.getRows()) {
            System.out.println("Read line: " + row);
            System.out.println("First column of line: " + row.getField(0));
            if (row.getOriginalLineNumber() != 1) {
                ResultInfo resultInfo = new ResultInfo();
                resultInfo.setUserId(row.getField(0));
                resultInfo.setUserPhone(row.getField(1));
                resultInfo.setUserName(row.getField(2));
                resultInfo.setRegistTime(row.getField(3));
                resultInfo.setUserlevel(row.getField(4));
                resultInfo.setAppName(row.getField(10));
                listResultInfo.add(resultInfo);
            }

        }
    }

    public void csvReadOperation2() throws IOException {
        File file = new File("F:\\Excel\\customer-info.csv");
        CsvReader csvReader = new CsvReader();

        try (CsvParser csvParser = csvReader.parse(file, StandardCharsets.UTF_8)) {
            CsvRow row;
            while ((row = csvParser.nextRow()) != null) {
                System.out.println("Read line: " + row);
                System.out.println("First column of line: " + row.getField(0));
            }
        }
    }*/
}
