package com.bindingdai.repository;

import com.bindingdai.model.DoctorTableEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by daibinding on 15/10/17.
 */
@Repository
public interface DoctorRepository extends JpaRepository<DoctorTableEntity,Integer>{

}
