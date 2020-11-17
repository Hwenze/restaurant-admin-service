// app/service/User.js
const Service = require('egg').Service;

class OperateService extends Service {

  // 根据店铺身份查询该店员工列表
  async queryUserListByAdminId(option) {
    const { ctx, app } = this;
    const { admin_id = '' } = await ctx.service.common.getUserInfo();
    const { page = {}, column = {} } = option;
    const { pageSize = 10, current = 0 } = page;
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

  // 根据店铺身份返回店铺下面的所有权限列表
  async queryRoleListByAdminId() {
    const { ctx, app } = this;
    const { admin_id = '' } = await ctx.service.common.getUserInfo();
    return await app.mysql.select('admin_role', {
      columns: ['id', 'name', 'create_time', 'status'],
      where: { admin_id }, // WHERE 条件
      orders: [['id', 'desc']], // 排序方式
    });
  }

  // 根据权限id返回权限内容
  async queryRoleInfoByRoleId(id) {
    const { app } = this;
    return await app.mysql.get('admin_role', { id });
  }

  // 删除权限
  async deleteRoleById(id) {
    const { app } = this;
    return await app.mysql.delete('admin_role', { id });
  }
}



module.exports = OperateService;