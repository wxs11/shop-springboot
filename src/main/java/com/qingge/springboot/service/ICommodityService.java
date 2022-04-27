package com.qingge.springboot.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.entity.Commodity;
import com.baomidou.mybatisplus.extension.service.IService;
import com.qingge.springboot.entity.User;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author wxs
 * @since 2022-04-22
 */
public interface ICommodityService extends IService<Commodity> {

    Page<Commodity> findPage(Page<Commodity> objectPage, String name, String price);


}
