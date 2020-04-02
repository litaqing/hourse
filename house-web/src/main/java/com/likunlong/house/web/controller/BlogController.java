package com.likunlong.house.web.controller;

import java.util.List;

import com.likunlong.house.common.constants.CommonConstants;
import com.likunlong.house.common.model.Blog;
import com.likunlong.house.common.model.Comment;
import com.likunlong.house.common.model.House;
import com.likunlong.house.common.model.User;
import com.likunlong.house.common.result.ResultMsg;
import com.likunlong.house.web.interceptor.UserContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.likunlong.house.biz.service.BlogService;
import com.likunlong.house.biz.service.CommentService;
import com.likunlong.house.biz.service.RecommendService;
import com.likunlong.house.common.page.PageData;
import com.likunlong.house.common.page.PageParams;

@Controller
public class BlogController {
  
  @Autowired
  private BlogService blogService;
  
  @Autowired
  private CommentService commentService;
  
  @Autowired
  private RecommendService recommendService;
  
  @RequestMapping(value="blog/list",method={RequestMethod.POST,RequestMethod.GET})
  public String list(Integer pageSize, Integer pageNum, Blog query, ModelMap modelMap){
    PageData<Blog> ps = blogService.queryBlog(query,PageParams.build(pageSize, pageNum));
    List<House> houses =  recommendService.getHotHouse(CommonConstants.RECOM_SIZE);
    modelMap.put("recomHouses", houses);
    modelMap.put("ps", ps);
    return "/blog/listing";
  }
  
  @RequestMapping(value="blog/detail",method={RequestMethod.POST,RequestMethod.GET})
  public String blogDetail(int id,ModelMap modelMap){
    Blog blog = blogService.queryOneBlog(id);
    List<Comment> comments = commentService.getBlogComments(id,8);
    List<House> houses =  recommendService.getHotHouse(CommonConstants.RECOM_SIZE);
    modelMap.put("recomHouses", houses);
    modelMap.put("blog", blog);
    modelMap.put("commentList", comments);
    return "/blog/detail";
  }

  @RequestMapping("blog/create")
  public String agencyCreate(){
    User user =  UserContext.getUser();
    if (user == null ) {
      return "redirect:/accounts/signin?" + ResultMsg.successMsg("请先登录").asUrlParams();
    }
    return "/blog/create";
  }
  @RequestMapping("blog/submit")
  public String agencySubmit(Blog blog){
    User user =  UserContext.getUser();
    if (user == null ) {//只有超级管理员可以添加
      return "redirect:/accounts/signin?" + ResultMsg.successMsg("请先登录").asUrlParams();
    }
    blogService.insertblog(blog);
    return "redirect:/index?" + ResultMsg.successMsg("创建成功").asUrlParams();
  }
}
