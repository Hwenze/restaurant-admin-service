// app/service/User.js
const Service = require('egg').Service;
class UserService extends Service {

  // 查询用户信息
  async queryInfoByUserId(username) {
    const { ctx, app } = this;
    // 假如 我们拿到用户 id 从数据库获取用户详细信息
    return await app.mysql.get('admin_userinfo', { username });
  }

  // 查询用户路由菜单
  async queryMenuByRoleId(roleId) {
    const { ctx, app } = this;
    let roleInfo = await this.queryRoleInfoById(roleId);
    let menuInfo;
    if (roleInfo) {
      if (roleInfo.status !== 1) {
        // 999 是游客
        roleInfo = await this.queryRoleInfoById(999);
      }
      let ids = [];
      try {
        ids = roleInfo.router_ids.split(',');
      } catch (error) {
      }
      menuInfo = await app.mysql.select('admin_router', { // 搜索 post 表
        where: { status: 1, id: ids }, // WHERE 条件
        orders: [['id', 'desc']], // 排序方式
      });
    }
    return { roleInfo, menuInfo }
  }

  // 查询用户权限基础信息
  async queryRoleInfoById(roleId) {
    const { ctx, app } = this;
    return await app.mysql.get('admin_role', { id: roleId })
  }

  // 查询用户列表
  async queryUserListByAdminId(option) {
    const { ctx, app } = this;
    const { userinfo = {} } = ctx.session;
    const { admin_id = '' } = userinfo;
    const pageSize = parseInt(option.pageSize || 10);
    const current = parseInt(option.current || 1);
    const result = await app.mysql.select('admin_userinfo', { // 搜索 post 表
      where: { admin_id }, // WHERE 条件
      orders: [['id', 'desc']], // 排序方式
      limit: pageSize, // 返回数据量
      offset: current * pageSize, // 数据偏移量
    });

    const total = await app.mysql.get('admin_userinfo', { admin_id: admin_id });

    return {
      list: result,
      total: total || 0,
      current,
      pageSize
    };
  }
}

module.exports = UserService;
