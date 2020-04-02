package com.likunlong.house.biz.service;

import java.util.List;

import com.likunlong.house.biz.mapper.CityMapper;
import com.likunlong.house.common.model.City;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;

@Service
public class CityService {

    @Autowired
    CityMapper cityMapper;

    public List<City> getAllCitys() {
        List<City> all = cityMapper.getAll();
        return Lists.newArrayList(all);
    }

    public int deleteByPrimaryKey(Integer id) {
        return cityMapper.deleteByPrimaryKey(id);
    }

    public int insert(City record) {
        return cityMapper.insert(record);
    }

    public int insertOrUpdate(City record) {
        return cityMapper.insertOrUpdate(record);
    }

    public int insertOrUpdateSelective(City record) {
        return cityMapper.insertOrUpdateSelective(record);
    }

    public int insertSelective(City record) {
        return cityMapper.insertSelective(record);
    }

    public City selectByPrimaryKey(Integer id) {
        return cityMapper.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(City record) {
        return cityMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(City record) {
        return cityMapper.updateByPrimaryKey(record);
    }

    public int updateBatch(List<City> list) {
        return cityMapper.updateBatch(list);
    }

    public int batchInsert(List<City> list) {
        return cityMapper.batchInsert(list);
    }
}

