package com.likunlong.house.biz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.likunlong.house.common.model.Blog;
import com.likunlong.house.common.page.PageParams;

@Mapper
public interface BlogMapper {

  public List<Blog> selectBlog(@Param("blog")Blog query, @Param("pageParams")PageParams params);

  public Long selectBlogCount(Blog query);

  @Insert("INSERT INTO blog(TAGS,CONTENT,create_time,TITLE,CAT) VALUES(#{tags},#{content},#{createTime},#{title},#{cat})")
  Integer insert(Blog blog);
}
