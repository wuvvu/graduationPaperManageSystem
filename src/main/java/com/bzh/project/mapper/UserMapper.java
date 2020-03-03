package com.bzh.project.mapper;

import com.bzh.project.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserMapper {

    @Select("select * from user where username = #{username}")
    User getUserByUsername(String username);


    User get(User user);

//    @Transactional
//    User update(User user);

}
