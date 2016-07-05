package com.bindingdai.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.bindingdai.model.*;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by daibinding on 16/4/19.
 */
@Repository
public interface PatientRepository extends JpaRepository<PatientEntity,Integer>{

}

