package com.qingge.springboot.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.entity.Gift;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author wxs
 * @since 2022-04-22
 */
public interface GiftMapper extends BaseMapper<Gift> {

    Page<Gift> findPage(Page<Gift> page, String name, String price);
}
