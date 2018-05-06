package com.summer.manage.converter;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;
import java.util.List;
import java.util.Map;

@Converter
public class MapConverter implements AttributeConverter<Map<String,Object>, String> {

    @Override
    public String convertToDatabaseColumn(Map<String, Object> stringObjectMap) {
        return JSON.toJSONString(stringObjectMap);
    }

    @Override
    public Map<String, Object> convertToEntityAttribute(String s) {
        return JSON.parseObject(s);
    }
}