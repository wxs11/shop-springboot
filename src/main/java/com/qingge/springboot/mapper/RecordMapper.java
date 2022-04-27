package com.qingge.springboot.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.entity.Record;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author wxs
 * @since 2022-04-22
 */
public interface RecordMapper extends BaseMapper<Record> {

    /**
     * 新增消费记录
     * @param record
     */
    void insertRecord(Record record);

    Page<Record> findPageByUname(Page<Record> page, String username, String name, String spend);
}
