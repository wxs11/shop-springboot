import request from '../utils/request';

//积分兑换，请求参数：用户名，积分
export const buy = query=>{
    return request({
        url:"buy",
        method:'post',
        params:query
    });
};