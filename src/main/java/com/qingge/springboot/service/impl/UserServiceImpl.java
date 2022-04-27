package com.qingge.springboot.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.log.Log;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.common.Constants;
import com.qingge.springboot.common.Result;
import com.qingge.springboot.common.RoleEnum;
import com.qingge.springboot.controller.dto.UserDTO;
import com.qingge.springboot.controller.dto.UserPasswordDTO;
import com.qingge.springboot.entity.Gift;
import com.qingge.springboot.entity.Menu;
import com.qingge.springboot.entity.Record;
import com.qingge.springboot.entity.User;
import com.qingge.springboot.exception.ServiceException;
import com.qingge.springboot.mapper.GiftMapper;
import com.qingge.springboot.mapper.RoleMapper;
import com.qingge.springboot.mapper.RoleMenuMapper;
import com.qingge.springboot.mapper.UserMapper;
import com.qingge.springboot.service.IGiftService;
import com.qingge.springboot.service.IMenuService;
import com.qingge.springboot.service.IRecordService;
import com.qingge.springboot.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qingge.springboot.utils.TokenUtils;
import org.omg.CORBA.SystemException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 青哥哥
 * @since 2022-01-26
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    private static final Log LOG = Log.get();

    @Resource
    private UserMapper userMapper;

    @Resource
    private RoleMapper roleMapper;

    @Resource
    private GiftMapper giftMapper;

    @Resource
    private IRecordService recordService;
    @Resource
    private RoleMenuMapper roleMenuMapper;

    @Resource
    private IMenuService menuService;

    @Override
    public UserDTO login(UserDTO userDTO) {
        User one = getUserInfo(userDTO);
        if (one != null) {
            BeanUtil.copyProperties(one, userDTO, true);
            // 设置token
            String token = TokenUtils.genToken(one.getId().toString(), one.getPassword());
            userDTO.setToken(token);

            String role = one.getRole(); // ROLE_ADMIN
            // 设置用户的菜单列表
            List<Menu> roleMenus = getRoleMenus(role);
            userDTO.setMenus(roleMenus);
            return userDTO;
        } else {
            throw new ServiceException(Constants.CODE_600, "用户名或密码错误");
        }
    }

    @Override
    public User register(UserDTO userDTO) {
        User one = getUserInfo(userDTO);
        if (one == null) {
            one = new User();
            BeanUtil.copyProperties(userDTO, one, true);
            // 默认一个普通用户的角色
            one.setRole(RoleEnum.ROLE_USER.toString());
            save(one);  // 把 copy完之后的用户对象存储到数据库
        } else {
            throw new ServiceException(Constants.CODE_600, "用户已存在");
        }
        return one;
    }

    @Override
    public void updatePassword(UserPasswordDTO userPasswordDTO) {
        int update = userMapper.updatePassword(userPasswordDTO);
        if (update < 1) {
            throw new ServiceException(Constants.CODE_600, "密码错误");
        }
    }

    @Override
    public Page<User> findPage(Page<User> page, String username, String email, String address) {
        return userMapper.findPage(page, username, email, address);
    }

    private User getUserInfo(UserDTO userDTO) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", userDTO.getUsername());
        queryWrapper.eq("password", userDTO.getPassword());
        User one;
        try {
            one = getOne(queryWrapper); // 从数据库查询用户信息
        } catch (Exception e) {
            LOG.error(e);
            throw new ServiceException(Constants.CODE_500, "系统错误");
        }
        return one;
    }

    /**
     * 获取当前角色的菜单列表
     * @param roleFlag
     * @return
     */
    private List<Menu> getRoleMenus(String roleFlag) {
        Integer roleId = roleMapper.selectByFlag(roleFlag);
        // 当前角色的所有菜单id集合
        List<Integer> menuIds = roleMenuMapper.selectByRoleId(roleId);

        // 查出系统所有的菜单(树形)
        List<Menu> menus = menuService.findMenus("");
        // new一个最后筛选完成之后的list
        List<Menu> roleMenus = new ArrayList<>();
        // 筛选当前用户角色的菜单
        for (Menu menu : menus) {
            if (menuIds.contains(menu.getId())) {
                roleMenus.add(menu);
            }
            List<Menu> children = menu.getChildren();
            // removeIf()  移除 children 里面不在 menuIds集合中的 元素
            children.removeIf(child -> !menuIds.contains(child.getId()));
        }
        return roleMenus;
    }

    @Override
    public void buy(String username, int consumeIntegral) {
        //1.通过username查到用户对应积分
        List<User> uname = userMapper.selectByname(username);
        for (User user:
                uname) {
            //2.如果消耗积分比当前卡中积分要多，提示错误
            if(user.getIntegral()<=consumeIntegral){
                throw new ServiceException(Constants.CODE_600, "积分不足");
            }else{
                //消耗积分比当前卡中少，卡中积分减去需消耗积分
                consumeIntegral-=user.getIntegral();
                Record record2 = new Record();
                record2.setUsername(user.getUsername());
                record2.setSpend(String.valueOf(user.getIntegral()*-consumeIntegral));
//                record2.setName();
                userMapper.updateByname(user);
                recordService.insertRecord(record2);
                break;
            }
        }
    }

    @Override
    public void Ubuy(Record record) {
        //1.通过username查到用户对应积分
        List<User> uname = userMapper.selectByname(record.getUsername());
        int consumeIntegral = Integer.parseInt(record.getSpend());
        for (User user:
                uname) {
            //2.如果消耗积分比当前卡中积分要多，提示错误
            if (user.getIntegral() <= consumeIntegral) {
                throw new ServiceException(Constants.CODE_600, "积分不足");
            } else {
                //消耗积分比当前卡中少，卡中积分减去需消耗积分
                consumeIntegral -= user.getIntegral();
                Record record2 = new Record();
                record2.setSpend(String.valueOf(user.getIntegral() * -consumeIntegral));
                record2.setName(record.getName());
                userMapper.updateByname(user);
                recordService.insertRecord(record2);
                break;
            }
        }
    }
}
