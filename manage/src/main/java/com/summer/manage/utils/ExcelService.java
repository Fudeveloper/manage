package com.summer.manage.utils;


import com.summer.manage.vo.ExcelVO;
import com.summer.manage.vo.SheetVO;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;

/**
 *
 *
 * @Title:
 * @Description: 实现读取Excel的服务  Excel 97-2003和2007 版本
 * @Copyright:Copyright (c) 2011
 * @Company:易程科技股份有限公司
 * @Date:2012-6-13
 * @author  longgangbai
 * @version 1.0
 */
public class ExcelService<T> {

    /**
     * 以Map的格式存储数�?
     * 读取Excel文件的数�?
     * @param filePath   excel 文件的
     * @param headTitle
     * @return
     */
    public Map<String,List<Map<String,Object>>> readEXCELMap(String filePath,String[] headTitle){
        //获取workbook对象
        Workbook workbook=getExcelWorkBook(filePath);
        //获取sheet页数
        int sheetNum=workbook.getNumberOfSheets();
        //存储excel相关的数�?
        Map<String,List<Map<String,Object>>> excelData=new HashMap<String,List<Map<String,Object>>>();
        //遍历相关sheet页面获取相关的数�?
        if(sheetNum>0){
            for (int index = 0; index < sheetNum; index++) {
                //创建sheet
                Sheet sheet=workbook.getSheetAt(index);
                //获取sheet的名�?
                String sheetName=workbook.getSheetName(index);
                //获取相关的数�?
                List<Map<String,Object>> sheetData=getExcelMapData(sheet, headTitle);
                excelData.put(sheetName, sheetData);
            }
        }
        return excelData;
    }

    /**
     *
     * 以Bean的方式存储bean对象
     * 读取Excel文件的数�?
     * @param filePath   excel 文件的路
     * @param headTitle
     * @param clazz
     * @return
     */
    public Map<String,List<T>> readEXCELBean(String filePath, String[] headTitle, Class<T> clazz){
        //获取workbook对象
        Workbook workbook=getExcelWorkBook(filePath);
        //获取sheet页数
        int sheetNum=workbook.getNumberOfSheets();
        //存储excel相关的数�?
        Map<String,List<T>> excelData=new HashMap<String,List<T>>();
        //遍历相关sheet页面获取相关的数�?
        if(sheetNum>0){
            for (int index = 0; index < sheetNum; index++) {
                //创建sheet
                Sheet sheet=workbook.getSheetAt(index);
                //获取sheet的名�?
                String sheetName=workbook.getSheetName(index);
                //获取相关的数�?
                List<T> sheetData=getExcelBeanData(sheet, headTitle,clazz);
                excelData.put(sheetName, sheetData);
            }
        }
        return excelData;
    }


    /**
     * 获取sheet表中的数�?
     * @param sheet
     * @param sheet�?eadTitle bean每列对应的属性数�?
     * @param clazz   bean对应的类
     * @throws InstantiationException
     */
    @SuppressWarnings("unused")
    private List<T> getExcelBeanData(Sheet sheet, String[] headTitle, Class<T> clazz) {
        //获取�?��和结束行
        int startRow=sheet.getFirstRowNum();
        int lastRow=sheet.getLastRowNum();
        List<T> allRowMapData=new ArrayList<T>();
        if(startRow!=lastRow){
            //忽略第一行数�?
            startRow=startRow+2;
            //获取行数�?
            for(int indexRow=startRow;indexRow<lastRow;indexRow++){
                Row row=sheet.getRow(indexRow);
                if(row==null){
                    continue;
                }
                int firstCellNum=0;
                int lastCellNum=headTitle.length;
                T bean=null;
                try {
                    bean = clazz.newInstance();
                    //遍历相关的列数据
                    for (int indexCol = firstCellNum; indexCol <lastCellNum; indexCol++) {
                        Cell cell=row.getCell(indexCol);
                        //indexCol=11 firstCellNum 0 lastCellNum=11
                        //System.out.println("indexCol="+indexCol+"firstCellNum "+firstCellNum+" lastCellNum="+lastCellNum+" headTitle.length"+headTitle.length);
                        String cellKey=headTitle[indexCol-firstCellNum];
                        if(cell==null){
                            continue;
                        }
                        //获取列的数据的信�?
                        Object cellValue = getCellValue(cell);
                        try {
                            BeanUtils.setProperty(bean, cellKey, cellValue);
                        } catch (InvocationTargetException e) {
                            e.printStackTrace();
                        }
                    }
                    allRowMapData.add(bean);
                } catch (InstantiationException e1) {
                    e1.printStackTrace();
                } catch (IllegalAccessException e1) {
                    e1.printStackTrace();
                }
            }
        }

        return allRowMapData;
    }

