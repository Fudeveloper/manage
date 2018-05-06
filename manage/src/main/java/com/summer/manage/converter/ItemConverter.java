package com.summer.manage.converter;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;
import java.util.List;

@Converter
public class ItemConverter implements AttributeConverter<List<String>, String> {
    @Override
    public String convertToDatabaseColumn(List<String> items) {
        return JSON.toJSONString(items);
    }

    @Override
    public List<String> convertToEntityAttribute(String s) {
        return JSON.parseObject(s, new TypeReference<List<String>>() {
        });
    }
}