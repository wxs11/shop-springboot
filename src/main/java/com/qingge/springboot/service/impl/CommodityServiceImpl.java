package com.qingge.springboot.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.entity.Commodity;
import com.qingge.springboot.entity.User;
import com.qingge.springboot.mapper.CommodityMapper;
import com.qingge.springboot.service.ICommodityService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wxs
 * @since 2022-04-22
 */
@Service
public class CommodityServiceImpl extends ServiceImpl<CommodityMapper, Commodity> implements ICommodityService {
    @Override
    public Page<Commodity> findPage(Page<Commodity> page, String name, String price) {
        return baseMapper.findPage(page, name, price);
    }
}
