package com.bindingdai.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.bindingdai.model.*;
/**
 * Created by daibinding on 16/7/2.
 */
@Repository
public interface PatientRecordRepository extends JpaRepository<PatientRecordEntity,Integer> {

}
