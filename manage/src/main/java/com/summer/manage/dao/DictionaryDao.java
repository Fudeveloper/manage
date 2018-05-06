package com.summer.manage.dao;

import com.summer.manage.entity.Dictionary;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface DictionaryDao extends JpaRepository<Dictionary, Long> {

    @Query(value = "select d from Dictionary d where d.pid IN (select d.id from Dictionary  d where d.name = :name)")
    List<Dictionary> findByName(@Param("name") String name);

    @Query(value = "SELECT s.id FROM Dictionary s WHERE s.pid IN (SELECT d.id FROM Dictionary d WHERE name = :name) AND s.name= :key")
    Long findByNameAndKey(@Param("name") String name, @Param("key") String key);
}
