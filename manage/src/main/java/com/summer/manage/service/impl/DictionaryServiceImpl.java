package com.summer.manage.service.impl;

import com.summer.manage.common.impl.BaseServiceImpl;
import com.summer.manage.dao.DictionaryDao;
import com.summer.manage.entity.Dictionary;
import com.summer.manage.entity.QDictionary;
import com.summer.manage.service.DictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class DictionaryServiceImpl extends BaseServiceImpl<Dictionary> implements DictionaryService {
    @Autowired
    DictionaryDao dictionaryDao;


    @Override
    @Transactional
    public void addDictionary(String name, String... key) {
        Dictionary dictionary = new Dictionary();
        dictionary.setName(name);
        dictionary.setPid(0);
        long id = dictionaryDao.save(dictionary).getId();
        for (String s : key) {
            dictionary = new Dictionary();
            dictionary.setPid(id);
            dictionary.setName(s);
            dictionaryDao.saveAndFlush(dictionary);
        }
    }

    @Override
    public List<Dictionary> findByNameList(String string) {
        return dictionaryDao.findByName(string);
    }

    @Override
    public int findByNameKey(String name, String key) {
        return Math.toIntExact(dictionaryDao.findByNameAndKey(name, key));
    }

    @Override
    public Dictionary findByNameAndKey(String name, String key) {
        QDictionary qDictionary = QDictionary.dictionary;
        return queryFactory.selectFrom(qDictionary).where(qDictionary.name.eq(key).and(qDictionary.parentName.eq(name))).fetchOne();
    }
}
