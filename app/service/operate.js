// app/service/User.js
const Service = require('egg').Service;

class OperateService extends Service {

  // 根据店铺身份查询该店员工列表
  async queryUserListByAdminId(option) {
    const { ctx, app } = this;
    const { admin_id = '' } = await ctx.service.common.getUserInfo();
    const { page = {}, column = {} } = option;
    const { pageSize = 10, current = 0 } = page;
    console.log({ admin_id, ...column });
    const result = await app.mysql.select('admin_userinfo', {
      where: { admin_id, ...column }, // WHERE 条件
      orders: [['id', 'desc']], // 排序方式
      limit: pageSize,
      offset: current * pageSize, // 数据偏移量
    });
    const total = await app.mysql.count('admin_userinfo', { admin_id, ...column });

    return {
      list: result,
      total: total || 0,
      current,
      pageSize
    };
  }
}



module.exports = OperateService;