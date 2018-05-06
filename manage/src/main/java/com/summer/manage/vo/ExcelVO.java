package com.summer.manage.vo;

import java.util.List;

/** 
 *  
 * @Title:  
 * @Description: 实现Excel中WorkBook模型 
 * @Copyright:Copyright (c) 2011 
 * @Company:易程科技股份有限公司 
 * @Date:2012-4-13 
 * @author  longgangbai 
 * @version 1.0 
 */  
public class ExcelVO {  
    private String path;  
    private List<SheetVO> sheets;
    private String prefix;  
      
    public String getPrefix() {  
        return prefix;  
    }  
    public void setPrefix(String prefix) {  
        this.prefix = prefix;  
    }  
    public String getPath() {  
        return path;  
    }  
    public void setPath(String path) {  
        this.path = path;  
    }  
    public List<SheetVO> getSheets() {
        return sheets;  
    }  
    public void setSheets(List<SheetVO> sheet) {
        this.sheets = sheet;  
    }  
}  