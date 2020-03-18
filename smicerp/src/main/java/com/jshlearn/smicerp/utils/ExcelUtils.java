package com.jshlearn.smicerp.utils;

import org.apache.poi.hpsf.DocumentSummaryInformation;
import org.apache.poi.hpsf.SummaryInformation;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.IndexedColors;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * @Description excel 导入导出工具类
 * @ClassName ExcelUtils
 * @Author 蔡明涛
 * @Date 2020/3/17 23:49
 **/
public class ExcelUtils {

    /**
     * Excel 导出功能
     * @param excelName sheet名
     * @param titles  标题
     * @param exportData 数据
     * @param response   response
     * @return void
     * @author 蔡明涛
     * @date 2020/3/18 21:13
     */
    public static <T> void export (String excelName, String[] titles, List<String[]> exportData, HttpServletResponse response){

        String fileName = excelName + DateUtils.getCurrentDateTime();
        // 设置repose头信息
        response.reset();
        // 输出excel文件
        response.setContentType("application/vnd.ms-excel");
        try {
            response.setHeader("Content-disposition","attachment;fileName="+new String(fileName.getBytes("gb2312"),"ISO-8859-1")+".xls");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        // 创建excel文档
        HSSFWorkbook workbook = new HSSFWorkbook();
        // 配置文档的基本信息，可选
        setExcelSummaryInformation(excelName, workbook);

        // 设置标题样式
        HSSFCellStyle titleStyle = workbook.createCellStyle();
        // 设置表格居中
        titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        // 设置边框
        titleStyle.setBorderBottom(HSSFCellStyle.BORDER_THICK);
        titleStyle.setBorderTop(HSSFCellStyle.BORDER_THICK);
        titleStyle.setBorderLeft(HSSFCellStyle.BORDER_THICK);
        titleStyle.setBorderRight(HSSFCellStyle.BORDER_THICK);
        // 设置字体
        // 标题字体
        HSSFFont headFont = workbook.createFont();
        headFont.setFontName("宋体");
        headFont.setFontHeightInPoints((short)16);
        // 字体加粗
        headFont.setBold(true);


        // 设置内容样式
        HSSFCellStyle dataStyle = workbook.createCellStyle();
        // 设置表格居中
        dataStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        // 设置边框
        dataStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        dataStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
        dataStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        dataStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
        // 内容字体
        HSSFFont dataFont = workbook.createFont();
        dataFont.setFontName("楷体");
        dataFont.setFontHeightInPoints((short) 14);
        dataFont.setBold(false);

        // 创建sheet页
        HSSFSheet sheet = workbook.createSheet(excelName);
        // 创建第一行，标题行
        HSSFRow header = sheet.createRow(0);
        // 将对应的标题内容填充
        fileInput(titles, titleStyle, headFont, sheet, header);
        // 添加表格数据
        for (int x = 0; x < exportData.size();x++ ) {
            HSSFRow row = sheet.createRow(x+1);
            String[] data = exportData.get(x);
            fileInput(data, dataStyle, dataFont, sheet, row);
        }

        // 将文件输出
        try {
            OutputStream os = response.getOutputStream();
            workbook.write(os);
            os.flush();
            os.close();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    /**
     *  数据填充
     * @param data, style, headFont, sheet, header
     * @return void
     * @author 蔡明涛
     * @date 2020/3/18 21:46
     */
    private static void fileInput(String[] data, HSSFCellStyle style, HSSFFont font, HSSFSheet sheet, HSSFRow row) {
        for (int i = 0; i < data.length; i++) {
            HSSFCell cell = row.createCell(i);
            cell.setCellValue(data[i]);
            style.setFont(font);
            cell.setCellStyle(style);
            sheet.autoSizeColumn(i);
        }
    }

    /**
     * 设置文档信息
     * @param excelName workbook 工作表对象
     * @return void
     * @author 蔡明涛
     * @date 2020/3/18 21:15
     */
    private static void setExcelSummaryInformation(String excelName, HSSFWorkbook workbook) {
        // 创建文章摘要
        workbook.createInformationProperties();
        // 获取文档信息，并配置
        DocumentSummaryInformation dsi = workbook.getDocumentSummaryInformation();
        // 文档类别
        dsi.setCategory(excelName+"表");
        // 设置管理信息
        dsi.setManager("SMIC_ERP");
        // 设置组织信息
        dsi.setCompany("SMIC");
        // 获取摘要信息 并配置
        SummaryInformation si = workbook.getSummaryInformation();
        // 设置文档主题
        si.setSubject(excelName);
        // 设置文档标题
        si.setTitle(excelName);
        // 设置文档作者
        si.setAuthor("SMIC_ERP");
        // 设置文档备注
        si.setComments("Just Demo!");
    }

}
