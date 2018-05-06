package com.summer.manage.service;

import com.summer.manage.common.BaseService;
import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.entity.Dictionary;

import javax.transaction.Transactional;
import java.util.List;

public interface DictionaryService  extends BaseService<Dictionary> {
    /**
     * 添加字典
     */
    void addDictionary(String name,String... key);

    List<Dictionary> findByNameList(String string);

    int findByNameKey(String name, String key);
    Dictionary findByNameAndKey(String name, String key);
}
