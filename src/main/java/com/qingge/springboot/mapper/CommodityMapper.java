package com.qingge.springboot.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.entity.Commodity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author wxs
 * @since 2022-04-22
 */
public interface CommodityMapper extends BaseMapper<Commodity> {

    Page<Commodity> findPage(Page<Commodity> page, @Param("name") String name,@Param("price") String price);
}
