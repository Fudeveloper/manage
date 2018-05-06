package com.summer.manage.dao;

import com.summer.manage.entity.File;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface FileDao extends JpaRepository<File,Long> {

}
