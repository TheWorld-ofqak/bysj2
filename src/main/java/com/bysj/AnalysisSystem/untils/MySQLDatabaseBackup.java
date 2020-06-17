package com.bysj.AnalysisSystem.untils;

import java.io.*;
import java.nio.charset.StandardCharsets;

/**
 * MySQL数据库备份 
 *
 */
public class MySQLDatabaseBackup {

    /**
     * Java代码实现MySQL数据库导出 
     *
     * @param hostIP MySQL数据库所在服务器地址IP 
     * @param userName 进入数据库所需要的用户名 
     * @param password 进入数据库所需要的密码 
     * @param savePath 数据库导出文件保存路径 
     * @param fileName 数据库导出文件文件名 
     * @param databaseName 要导出的数据库名 
     * @return 返回true表示导出成功，否则返回false。
     *
     *
     * cmd  数据库应用的语句：   mysqldump -h127.0.0.1 -uroot -p123456 bysj2 > d:/test.sql
     *
     */

    //备份数据库
    public static boolean exportDatabaseTool(String hostIP, String userName, String password, String savePath, String fileName, String databaseName) throws InterruptedException {
        File saveFile = new File(savePath);
        if (!saveFile.exists()) {// 如果目录不存在  
            saveFile.mkdirs();// 创建文件夹  
        }
        if(!savePath.endsWith(File.separator)){
            savePath = savePath + File.separator;
        }

        PrintWriter printWriter = null;
        BufferedReader bufferedReader = null;
        try {  //路径要写对
            printWriter = new PrintWriter(new OutputStreamWriter(new FileOutputStream(savePath + fileName), "utf8"));
            Process process = Runtime.getRuntime().exec("E:\\mysql8.0.17\\bin\\mysqldump -h" + hostIP + " -u" + userName + " -p" + password + " --set-charset=UTF8 " + databaseName);
            InputStreamReader inputStreamReader = new InputStreamReader(process.getInputStream(), "utf8");
            bufferedReader = new BufferedReader(inputStreamReader);
            String line;
            while((line = bufferedReader.readLine())!= null){
                printWriter.println(line);
            }
            printWriter.flush();
            if(process.waitFor() == 0){//0 表示线程正常终止。  
                return true;
            }
        }catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (bufferedReader != null) {
                    bufferedReader.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return false;
    }


    //恢复数据库
    public static void restore(String name) throws IOException {
            Runtime runtime = Runtime.getRuntime();
            Process process = runtime
                    .exec("E:\\mysql8.0.17\\bin\\mysql -h127.0.0.1 -uroot -pqak195085 --default-character-set=utf8 bysj2");
            OutputStream outputStream = process.getOutputStream();
            BufferedReader br = new BufferedReader(new InputStreamReader(

                    //
                    new FileInputStream("E:\\mysql\\"+name), StandardCharsets.UTF_8));
            String str = null;
            StringBuilder sb = new StringBuilder();
            while ((str = br.readLine()) != null) {
                sb.append(str).append("\r\n");
            }
            str = sb.toString();
            OutputStreamWriter writer = new OutputStreamWriter(outputStream, StandardCharsets.UTF_8);
            writer.write(str);
            writer.flush();
            outputStream.close();
            br.close();
            writer.close();

    }
//    public static void main(String[] args){
//        try {
//            if (exportDatabaseTool("localhost", "root", "qak195085", "backupDatabase", "2019-4-11.sql", "bysj2")) {
//                System.out.println("数据库成功备份！！！");
//            } else {
//                System.out.println("数据库备份失败！！！");
//            }
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
//    }
//        public static void main(String[] args){
//            try {
//                restore("backupDatabase/2019-4-11.sql");
//                System.out.println("数据库成功恢复！！！");
//            } catch (IOException e) {
//                e.printStackTrace();
//                System.out.println("数据库恢复失败！！！");
//            }
//        }

}  