    /**
     * 获取sheet表中的数�?
     * @param sheet
     * @return�?eadTitle 格式�?.1.2....列标做为key
     */
    private List<Map<String,Object>> getExcelMapData(Sheet sheet, String[] headTitle){
        //获取�?��和结束行
        int startRow=sheet.getFirstRowNum();
        int lastRow=sheet.getLastRowNum();
        List<Map<String,Object>> allRowMapData=new ArrayList<Map<String,Object>>();
        if(startRow!=lastRow){
            //忽略第一行数�?
            startRow=startRow+1;
            //获取行数�?
            for(int indexRow=startRow;indexRow<lastRow;indexRow++){
                Row row=sheet.getRow(indexRow);
                if(row==null){
                    continue;
                }
                int firstCellNum=row.getFirstCellNum();
                //int lastCellNum=row.getLastCellNum();  //动态
                int lastCellNum=headTitle.length;
                Map<String,Object> RowDataMap=new HashMap<String,Object>();
                //遍历相关的列数据
                for (int indexCol = firstCellNum; indexCol <lastCellNum; indexCol++) {
                    Cell cell=row.getCell(indexCol);
                    String cellKey=headTitle[indexCol-firstCellNum];
                    if(cell==null){
                        RowDataMap.put(cellKey, "");
                        continue;
                    }
                    //获取列的数据的信�?
                    Object cellValue = getCellValue(cell);
                    RowDataMap.put(cellKey, cellValue);
                }
                allRowMapData.add(RowDataMap);
            }
        }

        return allRowMapData;
    }

