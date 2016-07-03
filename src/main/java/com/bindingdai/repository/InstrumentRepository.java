package com.bindingdai.repository;

import com.bindingdai.model.DiagnosisEntity;
import com.bindingdai.model.InstrumentExamEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by daibinding on 16/4/19.
 */
@Repository
public interface InstrumentRepository extends JpaRepository<InstrumentExamEntity,Integer>{

}

