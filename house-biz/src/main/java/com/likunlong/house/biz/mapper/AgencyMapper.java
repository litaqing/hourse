package com.likunlong.house.biz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.likunlong.house.common.model.Agency;
import com.likunlong.house.common.model.User;
import com.likunlong.house.common.page.PageParams;

@Mapper
public interface AgencyMapper {
  
    List<Agency> select(Agency agency);

    int insert(Agency agency);

    List<User>	selectAgent(@Param("user") User user,@Param("pageParams") PageParams pageParams);

	Long selectAgentCount(@Param("user")User user);

}
