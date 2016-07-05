package com.bindingdai.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.bindingdai.model.*;
/**
 * Created by daibinding on 16/4/19.
 */
@Repository
public interface DrugRepository extends JpaRepository<DrugEntity,Integer>{

}