    /**
     * 获取列的数据信息
     * @param cell
     * @return
     */
    private Object getCellValue(Cell cell) {
        Object cellValue=null;
        switch (cell.getCellType()) {
            case Cell.CELL_TYPE_BLANK:
                cellValue = "";
                break;
            case Cell.CELL_TYPE_ERROR:
                cellValue = Byte.toString(cell.getErrorCellValue());
                break;
            case Cell.CELL_TYPE_STRING:
                cellValue= cell.getRichStringCellValue().getString();
                break;
            /** 在excel�?日期也是数字,在此要进行判�?*/
            case Cell.CELL_TYPE_NUMERIC:
                double number=cell.getNumericCellValue();
                if (DateUtil.isCellDateFormatted(cell)) {
                    cellValue =getTime(number);
                } else {
                    cellValue= Integer.toString((int) cell.getNumericCellValue());
                }
                break;
            case Cell.CELL_TYPE_BOOLEAN:
                cellValue= Boolean.toString(cell.getBooleanCellValue());
                break;
            case Cell.CELL_TYPE_FORMULA:
                cellValue= cell.getCellFormula();
                break;
            default:
                cellValue = "";
        }
        return cellValue;
    }
    /**
     * [正确地处理整数后自动加零的情况]</li>
     * @return
     */
    private static String getTime(double daynum)
    {
        double totalSeconds=daynum*86400.0D;
        //总的分钟数
        int seconds =(int)totalSeconds/60;
        //实际小时数
        int hours =seconds/60;
        int minutes = seconds-hours*60;
        //剩余的实际分钟数
        StringBuffer sb=new StringBuffer();
        if(String.valueOf(hours).length()==1){
            sb.append("0"+hours);
        }else{
            sb.append(hours);
        }
        sb.append(":");
        if(String.valueOf(minutes).length()==1){
            sb.append("0"+minutes);
        }else{
            sb.append(minutes);
        }
        return sb.toString();
    }    /**
     * 根据文件的路径创建Workbook对象
     * @param filePath
     */
    private Workbook getExcelWorkBook(String filePath) {
        InputStream ins = null;
        Workbook book = null;
        try {
            ins=new FileInputStream(new File(filePath));
            //ins= ExcelService.class.getClassLoader().getResourceAsStream(filePath);
            try {
                book = WorkbookFactory.create(ins);
            } catch (InvalidFormatException e) {
                e.printStackTrace();
            }
            ins.close();
            return book;
        } catch (FileNotFoundException e1) {
            e1.printStackTrace();
        }catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (ins != null) {
                try {
                    ins.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }



    /**
     * 创建TableView类型的Excel文件
     * @param excelVo excel模型
     * @throws IOException
     */
    public void createTableViewerExcelFile(ExcelVO excelVo) throws IOException{
        //创建一个EXCEL

        Workbook wb =null;
        //支持2007
        if("xlsx".equals(excelVo.getPrefix())){
            wb=new XSSFWorkbook();
            //支持97 ~2003
        }else{
            wb=new HSSFWorkbook();
        }
        List<SheetVO> sheetList=excelVo.getSheets();
        if(CollectionUtils.isNotEmpty(sheetList)){
            for (int sheet = 0; sheet < sheetList.size(); sheet++) {
                createExcelSheet(wb, sheetList, sheet);
            }
        }

        //仅作测试在本地生成文件
        FileOutputStream fileOut = new FileOutputStream(excelVo.getPath());
        wb.write(fileOut);
        fileOut.flush();
        fileOut.close();
    }


    /**
     * 创建TableView类型的Excel文件
     * @param excelVo excel模型
     * @throws IOException
     */
    public InputStream createTableViewerExcelStream(ExcelVO  excelVo) throws IOException{
        //创建一个EXCEL
        Workbook wb =null;
        //支持2007
        if("xlsx".equals(excelVo.getPrefix())){
            wb=new XSSFWorkbook();
            //支持97 ~2003
        }else{
            wb=new HSSFWorkbook();
        }
        List<SheetVO> sheetList=excelVo.getSheets();
        if(CollectionUtils.isNotEmpty(sheetList)){
            for (int sheet = 0; sheet < sheetList.size(); sheet++) {
                createExcelSheet(wb, sheetList, sheet);
            }
        }
        //存储流信息
        ByteArrayOutputStream  out = new ByteArrayOutputStream();
        wb.write(out);


        //临时存储流信息
        ByteArrayInputStream in  = new ByteArrayInputStream(out.toByteArray());
        out.close();
        return in;
    }
    /**
     * 创建Excel的Sheet
     * @param wb  Excel的对象
     * @param sheetList
     * @param sheetNum
     */
    private void createExcelSheet(Workbook wb, List<SheetVO> sheetList, int sheetNum) {
        SheetVO sheetVo=sheetList.get(sheetNum);
        //获取各种样式
        //获取数据格式化对象
        DataFormat dataformat = wb.createDataFormat();
        //获取Sheet的名称
        String sheetName=sheetVo.getSheetName();
        //创建Sheet
        Sheet sheet=wb.createSheet(sheetName);
        // create 2 cell styles
        CellStyle cs = wb.createCellStyle();
        CellStyle cs2 = wb.createCellStyle();
        DataFormat df = wb.createDataFormat();

        // create 2 fonts objects
        Font f = wb.createFont();
        Font f2 = wb.createFont();

        // Set font 1 to 12 point type, blue and bold
        f.setFontHeightInPoints((short) 12);
        f.setColor( IndexedColors.RED.getIndex());
        //f.setBoldweight(Font.BOLDWEIGHT_BOLD);

        // Set font 2 to 10 point type, red and bold
        f2.setFontHeightInPoints((short) 10);
        f2.setColor( IndexedColors.RED.getIndex() );
        //f2.setBoldweight(Font.BOLDWEIGHT_BOLD);

        // Set cell style and formatting
        cs.setFont(f);
        cs.setDataFormat(df.getFormat("#,##0.0"));

        // Set the other cell style and formatting
        //cs2.setBorderBottom(cs2.BORDER_THIN);
        cs2.setDataFormat(df.getFormat("text"));
        cs2.setFont(f2);


        //获取开始写的行号
        int rowNum=sheetVo.getRowNum();
        //创建标题
        //Row headerRow = sheet.createRow(0);
        //headerRow.setHeightInPoints(40.0F);
        //Cell titleCell = headerRow.createCell(0);
        //titleCell.setCellValue(sheetVo.getTitle());
        //sheet.addMergedRegion(CellRangeAddress.valueOf("$A$1:$T$1"));

        CreationHelper createHelper = wb.getCreationHelper();
        String[] headerTitles=sheetVo.getHeaderTitle();
        if(!ArrayUtils.isEmpty(headerTitles)){
            //创建表头
            Row row = sheet.createRow((short)rowNum);
            for (int index=0; index < headerTitles.length; index++) {
                CellStyle style = wb.createCellStyle();
                //style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
                //style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
                //style.setBorderRight(HSSFCellStyle.BORDER_THIN);
                //style.setBorderTop(HSSFCellStyle.BORDER_THIN);
                style.setLocked(true);
                style.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
                //style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
                Font font = wb.createFont();
                font.setColor(HSSFColor.BLACK.index);
                font.setFontHeightInPoints((short) 12);
                //font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
                style.setFont(font);

                //创建列信息
                String headerTitle=headerTitles[index];
                Cell cell = row.createCell(index);
                cell.setCellValue(createHelper.createRichTextString(headerTitle));

                String[] column = headerTitles[index].split("_#_");
                sheet.setColumnWidth(index, Integer.valueOf(column[1]));
                cell.setCellValue(column[0]);

                //设置列宽，行高
                cell.setCellStyle(style);
                //sheet.setColumnWidth((short)index, 8000);
            }
            //行记录添加
            rowNum++;
        }
        //编写shett的内容
        List<Map<String,Object>> contentMap=sheetVo.getSheetContentMap();
        if(CollectionUtils.isNotEmpty(contentMap)){
            for (int index = 0; index < contentMap.size(); index++) {
                Map<String,Object> rowMap=contentMap.get(index);
                Row row = sheet.createRow((short)rowNum);
                createCell(wb, dataformat, rowMap, row,sheetVo);
                rowNum++;
            }
        }
    }

    /**
     * 创建Excel的Cell
     * @param wb
     * @param dataformat
     * @param rowMap
     * @param row
     */
    private void createCell(Workbook wb, DataFormat dataformat,
                            Map<String, Object> rowMap, Row row, SheetVO sheetVo) {
        String[] headerTitles=sheetVo.getTitles();
        if(MapUtils.isNotEmpty(rowMap)){
            CreationHelper createHelper = wb.getCreationHelper();
            for (int cellNum=0;cellNum<headerTitles.length;cellNum++) {
                CellStyle style;
                //创建列值
                Cell cell = row.createCell(cellNum);
                String key=headerTitles[cellNum];
                Object cellValue=rowMap.get(key);

                if(cellValue instanceof String){
                    cell.setCellValue(createHelper.createRichTextString((String)cellValue));
                }else if((cellValue instanceof Integer)||(cellValue instanceof Long)){
                    cell.setCellValue(createHelper.createRichTextString(cellValue.toString()));
                    //针对带小数点的数据的处理
                }else if((cellValue instanceof Double)||(cellValue instanceof Float)){
                    cell.setCellValue(Double.valueOf(cellValue.toString()));
                    style = wb.createCellStyle();
                    style.setDataFormat(dataformat.getFormat("#.##"));
                    //设定样式
                    cell.setCellStyle(style);
                    //针对Date格式
                }else if(cellValue instanceof Date){
                    /*
                     * 定义显示日期的公共格式
                     * 如:yyyy-MM-dd hh:mm
                     * */
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    String newdate = sdf.format(new Date());
                    // 填充出产日期
                    cell.setCellValue(createHelper.createRichTextString(newdate));
                }else if(cellValue instanceof Boolean){
                    cell.setCellValue((Boolean)cellValue);
                }
            }
        }
    }



    /**
     * 测试数据
     */
    public static void writeExcel() throws Exception {

        //创建一个EXCEL
        ExcelVO excelVo=new ExcelVO();
        excelVo.setPath("/Users/zhengweilin/Desktop/software/test_poi.xlsx");
        excelVo.setPrefix("xlsx");
        List<SheetVO> sheetInfoList=new ArrayList<SheetVO>();
        for (int i = 0; i < 1; i++) {
            SheetVO sheetVo=new SheetVO();
            sheetVo.setHeaderTitle(new String[]{"问题编号_#_3000","项目名称_#_8000","项目问题数量_#_4000"});
            sheetVo.setRowNum(0);
            sheetVo.setTitles(new String[]{"0","1","2"});
            sheetVo.setSheetName("项目名称"+i);
            sheetVo.setTitle("易程股份有限公司");
            List<Map<String, Object>> sheetContentMap=new ArrayList<Map<String, Object>>();
            for (int j = 0; j <20; j++) {
                Map<String, Object> map=new HashMap<String,Object>();
                map.put("0", "问题"+j);
                map.put("1", "项目名称"+ LocalDate.now());
                map.put("2", j+"");
                sheetContentMap.add(map);
            }
            sheetVo.setSheetContentMap(sheetContentMap);
            sheetInfoList.add(sheetVo);
        }
        excelVo.setSheets(sheetInfoList);
        new ExcelService().createTableViewerExcelFile(excelVo);
    }
    public static void readExcel(){
        //以map方式遍历
        ExcelService  excelService0=new ExcelService();

        String[] trianDeatailheadTitle=new String[]{"trainCode","startionName","startTime","arriveTime","km"};
        Map<String,List<Map<String,Object>>> list0=excelService0.readEXCELMap("C:/Users/kingwins111/Desktop/Book1.xlsx", trianDeatailheadTitle);
    }



    public static void main(String[] args) throws Exception {
        writeExcel();
        //readExcel();
    }
}  
