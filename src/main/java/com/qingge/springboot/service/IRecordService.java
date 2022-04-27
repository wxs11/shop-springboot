package com.qingge.springboot.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.entity.Record;
import com.baomidou.mybatisplus.extension.service.IService;
import com.qingge.springboot.entity.User;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author wxs
 * @since 2022-04-22
 */
public interface IRecordService extends IService<Record> {


    void insertRecord(Record record);

//    List<Record> findByUname(QueryWrapper<Record> queryWrapper);

    Page<Record> findPageByUname(Page<Record> page, String username, String name, String spend);
}
