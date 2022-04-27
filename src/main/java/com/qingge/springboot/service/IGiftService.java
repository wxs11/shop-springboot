package com.qingge.springboot.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.entity.Gift;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author wxs
 * @since 2022-04-22
 */
public interface IGiftService extends IService<Gift> {

    Page<Gift> findPage(Page<Gift> page, String name, String price);
}
