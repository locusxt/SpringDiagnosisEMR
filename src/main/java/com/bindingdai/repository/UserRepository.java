package com.bindingdai.repository;

import com.bindingdai.model.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by daibinding on 15/10/15.
 */
@Repository
public interface UserRepository extends JpaRepository<UserEntity,Integer>{

}
