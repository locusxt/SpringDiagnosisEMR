package com.bindingdai.repository;

import com.bindingdai.model.PatientEntity;
import com.bindingdai.model.SymptomEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by daibinding on 16/4/19.
 */
@Repository
public interface SymptomRepository extends JpaRepository<SymptomEntity,Integer>{

}

