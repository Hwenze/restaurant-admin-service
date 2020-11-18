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
  
}

module.exports = UserService;
