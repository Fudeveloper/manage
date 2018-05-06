package com.summer.manage.dao;

import com.summer.manage.entity.#(modelName);
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface #(modelName)Dao extends JpaRepository<#(modelName), Long> {


}
