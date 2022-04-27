package com.qingge.springboot.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.entity.Gift;
import com.qingge.springboot.mapper.GiftMapper;
import com.qingge.springboot.service.IGiftService;
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
public class GiftServiceImpl extends ServiceImpl<GiftMapper, Gift> implements IGiftService {
    @Override
    public Page<Gift> findPage(Page<Gift> page, String name, String price) {
        return baseMapper.findPage(page,name,price);
    }
}
