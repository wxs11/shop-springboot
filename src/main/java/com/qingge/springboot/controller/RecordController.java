package com.qingge.springboot.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.entity.User;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.qingge.springboot.common.Result;

import com.qingge.springboot.service.IRecordService;
import com.qingge.springboot.entity.Record;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author wxs
 * @since 2022-04-22
 */
@RestController
@RequestMapping("/record")
public class RecordController {

    @Resource
    private IRecordService recordService;

    // 新增或者更新
    @PostMapping
    public Result save(@RequestBody Record record) {
        recordService.saveOrUpdate(record);
        return Result.success();
    }
    // 新增
    @PostMapping("/save")
    public Result saveCord(@RequestBody Record record) {
        recordService.insertRecord(record);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        recordService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        recordService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    public Result findAll() {
        return Result.success(recordService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(recordService.getById(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                                @RequestParam Integer pageSize) {
        QueryWrapper<Record> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        return Result.success(recordService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

    @GetMapping("/findByUname/{username}")
    public Result findByUsername(@PathVariable String username) {
        QueryWrapper<Record> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", username);
        List<Record> list = recordService.list(queryWrapper);
        return Result.success(list);
    }
    @GetMapping("/pageByUname")
    public Result findPageByUname(@RequestParam Integer pageNum,
                                  @RequestParam Integer pageSize,
                                  @RequestParam(defaultValue = "") String username,
                                  @RequestParam(defaultValue = "") String name,
                                  @RequestParam(defaultValue = "") String spend ) {
        return Result.success(recordService.findPageByUname(new Page<>(pageNum, pageSize), username, name, spend));
    }

}

